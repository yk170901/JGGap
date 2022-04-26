package com.lol.java.basic;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 관리자 페이지
@Controller
@RequestMapping("/basic")
public class BasicController {

	@Autowired
	private BasicService basicService;
	
	
	// 헤더 포인트
	@ResponseBody
	@RequestMapping("/point.do")
	public String header_point(Model model, HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		String point = String.valueOf(basicService.header_point(user_no));
		return point;
		
	
	}
		

}
