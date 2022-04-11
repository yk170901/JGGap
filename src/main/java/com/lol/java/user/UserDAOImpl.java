package com.lol.java.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insert() {
		System.out.println("입력시작");
		mybatis.insert("user1.userJoin");
		System.out.println("입력완료");
	}
	
}
