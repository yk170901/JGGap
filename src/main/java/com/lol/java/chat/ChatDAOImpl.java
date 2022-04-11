package com.lol.java.chat;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("chatDAO")
public class ChatDAOImpl implements ChatDAO{

	@Autowired
	private SqlSessionTemplate mybatis;	
	
}
