package com.jobbridge.admin.entities;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "job_requirement")
@Getter
@Setter
public class JobRequirementEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "req_id")
    private Integer reqId;

    @ManyToOne
    @JoinColumn(name = "company_id")
    private CompanyEntity company;

    @Column(name = "job_title")
    private String jobTitle;

    @Column(name = "job_description")
    private String jobDescription;

    @Column(name = "experience_required")
    private Integer experienceRequired;

    private String location;
    private String status;

    @Column(name = "posted_date")
    private LocalDate postedDate;
}
