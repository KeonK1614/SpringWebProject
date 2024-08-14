package com.project.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

@SpringBootApplication(exclude = SecurityAutoConfiguration.class)
public class WebProjectMemberApplication {

	public static void main(String[] args) {
		SpringApplication.run(WebProjectMemberApplication.class, args);
	}

}
