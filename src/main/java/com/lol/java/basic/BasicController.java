package com.lol.java.basic;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public @ResponseBody BasicVO header_point(HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		return basicService.header_point(user_no);
	}
	
	// 사이드바 세션생성
	@RequestMapping("/sessionCreated.do")
	public void createdSession(HttpSessionEvent se, HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		Object createdSession = se.getSession().getAttribute("summoner_id")+"";
		for(BasicVO follower : basicService.follower(user_no)) {
			if(createdSession.equals(follower)) {
				
			}
		}
		return ;
	}
		

}
