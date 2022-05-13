package com.lol.java.chat;

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
	
	// 채팅방 입장시 새로운 세션 정보 등록
	@RequestMapping("/chat.do")
	public String chat(HttpSession session, Model model, HttpServletRequest request, ChatVO vo){
		session.setAttribute("user_no", request.getParameter("user_no"));
		session.setAttribute("summoner_id", request.getParameter("summoner_id"));
		session.setAttribute("ban", Integer.parseInt(request.getParameter("ban")));
		session.setAttribute("solo_tier", request.getParameter("solo_tier"));
		
		model.addAttribute("profile_icon", chatService.user_info(vo));
		
		model.addAttribute("solo_tier", request.getParameter("solo_tier"));
		
		if(request.getParameter("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		}
		return "chat/chat";
	}
	
	
	// 아이언, 브론즈, 실버 티어방 입장
	@RequestMapping("/chatBronze.do")
	public String chatBronze(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		session.getAttribute("solo_tier");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {
				model.addAttribute("user_no", request.getParameter("user_no"));
				model.addAttribute("summoner_id", request.getParameter("summoner_id"));
				model.addAttribute("ban", request.getParameter("ban"));
				model.addAttribute("solo_tier", request.getParameter("solo_tier"));

				model.addAttribute("profile_icon", chatService.user_info(vo));
				
				return "chat/chatBronze";
		}
	}
	
	// 골드, 플래티넘, 다이아몬드 티어방 입장
	@RequestMapping("/chatGold.do")
	public String chatGold(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		session.getAttribute("solo_tier");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {
				model.addAttribute("user_no", request.getParameter("user_no"));
				model.addAttribute("summoner_id", request.getParameter("summoner_id"));
				model.addAttribute("ban", request.getParameter("ban"));
				model.addAttribute("solo_tier", request.getParameter("solo_tier"));

				model.addAttribute("profile_icon", chatService.user_info(vo));
				
				return "chat/chatGold";
		}
	}
	
	// 마스터, 그랜드마스터, 챌린저 티어방 입장
	@RequestMapping("/chatMaster.do")
	public String chatMaster(HttpSession session, Model model, HttpServletRequest request, ChatVO vo){
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		session.getAttribute("solo_tier");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {
				model.addAttribute("user_no", request.getParameter("user_no"));
				model.addAttribute("summoner_id", request.getParameter("summoner_id"));
				model.addAttribute("ban", request.getParameter("ban"));
				model.addAttribute("solo_tier", request.getParameter("solo_tier"));

				model.addAttribute("profile_icon", chatService.user_info(vo));
				
				return "chat/chatMaster";
		}
	}
	
	// 언랭크 티어 채팅방 입장
	@RequestMapping("/chatUnrank.do")
	public String chatUnrank(HttpSession session, Model model, HttpServletRequest request, ChatVO vo) {
		session.getAttribute("user_no");
		session.getAttribute("summoner_id");
		session.getAttribute("ban");
		session.getAttribute("solo_tier");
		
		if(session.getAttribute("user_no") == null) {
			return "redirect:http://localhost:8080/login.jsp";
		} 
		else {
				
				model.addAttribute("user_no", request.getParameter("user_no"));
				model.addAttribute("summoner_id", request.getParameter("summoner_id"));
				model.addAttribute("ban", request.getParameter("ban"));
				model.addAttribute("solo_tier", request.getParameter("solo_tier"));

				model.addAttribute("profile_icon", chatService.user_info(vo));
				
				return "chat/chatUnranked";
		}
	}
}
