package com.lol.java.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

// 로그인페이지(메인) 및 회원가입페이지
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	//세션 리스트
    private List<HttpSession> sessionList = new ArrayList<HttpSession>();

//	회원가입 컨트롤러
	@RequestMapping("/sign_up.do")
	public String sign_up(UserVO vo, Model model, HttpServletRequest request) {
		// 비밀번호 암호화 (sha256
		String encryPassword = UserSHA.encrypt(vo.getUser_pwd());
		vo.setUser_pwd(encryPassword);
		userService.sign_up(vo);
		System.out.println(encryPassword);
		return "redirect:/login.jsp";
	}

//	로그인 컨트롤러
	@RequestMapping("/login_ok.do")
	public String login(UserVO vo, HttpSession session) throws Exception {
	
		String encryPassword = UserSHA.encrypt(vo.getUser_pwd());
		vo.setUser_pwd(encryPassword);
		UserVO result = userService.idCheck_Login(vo);
		String tier = userService.tier_info(result.getUser_no());
		
//		경고 누적 3회 일시
		if(vo.getReport_status() == 3) {
			
			userService.ban(vo);
		}
		
		System.out.println("login 컨트롤러 호출");
		
//		세션 중복 방지
		for( HttpSession member : sessionList) {
			if (session == member) {
				member.invalidate();
				return "user/duplicate_login";
			}
		}
		sessionList.add(session);
		System.out.println(sessionList);
		
		if (result.getUser_no() < 1) {
			
			return "user/join";
		} else if (result.getBan() == 1) {

			System.out.println("정지당한 회원");
			return "user/ban";
		} else if(result.getBan() == 3) {
			session.setAttribute("user_no", result.getUser_no());
			session.setAttribute("summoner_id", result.getSummoner_id());
			session.setAttribute("ban", result.getBan());
			session.setAttribute("solo_tier", tier);
			return "redirect:/admin/admin_page.do";
		} else {
			session.setAttribute("user_no", result.getUser_no());
			session.setAttribute("summoner_id", result.getSummoner_id());
			session.setAttribute("ban", result.getBan());
			session.setAttribute("solo_tier", tier);
			return "redirect:/board_list/board_list.do";
		}
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String user_id) {

		return userService.idCheck(user_id);
	}
	
	// 서머너id 중복 체크 컨트롤러
	@RequestMapping(value = "/summoner_Check.do", method = RequestMethod.POST)
	@ResponseBody
	public String summoner_idCheck(String summoner_id) {
		
		return userService.summoner_idCheck(summoner_id);
	}	

}
