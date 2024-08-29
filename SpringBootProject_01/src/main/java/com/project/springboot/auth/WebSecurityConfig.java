package com.project.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

import com.project.springboot.oauth2.CustomOAuth2UserService;

import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	
	private final AuthenticationFailureHandler myAuthFailureHandler;
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	protected SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf((csrf) -> csrf.disable())
			.cors((cors) -> cors.disable())
	    	.authorizeHttpRequests(request -> request
	    		.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
	    		.requestMatchers("/").permitAll()
//	    		.requestMatchers("/**").permitAll()
	    		.requestMatchers("/guest/joinform").permitAll()
	    		.requestMatchers("/error").permitAll()
	    		.requestMatchers("/static/**").permitAll()
	            .requestMatchers("/assets/**", "/carousel/**","/css/**", "/js/**", "/img/**").permitAll()
	            .requestMatchers("/guest/**").permitAll()  // 모두에게 허용.
	            .requestMatchers("/security/**").permitAll() 
	            .requestMatchers("/member/**").hasAnyRole("USER", "ADMIN")
	            .requestMatchers("/admin/**").hasAnyRole("ADMIN")

	            .anyRequest().authenticated() // 어떠한 요청이라도 인증 필요 없음 ( anonymous() )  //authenticated()
	        );
    
		http.formLogin((formLogin) -> formLogin
				.loginPage("/security/loginform")
				.permitAll()
				.loginProcessingUrl("/security/loginform")
		        .defaultSuccessUrl("/")
		        .failureHandler(myAuthFailureHandler)
		        .usernameParameter("id")
		        .passwordParameter("pass")
		        .permitAll()
				);
		
		http.logout((logout) -> logout
			.logoutUrl("/logout")
			.logoutSuccessUrl("/")
			.invalidateHttpSession(true) // 세션 무효화
            .deleteCookies("JSESSIONID")
			.permitAll());
		
		http.exceptionHandling((expHandling) -> expHandling
				.accessDeniedPage("/denied"));
    
    return http.build(); 
		
	}
	
	
	public void configure(WebSecurity web) throws Exception {
	    web.httpFirewall(defaultHttpFirewall());
//	    web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
	}
	 
	//매핑 중 슬래시가 두개 이상들어갔을 때 처리해주는 것.
	@Bean
	public HttpFirewall defaultHttpFirewall() {
	    return new DefaultHttpFirewall();
	}
}
