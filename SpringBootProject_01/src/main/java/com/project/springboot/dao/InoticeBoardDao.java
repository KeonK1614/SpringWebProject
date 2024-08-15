package com.project.springboot.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.springboot.dto.noticeBoardDto;

@Mapper
public interface InoticeBoardDao
{
	public List<noticeBoardDto> listDao(Map<String, Object> map);
	public int totalCountDao(Map<String, Object> map);

	public noticeBoardDto viewDao(String idx);
	public int writeDao(String id, String title, String content , String ofile, String sfile);
	public int deleteDao(String idx);
	public int editorDao(String title, String content , String ofile, String sfile, String idx);
	public int viewCountDao(String idx);
	public int likeCountDao(String idx);
}
