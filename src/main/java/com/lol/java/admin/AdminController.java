package com.lol.java.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 페이지
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_page.do")
	public String admin() {
		
		return "/admin/admin_page";
	}
}
