package com.project.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.inquiryBoardDto;

@Mapper
public interface IinquiryBoardDao {
	
	public List<inquiryBoardDto> listDao(Map<String, Object> map);
	public int listCountDao(Map<String, Object> map);
	public inquiryBoardDto viewDao(@Param("_idx") String idx);
	public int writeDao(Map<String, String> map);
	public int replyWriteDao(Map<String, String> map);
	public int deleteDao(String id);
	public int viewCountDao(@Param("_idx")String idx);
	public int likeCountDao(@Param("_idx")String idx);
	public int editorDao(Map<String, String> map);
	
}
