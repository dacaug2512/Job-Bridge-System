package com.jobbridge.admin.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jobbridge.admin.entities.ApplicationEntity;
import com.jobbridge.admin.entities.JobRequirementEntity;
import com.jobbridge.admin.entities.UserEntity;
import com.jobbridge.admin.services.AdminService;

@RestController
@RequestMapping("/admin")
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    @Autowired
    private AdminService service;

    // Recruiters
    @GetMapping("/recruiters")
    public List<UserEntity> recruiters(){
        return service.getAllRecruiters();
    }

    @PutMapping("/recruiters/{id}/approve")
    public String approve(@PathVariable int id){
        service.approveRecruiter(id);
        return "Recruiter Approved";
    }

    @PutMapping("/recruiters/{id}/reject")
    public String reject(@PathVariable int id){
        service.rejectRecruiter(id);
        return "Recruiter Rejected";
    }

    // Users
    @GetMapping("/users")
    public List<UserEntity> users(){
        return service.getAllUsers();
    }

    // Jobs
    @GetMapping("/jobs")
    public List<JobRequirementEntity> jobs(){
        return service.getAllJobs();
    }

    @DeleteMapping("/jobs/{id}")
    public String deleteJob(@PathVariable int id){
        service.removeJob(id);
        return "Job Removed";
    }

    // Rejected Applications
    @GetMapping("/applications/rejected")
    public List<ApplicationEntity> rejectedApps(){
        return service.getRejectedApplications();
    }
}
