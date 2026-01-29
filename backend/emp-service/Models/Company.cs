using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Company
{
    public int CompanyId { get; set; }

    public string? CompanyName { get; set; }

    public string? CompanyEmail { get; set; }

    public string? Website { get; set; }

    public string? Location { get; set; }

    public string? CompanyDescription { get; set; }

    public int? UserId { get; set; }

    public DateTime CreatedAt { get; set; }

    public virtual ICollection<JobRequirement> JobRequirements { get; set; } = new List<JobRequirement>();

    public virtual User? User { get; set; }
}
