package com.jobbridge.admin.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.jobbridge.admin.entities.JobRequirementEntity;

@Repository
public interface JobRequirementRepository extends JpaRepository<JobRequirementEntity, Integer> {
}

