package com.example.demo.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "role")
@Getter
@Setter
public class RoleEntity {
	
	@Id
    @Column(name = "role_id")
    private Integer id;
	
	 @Column(name = "role_name")
	    private String roleName;
}
