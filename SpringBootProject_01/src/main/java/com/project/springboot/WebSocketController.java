package com.project.springboot;

import org.springframework.context.annotation.Bean;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;


@Controller
public class WebSocketController {
	
//	@RequestMapping("member/client")
//	public String clientPage(Model model)
//	{
//		String sId = SecurityContextHolder.getContext().getAuthentication().getName();
//		
//		model.addAttribute("Id", sId);
//		return "member/client";
//	}
	
	@RequestMapping("guest/webscoketPopup")
	public String webscoketPopup() {
		
		return "guest/webscoketPopup";
	}
	
	@RequestMapping("member/chatMain")
	public String chatMain() {
		return "member/chatMain";
	}

	@RequestMapping("member/chatWindow")
	public String chatWindow(Model model) {
		String sId = SecurityContextHolder.getContext().getAuthentication().getName();
		
		model.addAttribute("Id", sId);
		return "member/chatWindow";
	}
	
	@Bean
	public ServerEndpointExporter serverEndpointExporter()
	{
		return new ServerEndpointExporter();
	}

}
