package com.project.springboot.email;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.project.springboot.dto.UserDTO;

import jakarta.mail.MessagingException;

@Controller
public class emailController {
	@Autowired
    private emailService emailService;
	@Autowired
	private emailMapper emailmapper;
	@Autowired
	private pwdEmailService pawService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	@GetMapping("/security/findId")
	public String findId() {
		return "security/findId";
	}

    @ResponseBody
    @PostMapping("/security/sendCode")
    public Map<String, Object> MailSend(@RequestParam(value ="name") String name, @RequestParam(value ="email") String email,
    				Model model){

    	Map<String, Object> response = new HashMap<>();
        UserDTO userDTO = emailmapper.findMemberId(name, email);
        if (userDTO == null) {
            response.put("success", false);
            return response;
        }

        try {
            emailService.sendMail(email);
            response.put("success", true);
        } catch (MessagingException e) {
            response.put("success", false);
        }

        return response;
    }
    
    
    @ResponseBody
    @PostMapping("/security/verifycode")
    public Map<String, Object> findMemberId(@RequestParam(value ="name") String name, @RequestParam(value ="email") String email, 
    		@RequestParam(value ="code") String code, Model model) {
    	Map<String, Object> response = new HashMap<>();
        if (emailService.verifyEmailCode(email, code)) {
            UserDTO userDTO = emailmapper.findMemberId(name, email);
            if (userDTO != null) {
                response.put("id", userDTO.getId());
            } else {
                response.put("id", null);
            }
        } else {
            response.put("id", null);
        }
        return response;
    
    }
    
	@RequestMapping("/security/findPwd")
	public String findPwd() {
		return "security/findPwd";
	}
	
	@ResponseBody
	@PostMapping("/security/findidemail")
	public Map<String, Object> findIdEmail(@RequestBody Map<String, String> request) {
	        String id = request.get("id");
	        String email = request.get("email");

	        Map<String, Object> response = new HashMap<>();
	        Integer userCount = emailmapper.findPwCheck(id, email);

	        response.put("exists", userCount != null && userCount > 0);
	        return response;
	    }
	
    @ResponseBody
    @PostMapping("/security/sendresetpass")
    public Map<String, Object> sendTemporaryPassword(@RequestBody Map<String, String> request) {
    	String id = request.get("id");
        String email = request.get("email");

        Map<String, Object> response = new HashMap<>();
        try {
            String newPass = pawService.createTemporaryPassword(id, email);
            pawService.sendEmail(email, newPass);
            response.put("success", true);
            response.put("message", "임시 비밀번호가 이메일로 발송되었습니다.");
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "임시 비밀번호 발송에 실패했습니다.");
        }
        return response;
    }
    
    @ResponseBody
    @PostMapping("/security/verifypass")
    public Map<String, Object> updatePassword(@RequestBody Map<String, String> request) {
        String id = request.get("id");
        String email = request.get("email");
        String newPass = request.get("newPass");
    	 Map<String, Object> response = new HashMap<>();
    	 
    	 try {
			if (pawService.verifyAndUpdatePassword(email, newPass)) {
				 Integer userCount = emailmapper.findPwCheck(id, email);
			     if (userCount != null && userCount > 0) {
			    	 response.put("success", true);
			    	 response.put("message", "비밀번호가 성공적으로 업데이트되었습니다.");
			    	 String encodedPassword = passwordEncoder.encode(newPass);
			    	 emailmapper.updatePass(id, email, encodedPassword);
			    	
			     } else {
			         response.put("success", false);
			         response.put("message", "비밀번호 업데이트 실패.");
			     }
			} }catch (Exception e) {
			
			e.printStackTrace();
		}
               return response;
     }
    

}

