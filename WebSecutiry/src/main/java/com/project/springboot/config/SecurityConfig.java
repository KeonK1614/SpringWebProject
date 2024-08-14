package com.project.springboot.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity //스프링 시큐리티에게서도 관리가 됨!
public class SecurityConfig {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		
		http
		.csrf((csrf) -> csrf.disable())
        .authorizeHttpRequests((auth) -> auth
                .requestMatchers("/").permitAll()
                .requestMatchers("/main").permitAll()
                .requestMatchers("/login").permitAll()
                .requestMatchers("/static/**", "/guest/**").permitAll()
                .requestMatchers("/assets/**", "/carousel/**", "/css/**", "/js/**", "/img/**", "/brand/**").permitAll()
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/member/**").hasAnyRole("ADMIN", "USER")
                .anyRequest().authenticated()
        );
		

		return http.build();
	}

}
