package com.project.springboot.dao;

import org.apache.ibatis.annotations.Mapper;

import com.project.springboot.dto.MyPageDto;


@Mapper
public class IMyPageDao {
	public MyPageDto viewDao(String id);
	public int editDao(String id);
	public int deleteDao(String id);
	
}
