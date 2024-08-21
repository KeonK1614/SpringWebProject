package com.project.springboot.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.UserDTO;

@Mapper
public interface IMemberDao {
	
	int joinDao(UserDTO user);

	int idCheck(String id);
	
	UserDTO findByUsername(String id);
	
	public int editDao(@Param("name") String name, @Param("phoneNum") String phoneNum,
			@Param("email") String email, @Param("postcode")String postcode,
			@Param("address") String address, @Param("detailaddress") String deailaddress, @Param("id") String id);
	public int deleteDao(String id);
 	
}
