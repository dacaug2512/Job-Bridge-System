package com.example.demo.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.entities.*;

public interface UserRepository extends JpaRepository<UserEntity, Integer> {
	
	Optional<UserEntity> findByEmail(String email);
	Optional<UserEntity> findByUsername(String username);
	
	boolean existsByUsername(String username);

}
