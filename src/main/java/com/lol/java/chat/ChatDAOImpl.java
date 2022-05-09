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
	public String user_info(ChatVO vo) {
		return mybatis.selectOne("ChatDAO.user_info", vo);
	}	
	
}
