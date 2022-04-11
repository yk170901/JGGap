package com.lol.java.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDAO adminDAO;
	
}
