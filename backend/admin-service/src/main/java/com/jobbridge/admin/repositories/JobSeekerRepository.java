package com.jobbridge.admin.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.jobbridge.admin.entities.JobSeekerEntity;

@Repository
public interface JobSeekerRepository extends JpaRepository<JobSeekerEntity, Integer> {
}

