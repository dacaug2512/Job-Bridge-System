using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class JobRequirement
{
    public int ReqId { get; set; }

    public int? CompanyId { get; set; }

    public int? DomainId { get; set; }

    public string? JobTitle { get; set; }

    public string? JobDescription { get; set; }

    public int? ExperienceRequired { get; set; }

    public decimal? MinCgpa { get; set; }

    public string? SalaryPackage { get; set; }

    public string? JobType { get; set; }

    public string? Location { get; set; }

    public int? VacancyCount { get; set; }

    public DateOnly? ApplicationDeadline { get; set; }

    public string? Status { get; set; }

    public DateOnly? PostedDate { get; set; }

    public DateTime UpdatedAt { get; set; }

    public int? SkillId { get; set; }

    public virtual ICollection<Application> Applications { get; set; } = new List<Application>();

    public virtual Company? Company { get; set; }

    public virtual Skill? Skill { get; set; }
}
