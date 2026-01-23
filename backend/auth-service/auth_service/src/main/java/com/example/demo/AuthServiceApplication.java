package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication(scanBasePackages = {"com.example.demo", "controllers"})

public class AuthServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(AuthServiceApplication.class, args);
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	    System.out.println(encoder.encode("admin@123"));
	}

}
