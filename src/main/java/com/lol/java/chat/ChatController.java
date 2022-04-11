package com.lol.java.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 채팅방 페이지
@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;

}
