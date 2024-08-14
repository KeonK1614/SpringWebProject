package com.project.springboot.jdbc;

import java.util.Date;

import lombok.Data;

@Data
public class MyUserDTO {
	
	private String id;
	private String pass;
	private String postcode;
	private String address;
	private String phoneNum;
	private String name;
	private Date regidate;
	private String email;
	private String isAdmin;

}
