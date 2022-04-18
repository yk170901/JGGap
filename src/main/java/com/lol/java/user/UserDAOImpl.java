package com.lol.java.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int sign_up(UserVO vo) {
		System.out.println(vo);
		System.out.println("입력");
		return mybatis.insert("userMapper.sign_up",vo);
	}
	
}
