package com.lol.java.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping("/chat.do")
	public String chat(HttpSession session, Model model, HttpServletRequest request) {
		session.setAttribute("user_no", request.getParameter("user_no"));
		session.setAttribute("summoner_id", request.getParameter("summoner_id"));
		logger.info("[Controller] : chat.do");
		
		
		return "chat/chat";
	}
}
