package com.lol.java.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO adminDAO;

	@Override
	public List<AdminVO> user_list() {

		return adminDAO.user_list();
	}

	@Override
	public int member_count() {
		
		return adminDAO.member_count();
	}

	@Override
	public List<String> achievement() {
		
		return adminDAO.achievement();
	}
	
	
	
	
}
