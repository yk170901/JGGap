package com.lol.java.admin;

import java.util.List;

public interface AdminService {

	public List<AdminVO> user_list(); 
	
	public int member_count();
	
	public List<String> achievement();
}
