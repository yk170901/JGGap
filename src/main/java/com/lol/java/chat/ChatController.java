package com.lol.java.chat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chat")
public class ChatController {
//	private Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	private ChatService chatService;
	
	@RequestMapping("/chat.do")
	public String chat(HttpSession session, Model model, HttpServletRequest request){
		session.setAttribute("user_no", request.getParameter("user_no"));
		session.setAttribute("summoner_id", request.getParameter("summoner_id"));
		session.setAttribute("ban", Integer.parseInt(request.getParameter("ban")));
		
		if(request.getParameter("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		}
		return "chat/chat";
	}
	
	
	@RequestMapping("/chatBronze.do")
	public String chatBronze(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {	
			System.out.println("벤 : " + request.getParameter("ban"));
			
			model.addAttribute("user_no", request.getParameter("user_no"));
			model.addAttribute("summoner_id", request.getParameter("summoner_id"));
			model.addAttribute("ban", request.getParameter("ban"));

			model.addAttribute("profile_icon", chatService.user_info(vo));
			
			System.out.println("스타트 접속한 방 ID : " + request.getParameter("id"));
			

//			logger.info("[Controller] : chat.do");
			
			return "chat/chatBronze";
		}
		
		
	}
	
	
	@RequestMapping("/chatGold.do")
	public String chatGold(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {	
			System.out.println("벤 : " + request.getParameter("ban"));
			
			model.addAttribute("user_no", request.getParameter("user_no"));
			model.addAttribute("summoner_id", request.getParameter("summoner_id"));
			model.addAttribute("ban", request.getParameter("ban"));

			model.addAttribute("profile_icon", chatService.user_info(vo));
			
			System.out.println("스타트 접속한 방 ID : " + request.getParameter("id"));
			

//			logger.info("[Controller] : chat.do");
			
			return "chat/chatGold";
		}
		
		
	}
	
	
	@RequestMapping("/chatMaster.do")
	public String chatMaster(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {	
			System.out.println("벤 : " + request.getParameter("ban"));
			
			model.addAttribute("user_no", request.getParameter("user_no"));
			model.addAttribute("summoner_id", request.getParameter("summoner_id"));
			model.addAttribute("ban", request.getParameter("ban"));

			model.addAttribute("profile_icon", chatService.user_info(vo));
			
			System.out.println("스타트 접속한 방 ID : " + request.getParameter("id"));
			

//			logger.info("[Controller] : chat.do");
			
			return "chat/chatMaster";
		}
		
		
	}
}
