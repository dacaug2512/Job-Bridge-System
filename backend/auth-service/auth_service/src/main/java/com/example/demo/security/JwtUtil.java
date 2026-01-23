package com.example.demo.security;
import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;


	@Component
	public class JwtUtil {

	    private final String secret = "mysecretkey123456secretkey-secretkey"; // simple secret

	    public String generateToken(String username) {
	        return Jwts.builder()
	                .setSubject(username)
	                .setIssuedAt(new Date())
	                .setExpiration(new Date(System.currentTimeMillis() + 86400000)) // 1 day
	                .signWith(SignatureAlgorithm.HS256, secret.getBytes())
	                .compact();
	    }

	    public String extractUsername(String token) {
	        return Jwts.parser()
	                .setSigningKey(secret.getBytes())
	                .parseClaimsJws(token)
	                .getBody()
	                .getSubject();
	    }

	    public boolean validateToken(String token, UserDetails userDetails) {
	        String username = extractUsername(token);
	        return username.equals(userDetails.getUsername());
	    }
	}


