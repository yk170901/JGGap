package com.lol.java.basic;

import java.util.ArrayList;
import java.util.List;

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
	private List<HttpSession> sessionList = new ArrayList<HttpSession>();
	
	
	// 헤더 포인트		
	@RequestMapping("/point.do")
	public @ResponseBody BasicVO header_point(HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		if(sessionList.contains(session) == false) {
			sessionList.add(session);
		}
		return basicService.header_point(user_no);
	}
	
	// 사이드바 세션생성
	@RequestMapping("/friend.do")
	public @ResponseBody List<BasicVO> createdSession(HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		List<BasicVO> friendList = basicService.getfriends(user_no);
		List<BasicVO> loginedList = new ArrayList<BasicVO>();
		for(HttpSession s : sessionList) {
			for(BasicVO f : friendList) {
				if(s.getAttribute("summoner_id").equals(f.getFriend())) {
					f.setLogin_or_not(1);
				} else {
					f.setLogin_or_not(0);
				}				
			}
		}
		for(BasicVO f : friendList) {
			loginedList.add(f);
		}
		for(BasicVO l : loginedList) {
			System.out.println(l.getLogin_or_not());
		}
		return loginedList;
	}
		

}
