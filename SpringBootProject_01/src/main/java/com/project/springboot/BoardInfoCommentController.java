package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.dao.BoardInfoCommentService;
import com.project.springboot.dto.BoardInfoCommentDto;

import jakarta.servlet.http.HttpServletRequest;

public class BoardInfoCommentController {
	
	@Autowired
	private BoardInfoCommentService commentService;
	
	@RequestMapping("member/boardView")//작성된 코멘트 불러와서 보기 - list/view역할
	public String listComment(HttpServletRequest req, Model model) {
		String refGroup = req.getParameter("idx");
		List<BoardInfoCommentDto> comments = commentService.listComment(refGroup);

		model.addAttribute("cDto", comments);
		
		return "guest/boardView";
	}
	
	@RequestMapping("member/writeComment") // 쓰기
	public String addComment(HttpServletRequest req, Model model) {
		String refGroup = req.getParameter("idx");
		String writer = SecurityContextHolder.getContext().getAuthentication().getName();
		String content = req.getParameter("cContent");
		
		BoardInfoCommentDto comment = new BoardInfoCommentDto();
		comment.setWriter(writer);
		comment.setContent(content);
		comment.setRefGroup(refGroup);
		
		commentService.writeComment(comment);
		return "redirect:/guest/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("/member/getCommentData")//View의 역할
	public String getCommentData(HttpServletRequest req, Model model) {
		String cIdx = req.getParameter("cIdx");
		String refGroup = req.getParameter("idx");
		BoardInfoCommentDto dto = commentService.getCommentData(cIdx);
		model.addAttribute("cDto", dto);
		return "guest/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("member/editComment") //수정하기
	public String editComment(HttpServletRequest req, Model model) {
		String refGroup = req.getParameter("idx");
		String writer = SecurityContextHolder.getContext().getAuthentication().getName();
		String content = req.getParameter("cContent");
		String commentGroup = req.getParameter("commentGroup");
		BoardInfoCommentDto comment = new BoardInfoCommentDto();
		comment.setWriter(writer);
		comment.setContent(content);
		comment.setRefGroup(refGroup);
		
		if (commentGroup == null) {
			commentGroup = req.getParameter("cIdx");
		} 
		
		model.addAttribute("cDto", comment);
		return "redirect:/guest/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("member/deleteComment")
	public String deleteComment(HttpServletRequest req) {
		commentService.deleteComment(req.getParameter("cIdx"));
		String refGroup = req.getParameter("refGroup");

		return "redirect:/guest/boardView?idx=" + refGroup;
	}
	
}
