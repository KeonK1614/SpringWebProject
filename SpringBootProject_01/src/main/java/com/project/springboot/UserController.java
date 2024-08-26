package com.project.springboot;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.dto.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;



@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/guest/joinform")
	public String joinform(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		return "guest/joinform";
	}
	
	@PostMapping("/guest/join")
	public String join(HttpServletRequest request, UserDTO user) {
		String sId = request.getParameter("id");
		String sPass = request.getParameter("pass");
		String sName = request.getParameter("name");
		String sPhoneNum = request.getParameter("phoneNum");
		String sEmail = request.getParameter("email");
		String sPostcode = request.getParameter("postcode");
		String sAddress = request.getParameter("address");
		String sDetailaddress = request.getParameter("detailaddress");

		
		user.setId(sId);
		user.setPass(sPass);
		user.setName(sName);
		user.setPhoneNum(sPhoneNum);
		user.setEmail(sEmail);
		user.setPostcode(sPostcode);
		user.setAddress(sAddress);
		user.setDetailaddress(sDetailaddress);
		user.setRegidate(new Date());
	
		int nResult = userService.joinDao(user);
		
		if (nResult > 0) {
            return "/"; // 성공 시
        } else {
            return "guest/joinform"; // 실패 시 다시 폼 페이지로 이동
        }
	}
	
	@PostMapping("/guest/idCheck")
	@ResponseBody
	public boolean isIdCheck(@RequestParam(value ="id") String id) {
		
		boolean result = userService.isUserIdCheck(id);
		return result;
	}
	
    @RequestMapping("/security/loginform")
    public String loginform(Model model,  @RequestParam(value="error", required = false) String error,
            @RequestParam(value = "exception", required = false) String exception){
    	model.addAttribute("userDTO", new UserDTO());
    	model.addAttribute("error", error);
        model.addAttribute("exception", exception);
        return "security/loginform";
    }
	
    @PostMapping("/login")
    public String login(@RequestParam(value ="id") String id, @RequestParam(value ="pass")String pass,
    		HttpSession session, HttpServletRequest request) {
    	UserDTO user = userService.findByUsername(id);
             
        if (user != null && passwordEncoder.matches(pass, user.getPass())){
            session.setAttribute("id", user.getId());
            session.setAttribute("name", user.getName());
            session.setAttribute("ROLE_", user.getAuthority());
        	return "guest/main"; // 로그인 성공 시 리디렉션
        } else {
            return "security/loginform"; 
        }
        
    }
    

    
 // 로그아웃
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }
    
    //권한요청 실패시 뜨는 화
    @RequestMapping("/denied")
    public String login2() {
    	return "security/denied";
    }
    

//	@RequestMapping("/member/myPageEdit")
//	public String myPageEdit()	{
//		
//	}

}
