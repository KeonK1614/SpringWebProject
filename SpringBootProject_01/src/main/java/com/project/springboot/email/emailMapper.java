package com.project.springboot.email;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.jdbc.UserDTO;

@Mapper
public interface emailMapper {

	UserDTO findMemberId(@Param("name")String name, @Param("email")String email);
}
