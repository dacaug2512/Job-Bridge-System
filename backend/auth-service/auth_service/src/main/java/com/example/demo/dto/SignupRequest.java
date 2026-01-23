package com.example.demo.dto;

import lombok.*;
@Getter
@Setter
public class SignupRequest {

	private String username;
    private String password;
    private String role;
    private Long roleId; // <- add this
    private String fullName;
    private String phone;
    private String email;
    private String profileImage;

    // getters and setters
    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
