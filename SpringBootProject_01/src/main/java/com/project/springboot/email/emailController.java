package com.project.springboot.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.dto.UserDTO;

@Controller
public class emailController {
	@Autowired
    private emailService mailService;
	@Autowired
	private emailMapper emailmapper;
	

	@GetMapping("/security/findId")
	public String findId(Model model) {
		model.addAttribute("UserDTO", new UserDTO());
		return "security/findId";
	}

    @ResponseBody
    @PostMapping("/security/sendVerificationCode")
    public String MailSend(@RequestParam(value ="email") String email){

        int number = mailService.sendMail(email);

        String num = "" + number;

        return num;
    }
    
    
    @ResponseBody
    @PostMapping("/security/findId")
    public UserDTO findMemberId(@RequestParam(value ="name") String name, @RequestParam(value ="email") String email) {
    	return emailmapper.findMemberId(name, email);
    }
}
