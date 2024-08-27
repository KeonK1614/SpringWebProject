package com.project.springboot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.project.springboot.dto.BoardInfoCommentDto;

@Mapper
public interface IBoardInfoCommentDao {
	public List<BoardInfoCommentDto> listComment(String dto);
	public int writeComment(@Param("writer") String writer, @Param("content") String content,
							@Param("refGroup")String refGroup, @Param("commentGroup")String commentGroup);
	public int editComment(@Param("writer") String writer, @Param("content") String content, 
							@Param("refGroup")String refGroup, @Param("commentGroup")String commentGroup);
	public int deleteComment(String idx);
	public BoardInfoCommentDto getCommentData(String idx);

    int writeComment(BoardInfoCommentDto commentDto);

}
