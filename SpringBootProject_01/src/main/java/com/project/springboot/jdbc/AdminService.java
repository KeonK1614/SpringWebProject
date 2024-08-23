package com.project.springboot.jdbc;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.ParameterDTO;

@Mapper
public interface AdminService {

//	public List<AdminMemberDTO> select(AdminMemberDTO adminMemberDTO);
	
	public AdminMemberDTO selectOne(@Param("id") String id);
	
	public int updateUserAuth(Map<String, Object> params);
	
	public int updateEnabled(Map<String, Object> params);
	
	public int getTotalCount(ParameterDTO parameterDTO);
	
	public List<AdminMemberDTO> userListPage(ParameterDTO parameterDTO);
}
