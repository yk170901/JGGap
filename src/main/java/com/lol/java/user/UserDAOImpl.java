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

	@Override
	public UserVO idCheck_Login(UserVO vo) {
		
		return mybatis.selectOne("userMapper.idCheck_Login",vo);
	}
	
	@Override
	public String idCheck(String user_id) {
		System.out.println("진입 DAO");
		

		return mybatis.selectOne("userMapper.userIdCheck",user_id);
	}
}
