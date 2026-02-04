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
@Table(name = "application")
@Getter
@Setter
public class ApplicationEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "application_id")
    private Integer applicationId;

    @ManyToOne
    @JoinColumn(name = "req_id")
    private JobRequirementEntity jobRequirement;

    @Column(name = "jobseeker_id")
    private Integer jobseekerId;

    private String status;

    @Column(name = "current_stage")
    private String currentStage;

    @Column(name = "applied_date")
    private LocalDate appliedDate;

    private String remarks;

    @Column(name = "is_active")
    private Boolean isActive;
}
