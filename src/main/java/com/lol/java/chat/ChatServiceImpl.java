package com.lol.java.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDAO chatDAO;
	
}
