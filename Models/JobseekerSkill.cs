using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class JobseekerSkill
{
    public int JobseekerSkillId { get; set; }

    public int? JobseekerId { get; set; }

    public int? SkillId { get; set; }

    public virtual Jobseeker? Jobseeker { get; set; }

    public virtual Skill? Skill { get; set; }
}
