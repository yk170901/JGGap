package com.lol.java.chat;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatDAO")
public class ChatDAOImpl implements ChatDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<ChatVO> user_info(ChatVO vo) {
		return mybatis.selectList("ChatDAO.user_info", vo);
	}	
	
}
