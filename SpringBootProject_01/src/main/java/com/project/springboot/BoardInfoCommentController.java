package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.dao.IBoardInfoCommentDao;
import com.project.springboot.dao.IBoardInfoDao;
import com.project.springboot.dto.BoardInfoCommentDto;

import jakarta.servlet.http.HttpServletRequest;

public class BoardInfoCommentController {
	
	@Autowired
	IBoardInfoCommentDao commentDao;
	
	@RequestMapping("member/boardView")//작성된 코멘트 불러와서 보기 - list/view역할
	public String listComment(HttpServletRequest req, Model model, BoardInfoCommentDto cDto) {
		List<BoardInfoCommentDto> lists = commentDao.listComment(cDto);
		String refGroup = req.getParameter("idx");
		model.addAttribute("cDto", lists);
		
		return "/member/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("member/writeComment") // 쓰기
	public String addComment(HttpServletRequest req, Model model) {
		String writer = SecurityContextHolder.getContext().getAuthentication().getName();
		String content = req.getParameter("cContent");
		String refGroup = req.getParameter("idx");
		String commentGroup = req.getParameter("commentGroup");
		model.addAttribute("cDto", commentDao.writeComment(writer,
														content,
														refGroup,
														commentGroup));
		
		return "redirect:/member/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("/member/getCommentData")//View의 역할
	public String getCommentData(HttpServletRequest req, Model model) {
		String cIdx = req.getParameter("cIdx");
		String refGroup = req.getParameter("idx");
		BoardInfoCommentDto dto = commentDao.getCommentData(cIdx);
		model.addAttribute("cDto", dto);
		return "member/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("member/editComment") //수정하기
	public String editComment(HttpServletRequest req, Model model) {
		String refGroup = req.getParameter("idx");

		BoardInfoCommentDto dto = commentDao.getCommentData(refGroup);
		String writer = SecurityContextHolder.getContext().getAuthentication().getName();
		String content = req.getParameter("cContent");
		String commentGroup = req.getParameter("commentGroup");
		if (commentGroup == null) {
			commentGroup = req.getParameter("cIdx");
		} 
		
		model.addAttribute("cDto", commentDao.editComment(writer,
				content,
				refGroup,
				commentGroup));
		return "redirect:/member/boardView?idx=" + refGroup;
	}
	
	@RequestMapping("member/deleteComment")
	public String deleteComment(HttpServletRequest req) {
		commentDao.deleteComment(req.getParameter("cIdx"));
		String refGroup = req.getParameter("refGroup");

		return "redirect:/member/boardView?idx=" + refGroup;
	}
	
}
