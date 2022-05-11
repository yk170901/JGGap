package com.lol.java.user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public int sign_up(UserVO vo) {	
		
		return userDAO.sign_up(vo);
	}

	@Override
	public UserVO idCheck_Login(UserVO vo) {
		
		return userDAO.idCheck_Login(vo);
	}
	
	// 중복 아이디 체크
	@Override
	public String idCheck(String user_id) {
		
		return userDAO.idCheck(user_id);
	}
	
	// 서머너 아이디 중복 체크
	@Override
	public String summoner_idCheck(String user_id) {
		
		return userDAO.summoner_idCheck(user_id);
	}

	@Override
	public String tier_info(int user_no) {
		
		return userDAO.tier_info(user_no);
	}

	@Override
	public void ban(UserVO vo) {
		
		userDAO.ban(vo);
	}
	
	
}
