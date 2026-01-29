using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Pomelo.EntityFrameworkCore.MySql.Scaffolding.Internal;

namespace Job_Bridge.Models;

public partial class JobBridgeContext : DbContext
{
    public JobBridgeContext()
    {
    }

    public JobBridgeContext(DbContextOptions<JobBridgeContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Application> Applications { get; set; }

    public virtual DbSet<Company> Companies { get; set; }

    public virtual DbSet<Education> Educations { get; set; }

    public virtual DbSet<Experience> Experiences { get; set; }

    public virtual DbSet<JobRequirement> JobRequirements { get; set; }

    public virtual DbSet<Jobseeker> Jobseekers { get; set; }

    public virtual DbSet<JobseekerSkill> JobseekerSkills { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Shortlist> Shortlists { get; set; }

    public virtual DbSet<Skill> Skills { get; set; }

    public virtual DbSet<User> Users { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=localhost;port=3306;user=root;password=root@123;database=job_bridge", Microsoft.EntityFrameworkCore.ServerVersion.Parse("10.4.32-mariadb"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_general_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Application>(entity =>
        {
            entity.HasKey(e => e.ApplicationId).HasName("PRIMARY");

            entity.ToTable("application");

            entity.HasIndex(e => e.JobseekerId, "fk_app_jobseeker");

            entity.HasIndex(e => e.ReqId, "fk_app_req");

            entity.Property(e => e.ApplicationId)
                .HasColumnType("int(11)")
                .HasColumnName("application_id");
            entity.Property(e => e.AppliedDate).HasColumnName("applied_date");
            entity.Property(e => e.CurrentStage)
                .HasMaxLength(50)
                .HasColumnName("current_stage");
            entity.Property(e => e.IsActive)
                .HasDefaultValueSql("'1'")
                .HasColumnName("is_active");
            entity.Property(e => e.JobseekerId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_id");
            entity.Property(e => e.Remarks)
                .HasMaxLength(200)
                .HasColumnName("remarks");
            entity.Property(e => e.ReqId)
                .HasColumnType("int(11)")
                .HasColumnName("req_id");
            entity.Property(e => e.Status)
                .HasMaxLength(50)
                .HasColumnName("status");
            entity.Property(e => e.UpdatedAt)
                .ValueGeneratedOnAddOrUpdate()
                .HasDefaultValueSql("current_timestamp()")
                .HasColumnType("timestamp")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Jobseeker).WithMany(p => p.Applications)
                .HasForeignKey(d => d.JobseekerId)
                .HasConstraintName("fk_app_jobseeker");

            entity.HasOne(d => d.Req).WithMany(p => p.Applications)
                .HasForeignKey(d => d.ReqId)
                .HasConstraintName("fk_app_req");
        });

        modelBuilder.Entity<Company>(entity =>
        {
            entity.HasKey(e => e.CompanyId).HasName("PRIMARY");

            entity.ToTable("company");

            entity.HasIndex(e => e.UserId, "fk_company_user");

            entity.Property(e => e.CompanyId)
                .HasColumnType("int(11)")
                .HasColumnName("company_id");
            entity.Property(e => e.CompanyDescription)
                .HasColumnType("text")
                .HasColumnName("company_description");
            entity.Property(e => e.CompanyEmail)
                .HasMaxLength(100)
                .HasColumnName("company_email");
            entity.Property(e => e.CompanyName)
                .HasMaxLength(100)
                .HasColumnName("company_name");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("current_timestamp()")
                .HasColumnType("timestamp")
                .HasColumnName("created_at");
            entity.Property(e => e.Location)
                .HasMaxLength(100)
                .HasColumnName("location");
            entity.Property(e => e.UserId)
                .HasColumnType("int(11)")
                .HasColumnName("user_id");
            entity.Property(e => e.Website)
                .HasMaxLength(150)
                .HasColumnName("website");

            entity.HasOne(d => d.User).WithMany(p => p.Companies)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_company_user");
        });

        modelBuilder.Entity<Education>(entity =>
        {
            entity.HasKey(e => e.EduId).HasName("PRIMARY");

            entity.ToTable("education");

            entity.HasIndex(e => e.JobseekerId, "fk_edu_jobseeker");

            entity.Property(e => e.EduId)
                .HasColumnType("int(11)")
                .HasColumnName("edu_id");
            entity.Property(e => e.College)
                .HasMaxLength(40)
                .HasColumnName("college");
            entity.Property(e => e.EducationType)
                .HasMaxLength(50)
                .HasColumnName("education_type");
            entity.Property(e => e.JobseekerId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_id");
            entity.Property(e => e.PercentageCgpa)
                .HasPrecision(4, 2)
                .HasColumnName("percentage_cgpa");
            entity.Property(e => e.Qualification)
                .HasMaxLength(30)
                .HasColumnName("qualification");
            entity.Property(e => e.University)
                .HasMaxLength(50)
                .HasColumnName("university");
            entity.Property(e => e.YearOfPassing)
                .HasColumnType("int(11)")
                .HasColumnName("year_of_passing");

            entity.HasOne(d => d.Jobseeker).WithMany(p => p.Educations)
                .HasForeignKey(d => d.JobseekerId)
                .HasConstraintName("fk_edu_jobseeker");
        });

        modelBuilder.Entity<Experience>(entity =>
        {
            entity.HasKey(e => e.ExperienceId).HasName("PRIMARY");

            entity.ToTable("experience");

            entity.HasIndex(e => e.JobseekerId, "fk_exp_jobseeker");

            entity.Property(e => e.ExperienceId)
                .HasColumnType("int(11)")
                .HasColumnName("experience_id");
            entity.Property(e => e.CompanyName)
                .HasMaxLength(150)
                .HasColumnName("company_name");
            entity.Property(e => e.Description)
                .HasColumnType("text")
                .HasColumnName("description");
            entity.Property(e => e.EmploymentType)
                .HasMaxLength(50)
                .HasColumnName("employment_type");
            entity.Property(e => e.EndDate).HasColumnName("end_date");
            entity.Property(e => e.IsCurrent).HasColumnName("is_current");
            entity.Property(e => e.JobTitle)
                .HasMaxLength(100)
                .HasColumnName("job_title");
            entity.Property(e => e.JobseekerId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_id");
            entity.Property(e => e.Location)
                .HasMaxLength(100)
                .HasColumnName("location");
            entity.Property(e => e.SkillsUsed)
                .HasMaxLength(255)
                .HasColumnName("skills_used");
            entity.Property(e => e.StartDate).HasColumnName("start_date");
            entity.Property(e => e.YearsOfExperience)
                .HasPrecision(5, 2)
                .HasColumnName("years_of_experience");

            entity.HasOne(d => d.Jobseeker).WithMany(p => p.Experiences)
                .HasForeignKey(d => d.JobseekerId)
                .HasConstraintName("fk_exp_jobseeker");
        });

        modelBuilder.Entity<JobRequirement>(entity =>
        {
            entity.HasKey(e => e.ReqId).HasName("PRIMARY");

            entity.ToTable("job_requirement");

            entity.HasIndex(e => e.CompanyId, "fk_req_company");

            entity.HasIndex(e => e.SkillId, "fk_req_skill");

            entity.Property(e => e.ReqId)
                .HasColumnType("int(11)")
                .HasColumnName("req_id");
            entity.Property(e => e.ApplicationDeadline).HasColumnName("application_deadline");
            entity.Property(e => e.CompanyId)
                .HasColumnType("int(11)")
                .HasColumnName("company_id");
            entity.Property(e => e.DomainId)
                .HasColumnType("int(11)")
                .HasColumnName("domain_id");
            entity.Property(e => e.ExperienceRequired)
                .HasColumnType("int(11)")
                .HasColumnName("experience_required");
            entity.Property(e => e.JobDescription)
                .HasColumnType("text")
                .HasColumnName("job_description");
            entity.Property(e => e.JobTitle)
                .HasMaxLength(100)
                .HasColumnName("job_title");
            entity.Property(e => e.JobType)
                .HasMaxLength(30)
                .HasColumnName("job_type");
            entity.Property(e => e.Location)
                .HasMaxLength(100)
                .HasColumnName("location");
            entity.Property(e => e.MinCgpa)
                .HasPrecision(3, 2)
                .HasColumnName("min_cgpa");
            entity.Property(e => e.PostedDate).HasColumnName("posted_date");
            entity.Property(e => e.SalaryPackage)
                .HasMaxLength(50)
                .HasColumnName("salary_package");
            entity.Property(e => e.SkillId)
                .HasColumnType("int(11)")
                .HasColumnName("skill_id");
            entity.Property(e => e.Status)
                .HasMaxLength(30)
                .HasColumnName("status");
            entity.Property(e => e.UpdatedAt)
                .ValueGeneratedOnAddOrUpdate()
                .HasDefaultValueSql("current_timestamp()")
                .HasColumnType("timestamp")
                .HasColumnName("updated_at");
            entity.Property(e => e.VacancyCount)
                .HasColumnType("int(11)")
                .HasColumnName("vacancy_count");

            entity.HasOne(d => d.Company).WithMany(p => p.JobRequirements)
                .HasForeignKey(d => d.CompanyId)
                .HasConstraintName("fk_req_company");

            entity.HasOne(d => d.Skill).WithMany(p => p.JobRequirements)
                .HasForeignKey(d => d.SkillId)
                .HasConstraintName("fk_req_skill");
        });

        modelBuilder.Entity<Jobseeker>(entity =>
        {
            entity.HasKey(e => e.JobseekerId).HasName("PRIMARY");

            entity.ToTable("jobseeker");

            entity.HasIndex(e => e.UserId, "fk_jobseeker_user");

            entity.Property(e => e.JobseekerId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_id");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("current_timestamp()")
                .HasColumnType("timestamp")
                .HasColumnName("created_at");
            entity.Property(e => e.CurrentLocation)
                .HasMaxLength(100)
                .HasColumnName("current_location");
            entity.Property(e => e.DateOfBirth).HasColumnName("date_of_birth");
            entity.Property(e => e.Gender)
                .HasMaxLength(10)
                .HasColumnName("gender");
            entity.Property(e => e.Relocate)
                .HasMaxLength(50)
                .HasColumnName("relocate");
            entity.Property(e => e.ResumeUrl)
                .HasMaxLength(255)
                .HasColumnName("resume_url");
            entity.Property(e => e.UserId)
                .HasColumnType("int(11)")
                .HasColumnName("user_id");

            entity.HasOne(d => d.User).WithMany(p => p.Jobseekers)
                .HasForeignKey(d => d.UserId)
                .HasConstraintName("fk_jobseeker_user");
        });

        modelBuilder.Entity<JobseekerSkill>(entity =>
        {
            entity.HasKey(e => e.JobseekerSkillId).HasName("PRIMARY");

            entity.ToTable("jobseeker_skill");

            entity.HasIndex(e => e.JobseekerId, "fk_js_skill_jobseeker");

            entity.HasIndex(e => e.SkillId, "fk_js_skill_skill");

            entity.Property(e => e.JobseekerSkillId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_skill_id");
            entity.Property(e => e.JobseekerId)
                .HasColumnType("int(11)")
                .HasColumnName("jobseeker_id");
            entity.Property(e => e.SkillId)
                .HasColumnType("int(11)")
                .HasColumnName("skill_id");

            entity.HasOne(d => d.Jobseeker).WithMany(p => p.JobseekerSkills)
                .HasForeignKey(d => d.JobseekerId)
                .HasConstraintName("fk_js_skill_jobseeker");

            entity.HasOne(d => d.Skill).WithMany(p => p.JobseekerSkills)
                .HasForeignKey(d => d.SkillId)
                .HasConstraintName("fk_js_skill_skill");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("PRIMARY");

            entity.ToTable("role");

            entity.Property(e => e.RoleId)
                .HasColumnType("int(11)")
                .HasColumnName("role_id");
            entity.Property(e => e.RoleName)
                .HasMaxLength(255)
                .HasColumnName("role_name");
        });

        modelBuilder.Entity<Shortlist>(entity =>
        {
            entity.HasKey(e => e.ShortlistId).HasName("PRIMARY");

            entity.ToTable("shortlist");

            entity.HasIndex(e => e.ApplicationId, "fk_shortlist_app");

            entity.Property(e => e.ShortlistId)
                .HasColumnType("int(11)")
                .HasColumnName("shortlist_id");
            entity.Property(e => e.ApplicationId)
                .HasColumnType("int(11)")
                .HasColumnName("application_id");
            entity.Property(e => e.Comments)
                .HasMaxLength(200)
                .HasColumnName("comments");
            entity.Property(e => e.Feedback)
                .HasColumnType("text")
                .HasColumnName("feedback");
            entity.Property(e => e.FinalDecision).HasColumnName("final_decision");
            entity.Property(e => e.InterviewDate).HasColumnName("interview_date");
            entity.Property(e => e.InterviewMode)
                .HasMaxLength(30)
                .HasColumnName("interview_mode");
            entity.Property(e => e.InterviewerName)
                .HasMaxLength(100)
                .HasColumnName("interviewer_name");
            entity.Property(e => e.RoundNumber)
                .HasColumnType("int(11)")
                .HasColumnName("round_number");
            entity.Property(e => e.SelectionStatus)
                .HasMaxLength(50)
                .HasColumnName("selection_status");
            entity.Property(e => e.Shortlisted).HasColumnName("shortlisted");
            entity.Property(e => e.UpdatedAt)
                .ValueGeneratedOnAddOrUpdate()
                .HasDefaultValueSql("current_timestamp()")
                .HasColumnType("timestamp")
                .HasColumnName("updated_at");

            entity.HasOne(d => d.Application).WithMany(p => p.Shortlists)
                .HasForeignKey(d => d.ApplicationId)
                .HasConstraintName("fk_shortlist_app");
        });

        modelBuilder.Entity<Skill>(entity =>
        {
            entity.HasKey(e => e.SkillId).HasName("PRIMARY");

            entity.ToTable("skill");

            entity.Property(e => e.SkillId)
                .HasColumnType("int(11)")
                .HasColumnName("skill_id");
            entity.Property(e => e.SkillName)
                .HasMaxLength(100)
                .HasColumnName("skill_name");
            entity.Property(e => e.SkillType)
                .HasMaxLength(50)
                .HasColumnName("skill_type");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PRIMARY");

            entity.ToTable("users");

            entity.HasIndex(e => e.Email, "email").IsUnique();

            entity.HasIndex(e => e.RoleId, "fk_users_role");

            entity.HasIndex(e => e.Username, "username").IsUnique();

            entity.Property(e => e.UserId)
                .HasColumnType("int(11)")
                .HasColumnName("user_id");
            entity.Property(e => e.Active)
                .HasDefaultValueSql("'1'")
                .HasColumnName("active");
            entity.Property(e => e.CreatedAt).HasColumnName("created_at");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.FullName)
                .HasMaxLength(255)
                .HasColumnName("full_name");
            entity.Property(e => e.Password)
                .HasMaxLength(255)
                .HasColumnName("password");
            entity.Property(e => e.Phone)
                .HasMaxLength(255)
                .HasColumnName("phone");
            entity.Property(e => e.ProfileImage)
                .HasMaxLength(255)
                .HasColumnName("profile_image");
            entity.Property(e => e.RoleId)
                .HasColumnType("int(11)")
                .HasColumnName("role_id");
            entity.Property(e => e.Username).HasColumnName("username");

            entity.HasOne(d => d.Role).WithMany(p => p.Users)
                .HasForeignKey(d => d.RoleId)
                .HasConstraintName("fk_users_role");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
