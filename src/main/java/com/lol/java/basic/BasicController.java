package com.lol.java.basic;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		return basicService.header_point(user_no);
	}
	
   // 포인트에 따라 레벨 여부      
   @RequestMapping("/level_point.do")
   public @ResponseBody String level_point(HttpSession session) {
      Object user_no = session.getAttribute("user_no");
      return basicService.level_point(user_no);
   }   
	
	// 사이드바 친구관리
	@RequestMapping("/friend.do")
	public @ResponseBody List<BasicVO> createdSession(HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		List<BasicVO> friendList = basicService.getfriends(user_no);
		List<BasicVO> loginedList = new ArrayList<BasicVO>();
//		
//		int check = 0;
//		for(HttpSession s : sessionList) {
//			if((int) s.getAttribute("user_no") == (int) session.getAttribute("user_no")) {
//				check++;
//			}
//		}
//		if (check == 0) sessionList.add(session);
		
//		System.out.println(sessionList.size());
//		for(HttpSession s : sessionList) {
//			for(BasicVO f : friendList) {
//				if(s.getAttribute("summoner_id").equals(f.getFriend())) {
//					f.setLogin_or_not(1);
//				} else {
//					if(f.getLogin_or_not() != 1) {
//					f.setLogin_or_not(0);
//					}
//				}
//			}
//		}
//		
		for(BasicVO f : friendList) {
			loginedList.add(f);
		}
		return loginedList;
	}
	
	@RequestMapping("/banned.do")
	public @ResponseBody List<BasicVO> banned(HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		return basicService.getbanned(user_no);
	}
	
	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		sessionList.remove(session);
		session.invalidate();
		return "redirect:/login.jsp";
	}
	
	// X버튼으로 로그아웃
//	@RequestMapping("/logoutESC.do")
//	public void logoutESC(HttpSession session) {
//		sessionList.remove(session);
//		session.invalidate();
//	}

}
