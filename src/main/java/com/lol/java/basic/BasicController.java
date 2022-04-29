package com.lol.java.basic;

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
	BasicVO vo = new BasicVO();
	
	
	// 헤더 포인트		
	@RequestMapping("/point.do")
	public @ResponseBody BasicVO header_point(Model model, HttpSession session) {
		Object user_no = session.getAttribute("user_no");	
		return basicService.header_point(user_no);
	}
		

}
