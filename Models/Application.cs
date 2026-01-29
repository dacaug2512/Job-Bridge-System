using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Application
{
    public int ApplicationId { get; set; }

    public int? ReqId { get; set; }

    public int? JobseekerId { get; set; }

    public string? Status { get; set; }

    public string? CurrentStage { get; set; }

    public DateOnly? AppliedDate { get; set; }

    public string? Remarks { get; set; }

    public bool? IsActive { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Jobseeker? Jobseeker { get; set; }

    public virtual JobRequirement? Req { get; set; }

    public virtual ICollection<Shortlist> Shortlists { get; set; } = new List<Shortlist>();
}
