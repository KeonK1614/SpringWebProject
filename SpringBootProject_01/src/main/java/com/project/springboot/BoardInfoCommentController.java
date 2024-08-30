package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.dao.BoardInfoCommentService;
import com.project.springboot.dto.BoardInfoCommentDto;

import jakarta.servlet.http.HttpServletRequest;
@Controller
public class BoardInfoCommentController {
	
	@Autowired
	private BoardInfoCommentService commentService;
	
//	@GetMapping("/member/boardInfoView")//작성된 코멘트 불러와서 보기 - list/view역할
//	public String listComment(HttpServletRequest req, Model model) {
//		System.out.println("listComment working");
//		String refGroup = req.getParameter("idx");
//		List<BoardInfoCommentDto> comments = commentService.listComment(refGroup);
//		System.out.println("comment: "  + comments);
//		model.addAttribute("cDto", comments);
//		
//		return "guest/boardInfoView";
//	}
	
	@RequestMapping("/member/writeComment") // 쓰기
	public String addComment(HttpServletRequest req, Model model) {
		System.out.println("addComment working");
		String refGroup = req.getParameter("idx");
		String writer = SecurityContextHolder.getContext().getAuthentication().getName();
		String commentText = req.getParameter("commentText");
		BoardInfoCommentDto comment = new BoardInfoCommentDto();
		comment.setWriter(writer);
		comment.setCommentText(commentText);
		comment.setRefGroup(refGroup);
		
		commentService.writeComment(comment);
		System.out.println("comment: " + comment);
		return "redirect:/guest/boardInfoView?idx=" + refGroup;
	}
	
	@RequestMapping("/member/getCommentData")//View의 역할
	public String getCommentData(HttpServletRequest req, Model model) {
		String cIdx = req.getParameter("cIdx");
		String refGroup = req.getParameter("idx");
		BoardInfoCommentDto dto = commentService.getCommentData(cIdx);
		model.addAttribute("cDto", dto);
		return "guest/boardInfoView?idx=" + refGroup;
	}
	
	@RequestMapping("/member/editComment") //수정하기
	public String editComment(HttpServletRequest req, Model model) {
		String refGroup = req.getParameter("idx");
		String commentText = req.getParameter("commentText");
		BoardInfoCommentDto comment = new BoardInfoCommentDto();
		comment.setCommentText(commentText);

		model.addAttribute("cDto", comment);
		return "redirect:/guest/boardInfoView?idx=" + refGroup;
	}
	
	@RequestMapping("/member/deleteComment")
	public String deleteComment(HttpServletRequest req) {
		commentService.deleteComment(req.getParameter("cIdx"));
		String refGroup = req.getParameter("refGroup");

		return "redirect:/guest/boardInfoView?idx=" + refGroup;
	}
	
}
