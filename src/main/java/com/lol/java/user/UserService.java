package com.lol.java.user;

import java.lang.reflect.Member;

public interface UserService {

	public int sign_up(UserVO vo);
	
	public UserVO idCheck_Login(UserVO vo);
	
	public String idCheck(String user_id);
	
}
