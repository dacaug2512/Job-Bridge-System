package com.example.demo.entities;

import java.time.LocalDate;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.*;
import lombok.*;
@Entity
@Table(name = "users")
@Getter
@Setter
public class UserEntity {
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    @Column(name = "user_id")
	    private Integer id;

	    private String email;

	    private String username;

	    private String password;

	    @Column(name = "full_name")
	    private String fullName;

	    private String phone;

	    @Column(name = "profile_image")
	    private String profileImage;

	    private Boolean active;

	    @ManyToOne
	    @JoinColumn(name = "role_id")
	    private RoleEntity role;

	    @Column(name = "created_at", updatable = false)
	    @CreationTimestamp
	    private LocalDate createdAt;
	


}
