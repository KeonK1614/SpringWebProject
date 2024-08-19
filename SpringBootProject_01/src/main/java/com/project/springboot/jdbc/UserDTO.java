package com.project.springboot.jdbc;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {
	

	private String id;
	private String pass;
	private String name;
	private String phoneNum;
	private String email;
	private String postcode;
	private String address;
	private String detailaddress;
	private Date regidate;
	private String authority;
	private int enabled;

}
