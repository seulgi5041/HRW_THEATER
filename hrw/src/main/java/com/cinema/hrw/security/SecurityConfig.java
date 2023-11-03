package com.cinema.hrw.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain defaultSecurityFilterChain(HttpSecurity http) throws Exception {
        http
        	.csrf().disable()	// 이거 안해서 계속 403에러. (시큐리티를 추가하면 기본적으로 csrf에 대해 체크해서 Post가 정상적으로 수행 안되서 403에러난것같음.)
        						// CSRF(Cross Site Request Forgery) 사이트 간 요청 위조, 사용자가 자신의 의지와 상관없이 공격자가 의도한 행위(수정,삭제,생성)을 특정 사이트로 요청하도록 하는 공격
        						// 브라우저에 저장된 쿠키가 CSRF 공격의 매개체가 됨, 그래서 오류난듯?
            .authorizeRequests(authorizeRequests ->
                authorizeRequests
                    .anyRequest().permitAll()	// 이건 전체 페이지 권한없이 비인증자가 전부 다 할수있게함.
            );
        return http.build();
    }
	
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
