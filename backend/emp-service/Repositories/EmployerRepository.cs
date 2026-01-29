using Job_Bridge.Models;

using Microsoft.EntityFrameworkCore;

namespace JobBridge.EmployerService.Repositories;

public class EmployerRepository
{
    private readonly JobBridgeContext _db;
    public EmployerRepository(JobBridgeContext db) => _db = db;

    public Task<Company?> GetCompanyByUserIdAsync(int userId) =>
        _db.Companies.FirstOrDefaultAsync(c => c.UserId == userId);

    public async Task<Company> UpsertCompanyAsync(int userId, Company company)
    {
        var existing = await GetCompanyByUserIdAsync(userId);

        if (existing == null)
        {
            company.UserId = userId;
            _db.Companies.Add(company);
        }
        else
        {
            existing.CompanyName = company.CompanyName;
            existing.CompanyEmail = company.CompanyEmail;
            existing.Website = company.Website;
            existing.Location = company.Location;
            existing.CompanyDescription = company.CompanyDescription;
        }

        await _db.SaveChangesAsync();
        return existing ?? company;
    }

    public Task<List<JobRequirement>> GetMyJobsAsync(int companyId) =>
        _db.JobRequirements.Where(j => j.CompanyId == companyId).ToListAsync();

    public async Task<JobRequirement?> GetJobIfOwnedAsync(int reqId, int companyId) =>
        await _db.JobRequirements.FirstOrDefaultAsync(j => j.ReqId == reqId && j.CompanyId == companyId);

    public async Task<JobRequirement> CreateJobAsync(int companyId, JobRequirement job)
    {
        job.CompanyId = companyId;
        job.PostedDate = DateOnly.FromDateTime(DateTime.UtcNow); 
        job.Status = job.Status ?? "OPEN";
        _db.JobRequirements.Add(job);
        await _db.SaveChangesAsync();
        return job;
    }

    public async Task<bool> UpdateJobAsync(int reqId, int companyId, JobRequirement updated)
    {
        var job = await GetJobIfOwnedAsync(reqId, companyId);
        if (job == null) return false;

        job.JobTitle = updated.JobTitle;
        job.JobDescription = updated.JobDescription;
        job.ExperienceRequired = updated.ExperienceRequired;
        job.Location = updated.Location;
        job.SkillId = updated.SkillId; 
        await _db.SaveChangesAsync();
        return true;
    }

    public async Task<bool> DeleteJobAsync(int reqId, int companyId)
    {
        var job = await GetJobIfOwnedAsync(reqId, companyId);
        if (job == null) return false;
        job.Status = "CLOSED";
        await _db.SaveChangesAsync();
        return true;
    }

    public async Task<List<Application>> GetApplicationsForJobAsync(int reqId, int companyId)
    {
        var owned = await _db.JobRequirements.AnyAsync(j => j.ReqId == reqId && j.CompanyId == companyId);
        if (!owned) return new List<Application>();

        return await _db.Applications.Where(a => a.ReqId == reqId && (a.IsActive ?? true)).ToListAsync();
    }

    public async Task<bool> UpdateApplicationStatusAsync(int applicationId, int companyId, string status)
    {        var app = await _db.Applications.FirstOrDefaultAsync(a => a.ApplicationId == applicationId);
        if (app == null) return false;
        var owned = await _db.JobRequirements.AnyAsync(j => j.ReqId == app.ReqId && j.CompanyId == companyId);
        if (!owned) return false;

        app.Status = status;
        await _db.SaveChangesAsync();
        return true;
    }
}
