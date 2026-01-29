using System;
using System.Collections.Generic;

namespace Job_Bridge.Models;

public partial class Shortlist
{
    public int ShortlistId { get; set; }

    public int? ApplicationId { get; set; }

    public bool? Shortlisted { get; set; }

    public int? RoundNumber { get; set; }

    public DateOnly? InterviewDate { get; set; }

    public string? InterviewMode { get; set; }

    public string? InterviewerName { get; set; }

    public string? SelectionStatus { get; set; }

    public string? Feedback { get; set; }

    public bool? FinalDecision { get; set; }

    public string? Comments { get; set; }

    public DateTime UpdatedAt { get; set; }

    public virtual Application? Application { get; set; }
}
