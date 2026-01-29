using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Jobseeker
{
    public int JobseekerId { get; set; }

    public int? UserId { get; set; }

    public string? ResumeUrl { get; set; }

    public string? CurrentLocation { get; set; }

    public string? Relocate { get; set; }

    public DateOnly? DateOfBirth { get; set; }

    public string? Gender { get; set; }

    public DateTime CreatedAt { get; set; }

    public virtual ICollection<Application> Applications { get; set; } = new List<Application>();

    public virtual ICollection<Education> Educations { get; set; } = new List<Education>();

    public virtual ICollection<Experience> Experiences { get; set; } = new List<Experience>();

    public virtual ICollection<JobseekerSkill> JobseekerSkills { get; set; } = new List<JobseekerSkill>();

    public virtual User? User { get; set; }
}
