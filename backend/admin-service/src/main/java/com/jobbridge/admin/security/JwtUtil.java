package com.jobbridge.admin.security;

import org.springframework.stereotype.Component;
import io.jsonwebtoken.Jwts;

@Component
public class JwtUtil {

    private final String SECRET = "same-secret-as-auth-service";

    public boolean validateToken(String token){
        try{
            Jwts.parser().setSigningKey(SECRET.getBytes())
                    .parseClaimsJws(token);
            return true;
        }catch(Exception e){
            return false;
        }
    }
}

