using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class User
{
    public int UserId { get; set; }

    public string? Email { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }

    public string? FullName { get; set; }

    public string? Phone { get; set; }

    public string? ProfileImage { get; set; }

    public int? RoleId { get; set; }

    public bool? Active { get; set; }

    public DateOnly? CreatedAt { get; set; }

    public virtual ICollection<Company> Companies { get; set; } = new List<Company>();

    public virtual ICollection<Jobseeker> Jobseekers { get; set; } = new List<Jobseeker>();

    public virtual Role? Role { get; set; }
}
