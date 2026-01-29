using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Experience
{
    public int ExperienceId { get; set; }

    public int? JobseekerId { get; set; }

    public string? CompanyName { get; set; }

    public string? JobTitle { get; set; }

    public string? EmploymentType { get; set; }

    public DateOnly? StartDate { get; set; }

    public DateOnly? EndDate { get; set; }

    public bool? IsCurrent { get; set; }

    public string? Location { get; set; }

    public string? SkillsUsed { get; set; }

    public string? Description { get; set; }

    public decimal? YearsOfExperience { get; set; }

    public virtual Jobseeker? Jobseeker { get; set; }
}
