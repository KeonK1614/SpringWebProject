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

import com.project.springboot.jdbc.UserDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/")
	public @ResponseBody String root() throws Exception{
		return "HI";
	}
	
	@RequestMapping("/guest/main")
	public String main() {
		return "guest/main";
	}
	
	@RequestMapping("/guest/joinform")
	public String joinform(Model model) {
		model.addAttribute("userDTO", new UserDTO());
		return "guest/joinform";
	}
	
	@RequestMapping("/guest/join")
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
		user.setIsAdmin("N");
	
		int nResult = userService.joinDao(user);
		
		if (nResult > 0) {
            return "redirect:main"; // 성공 시
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
    public String loginform(Model model){
    	model.addAttribute("userDTO", new UserDTO());
        return "security/loginform";
    }
	
    @RequestMapping("/login")
    public String login(UserDTO user, @RequestParam(value ="id") String id, @RequestParam(value ="pass")String pass,
    		HttpSession session) {
        user.setIsAdmin("N");
        String rawPassword = user.getPass();
        String encPassword = passwordEncoder.encode(rawPassword);
        user.setPass(encPassword);
             
        if (userService.findByUsername(id, pass) != null && passwordEncoder.matches(user.getPass(), userService.findByUsername(id, pass))) {
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
    
    
	@RequestMapping("/member/mypage")
	public String mypage() {
		return "member/mypage";
	}

}
