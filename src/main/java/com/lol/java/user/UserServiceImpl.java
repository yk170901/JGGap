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
		System.out.println("진입2");
		
		return userDAO.idCheck(user_id);
	}
	
	
}
