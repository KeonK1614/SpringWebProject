package com.project.springboot.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.springboot.dto.BoardInfoCommentDto;

public class BoardInfoCommentService {
	@Autowired
	private IBoardInfoCommentDao commentDao;
	
	public List<BoardInfoCommentDto> listCommnet(String refGroup) {
		return commentDao.listComment(refGroup);
	}
	
	public int writeComment(BoardInfoCommentDto commentDto) {
		return commentDao.writeComment(commentDto);
	}
	
//	public int editCommnet() {
//
//	}
//
//	public int deleteCommnet(String cIdx) {
//
//	}
}
