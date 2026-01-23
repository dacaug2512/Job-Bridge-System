package com.example.demo.services;


import com.example.demo.dto.*;

//import com.example.auth.dto.SignupRequest;
import com.example.demo.entities.*;
import com.example.demo.repositories.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.security.JwtUtil;

	
	@Service
	public class AuthService {

	    @Autowired
	    private UserRepository userRepository;

	    @Autowired
	    private RoleRepository roleRepository;

	    @Autowired
	    private PasswordEncoder passwordEncoder;

	    @Autowired
	    private JwtUtil jwtUtil;

	    @Autowired
	    private AuthenticationManager authenticationManager;

	    public String signup(SignupRequest request) {
	        if (userRepository.findByUsername(request.getUsername()).isPresent()) {
	            return "Username already exists";
	        }

	        UserEntity user = new UserEntity();
	        user.setUsername(request.getUsername());
	        user.setPassword(passwordEncoder.encode(request.getPassword()));
	        user.setActive(true);
	        user.setFullName(request.getFullName());
	        user.setEmail(request.getEmail());
	        user.setPhone(request.getPhone());

	        RoleEntity role = roleRepository.findById(request.getRoleId()) // request.getRoleId() should be Long
	                .orElseThrow(() -> new RuntimeException("Role not found"));
	        
	        
	        
	        user.setRole(role);

	        userRepository.save(user);

	        return "User registered successfully";
	    }

	    public LoginResponse login(LoginRequest request) {
	        authenticationManager.authenticate(
	                new UsernamePasswordAuthenticationToken(
	                        request.getUsername(),
	                        request.getPassword()
	                )
	        );

	        UserEntity user = userRepository.findByUsername(request.getUsername())
	                .orElseThrow(() -> new RuntimeException("User not found"));

	        String token = jwtUtil.generateToken(user.getUsername());

	        return new LoginResponse(token, user.getUsername(), user.getRole().getRoleName());
	    }
	}

    
