package com.lol.java.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDAO chatDAO;

	@Override
	public String user_info(ChatVO vo) {
		return chatDAO.user_info(vo);
	}
	
}
