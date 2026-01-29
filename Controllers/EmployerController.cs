using Job_Bridge.Models;
using JobBridge.EmployerService.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace JobBridge.EmployerService.Controllers;

[ApiController]
[Route("employer")]
[Authorize(Roles = "RECRUITER")]
public class EmployerController : ControllerBase
{
    private readonly EmployerRepository _repo;

    public EmployerController(EmployerRepository repo)
    {
        _repo = repo;
    }

    //Get userId from JWT
    private int GetUserId()
    {
        return int.Parse(User.FindFirst("sub")!.Value);
    }

    //Check admin approval
    private bool IsApproved()
    {
        var claim = User.FindFirst("active")?.Value;
        return claim != null && bool.Parse(claim);
    }

    [HttpGet("company")]
    public async Task<IActionResult> GetCompany()
    {
        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        return company == null ? NotFound() : Ok(company);
    }

    [HttpPut("company")]
    public async Task<IActionResult> UpdateCompany([FromBody] Company company)
    {
        var saved = await _repo.UpsertCompanyAsync(GetUserId(), company);
        return Ok(saved);
    }

    [HttpPost("jobs")]
    public async Task<IActionResult> CreateJob([FromBody] JobRequirement job)
    {
        if (!IsApproved())
            return Forbid("Recruiter not approved by admin");

        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null)
            return BadRequest("Create company profile first");

        var created = await _repo.CreateJobAsync(company.CompanyId, job);
        return Ok(created);
    }

    [HttpGet("jobs")]
    public async Task<IActionResult> MyJobs()
    {
        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null) return Ok(new List<JobRequirement>());

        return Ok(await _repo.GetMyJobsAsync(company.CompanyId));
    }

    [HttpPut("jobs/{reqId:int}")]
    public async Task<IActionResult> UpdateJob(int reqId, [FromBody] JobRequirement job)
    {
        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null) return Forbid();

        var ok = await _repo.UpdateJobAsync(reqId, company.CompanyId, job);
        return ok ? Ok("Updated") : NotFound();
    }

    [HttpDelete("jobs/{reqId:int}")]
    public async Task<IActionResult> CloseJob(int reqId)
    {
        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null) return Forbid();

        var ok = await _repo.DeleteJobAsync(reqId, company.CompanyId);
        return ok ? Ok("Closed") : NotFound();
    }

    [HttpGet("jobs/{reqId:int}/applications")]
    public async Task<IActionResult> Applications(int reqId)
    {
        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null) return Forbid();

        return Ok(await _repo.GetApplicationsForJobAsync(reqId, company.CompanyId));
    }

    [HttpPatch("applications/{id:int}/status")]
    public async Task<IActionResult> UpdateApplicationStatus(
        int id,
        [FromQuery] string status)
    {
        status = status.ToUpper();

        if (status != "SHORTLISTED" && status != "REJECTED" && status != "Further_Processing")
            return BadRequest("Status must be SHORTLISTED or REJECTED or Further_Processing");

        var company = await _repo.GetCompanyByUserIdAsync(GetUserId());
        if (company == null) return Forbid();

        var ok = await _repo.UpdateApplicationStatusAsync(id, company.CompanyId, status);
        return ok ? Ok("Updated") : NotFound();
    }
}
