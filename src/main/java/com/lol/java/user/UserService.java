package com.lol.java.user;

import java.lang.reflect.Member;

public interface UserService {

	public int sign_up(UserVO vo);
	
	public UserVO idCheck_Login(UserVO vo);
	
	public String idCheck(String user_id);
	
	public String summoner_idCheck(String summoner_id);
	
	public String tier_info(int user_no);

	public void ban(UserVO vo);
	
	public String user_id_check(UserVO vo);

	public String user_pwd_check(UserVO vo);
}
