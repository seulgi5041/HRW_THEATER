package com.cinema.hrw.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;



@Configuration
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeRequests(authorizeRequests ->
                authorizeRequests 
                    .antMatchers("/**").permitAll()
                    .antMatchers("/api/**").permitAll()
                    .antMatchers("/css/**", "/js/**", "/images/**").permitAll()
                    .anyRequest().authenticated()
                    
            )
            .cors()
            .and()
            .csrf().disable();

        return http.build();
    }

	
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}