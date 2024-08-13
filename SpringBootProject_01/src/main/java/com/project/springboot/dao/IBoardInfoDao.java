package com.project.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.BoardInfoDto;

@Mapper
public interface IBoardInfoDao {
	public List<BoardInfoDto> listDao();
	public BoardInfoDto viewDao(String idx);
	public int writeDao(@Param("id") String id, @Param("title") String title, @Param("content") String content,
						 @Param("ofile") String ofile, @Param("sfile")String sfile);
	public int editDao(@Param("idx") String idx, @Param("id") String id, @Param("title") String title, 
						@Param("content") String content, @Param("ofile") String ofile, @Param("sfile")String sfile);
	public int deleteDao(String idx);
	public int updateViewCount(String idx);
//	public List<BoardInfoDto> search(BoardSearch);
	public int addLike(String idx);
	public int pageCount();
	
}
