package com.lol.java.user;

public interface UserDAO {

	public int sign_up(UserVO vo);
	
	public UserVO idCheck_Login(UserVO vo);
	
	public String idCheck(String user_id);
	
}
