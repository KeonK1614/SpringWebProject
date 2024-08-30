package com.project.springboot.dao;

import java.sql.Timestamp;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.ParameterDTO;
import com.project.springboot.dto.UserDTO;

@Mapper
public interface IMemberDao {
	
	int joinDao(UserDTO user);
	
	int joinSocial(UserDTO user);

	int idCheck(String id);
	
	UserDTO findByUsername(String id);
	
	UserDTO findBySocailrname(@Param("id")String id, @Param("providerId")String providerId);
	
	public int editDao(@Param("name") String name, @Param("phoneNum") String phoneNum,
			@Param("email") String email, @Param("postcode")String postcode,
			@Param("address") String address, @Param("detailaddress") String deailaddress, @Param("id") String id);
	public int deleteDao(String id);
	
	public void updateFailCount(@Param("failCount")int failCount, @Param("id")String id);
	
	//계정 잠금할 때
	public void updateUserLockStatus(@Param("IsLock")int IsLock, @Param("failCount")int failCount, 
									@Param("LockTime")Timestamp LockTime, @Param("id")String id);
	
	//실패 카운트가 5번 이하일때 로그인 성공시 리셋
	public void updateCountReset(String id);
	
	//계정 잠금 풀때
	public void updateUnLock(@Param("IsLock")int IsLock, @Param("failCount")int failCount, @Param("id")String id);
	
	public int getTotalCount(ParameterDTO pDto);
 	
}
