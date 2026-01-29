using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Education
{
    public int EduId { get; set; }

    public int? JobseekerId { get; set; }

    public string? Qualification { get; set; }

    public string? University { get; set; }

    public string? College { get; set; }

    public decimal? PercentageCgpa { get; set; }

    public int? YearOfPassing { get; set; }

    public string? EducationType { get; set; }

    public virtual Jobseeker? Jobseeker { get; set; }
}
