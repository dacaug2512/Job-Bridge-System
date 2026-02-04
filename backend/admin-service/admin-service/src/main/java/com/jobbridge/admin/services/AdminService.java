package com.jobbridge.admin.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobbridge.admin.entities.ApplicationEntity;
import com.jobbridge.admin.entities.JobRequirementEntity;
import com.jobbridge.admin.entities.UserEntity;
import com.jobbridge.admin.repositories.ApplicationRepository;
import com.jobbridge.admin.repositories.CompanyRepository;
import com.jobbridge.admin.repositories.JobRequirementRepository;
import com.jobbridge.admin.repositories.UserRepository;

@Service
public class AdminService {

    @Autowired
    private UserRepository UserEntityRepo;

    @Autowired
    private JobRequirementRepository jobRepo;

    @Autowired
    private ApplicationRepository appRepo;

    @Autowired
    private CompanyRepository companyRepo;

    // Recruiter Approval
    public List<UserEntity> getAllRecruiters(){
        return UserEntityRepo.findByRoleRoleName("RECRUITER");
    }

    public void approveRecruiter(int UserEntityId){
        UserEntity UserEntity = UserEntityRepo.findById(UserEntityId).get();
        UserEntity.setActive(true);
        UserEntityRepo.save(UserEntity);
    }

    public void rejectRecruiter(int UserEntityId){
        UserEntity UserEntity = UserEntityRepo.findById(UserEntityId).get();
        UserEntity.setActive(false);
        UserEntityRepo.save(UserEntity);
    }

    public List<UserEntity> getAllUsers(){
        return UserEntityRepo.findAll();
    }

    public List<JobRequirementEntity> getAllJobs(){
        return jobRepo.findAll();
    }

    public void removeJob(int jobId){
        JobRequirementEntity job = jobRepo.findById(jobId).get();
        job.setStatus("CLOSED");
        jobRepo.save(job);
    }

    public List<ApplicationEntity> getRejectedApplications(){
        return appRepo.findByStatus("REJECTED");
    }
}

