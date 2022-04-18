package com.lol.java.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	UserDAO userDAO;

	@Override
	public int sign_up(UserVO vo) {	
		System.out.println("1");
		return userDAO.sign_up(vo);
	}
	
}
