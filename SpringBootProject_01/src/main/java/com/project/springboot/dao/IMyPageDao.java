package com.project.springboot.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.jdbc.UserDTO;


@Mapper
public interface IMyPageDao {
	public UserDTO viewDao(String id);
	public int editDao(@Param("id") String id, @Param("name") String name, @Param("phoneNum") String phoneNum,
					@Param("email") String email, @Param("postcode")String postcode,
					@Param("address") String address, @Param("detailaddress") String deailaddress);
	public int deleteDao(String id);
}
