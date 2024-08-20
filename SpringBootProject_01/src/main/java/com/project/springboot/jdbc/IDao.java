package com.project.springboot.jdbc;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IDao {
	
	int joinDao(UserDTO user);

	int idCheck(String id);
	
	UserDTO findByUsername(String id);
 	
}
