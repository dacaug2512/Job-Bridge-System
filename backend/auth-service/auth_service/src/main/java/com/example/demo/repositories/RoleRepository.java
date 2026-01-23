package com.example.demo.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.*;

public interface RoleRepository extends JpaRepository<RoleEntity, Long> {
	 Optional<RoleEntity> findById(Long id);
	    Optional<RoleEntity> findByRoleName(String roleName); 

}
