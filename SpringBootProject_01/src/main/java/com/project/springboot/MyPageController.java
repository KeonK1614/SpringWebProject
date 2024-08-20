package com.project.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.dao.IMyPageDao;
import com.project.springboot.jdbc.UserDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	@Autowired
	ServletContext context;
	
	@Autowired
	IMyPageDao dao;
	
	@RequestMapping("/member/myPageView")
	public String viewDao(HttpSession session, HttpServletRequest req, Model model)
	{
//		UserDTO user = (UserDTO) session.getAttribute("user");
		String sId = req.getParameter("id");
		if (sId == null || sId.isEmpty()) {
		       // id 파라미터가 없을 경우 처리
		       model.addAttribute("error", "ID parameter is missing.");
		       return "errorPage"; // 에러 페이지로 이동 (예시)
		}

		UserDTO dto = dao.viewDao(sId);
		
		 if (dto == null) {
		        // DTO가 null인 경우 처리
		        model.addAttribute("error", "No data found for ID: " + sId);
		        return "errorPage"; // 에러 페이지로 이동 (예시)
		    }
		
		model.addAttribute("dto", dto);

		return "member/myPageView";
	}
	
	@RequestMapping("/member/myPageEdit")
	public String myPageEdit(HttpServletRequest req, Model model)
	{
		String sId = req.getParameter("id");
		UserDTO dto = dao.viewDao(sId);

		model.addAttribute("dto", dto);
		return "member/myPageEdit";
	}
	
	@RequestMapping("/member/myPageUpdate")
	public String edit(HttpServletRequest req, Model model) {
		String sId = req.getParameter("id");
		
		UserDTO dto = dao.viewDao(sId);
		model.addAttribute("dto", dao.editDao(req.getParameter("id"),
											req.getParameter("name"),
											req.getParameter("phoneNum"),
											req.getParameter("email"),
											req.getParameter("postcode"),
											req.getParameter("address"),
											req.getParameter("detailaddress")
											));
	
		return "redirect:/member/myPageView?id=" + sId;
	}
	
	@RequestMapping("/member/memberDelete")
	public String delete(HttpServletRequest req)
	{
		dao.deleteDao(req.getParameter("id"));
		return "redirect:/guest/main";
		
	}
	
}
