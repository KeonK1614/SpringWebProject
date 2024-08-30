package com.project.springboot;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.springboot.dao.IMemberDao;
import com.project.springboot.dto.UserDTO;
import com.project.springboot.oauth2.SessionUser;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageController {
	
	@Autowired
	IMemberDao member;
	
//	@RequestMapping("/member/myPageView")
//	public String myPageView(Principal principal, Model model)
//	{
//		String loginId = principal.getName();
//		UserDTO dto = member.findByUsername(loginId);
//
//		model.addAttribute("dto", dto);
//
//		return "member/myPageView";
//	} 	String providerId = principal.getName();
	
	@RequestMapping("/member/myPageView")
	public String myPageView(
			Principal principal, Model model, HttpSession session)
	{
		
		   String loginId = principal.getName();
		   SessionUser user = (SessionUser) session.getAttribute("user");
		    
		    UserDTO dto = null;

		    if(user !=null && user.getProviderId() != null) {
		        // 소셜 로그인 처리
		        dto = member.findBySocailrname(null, user.getProviderId());
		    } 
		    else {
		        // 일반 로그인 처리
		        dto = member.findBySocailrname(loginId, null);
		    }
		   
		    
		    model.addAttribute("dto", dto);
		    
		return "member/myPageView";
	}
	
	
	@RequestMapping("/member/myPageEdit")
	public String myPageEdit(Principal principal, Model model)
	{
		String loginId = principal.getName();
		UserDTO dto = member.findByUsername(loginId);
		model.addAttribute("dto", dto);
		return "member/myPageEdit";
	}
	
	@RequestMapping("/member/myPageUpdate")
	public String editMemberInfo(Principal principal, HttpServletRequest req, Model model) {
		String loginId = principal.getName();
		model.addAttribute("dto", member.editDao(req.getParameter("name"),
											req.getParameter("phoneNum"),
											req.getParameter("email"),
											req.getParameter("postcode"),
											req.getParameter("address"),
											req.getParameter("detailaddress"),
											loginId)
		);
		
		UserDTO dto = member.findByUsername(loginId);
		System.out.println(dto);
		model.addAttribute("dto", dto);
		return "/member/myPageView";
	}
	
	@RequestMapping("/member/memberDelete")
	public String deactivate(HttpServletRequest req)
	{
		member.deleteDao(req.getParameter("id"));
		return "redirect:/guest/main";
		
	}
	
}