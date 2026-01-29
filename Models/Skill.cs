using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Skill
{
    public int SkillId { get; set; }

    public string? SkillName { get; set; }

    public string? SkillType { get; set; }

    public virtual ICollection<JobRequirement> JobRequirements { get; set; } = new List<JobRequirement>();

    public virtual ICollection<JobseekerSkill> JobseekerSkills { get; set; } = new List<JobseekerSkill>();
}
