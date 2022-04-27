package com.lol.java.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

// 로그인페이지(메인) 및 회원가입페이지
@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

//	회원가입 컨트롤러
	@RequestMapping("/sign_up.do")
	public String sign_up(UserVO vo, Model model, HttpServletRequest request) {
		// 비밀번호 암호화 (sha256
		String encryPassword = UserSHA.encrypt(vo.getUser_pwd());
		vo.setUser_pwd(encryPassword);
		userService.sign_up(vo);

		return "redirect:/login.jsp";
	}

//	로그인 컨트롤러
	@RequestMapping("/login_ok.do")
	public String login(UserVO vo, HttpSession session) throws Exception {

		String encryPassword = UserSHA.encrypt(vo.getUser_pwd());
		vo.setUser_pwd(encryPassword);
		UserVO result = userService.idCheck_Login(vo);
		System.out.println("login 컨트롤러 호출");

		if (result == null) {

			System.out.println("존재하지 않는 아이디");
			return "redirect:/login.jsp";
		} else if (result.getBan() == 1) {

			System.out.println("정지당한 회원");
			return "redirect:/login.jsp";
		} else {

			session.setAttribute("user_no", result.getUser_no());
			return "redirect:/board_list/board_list.do";
		}
	}

	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String user_id) {

		String x = userService.idCheck(user_id);

		return userService.idCheck(user_id);
	}
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/summoner_Check.do", method = RequestMethod.POST)
	@ResponseBody
	public String summoner_idCheck(String summoner_id) {
		
		String x = userService.summoner_idCheck(summoner_id);
		
		return userService.summoner_idCheck(summoner_id);
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login.jsp";
	}

}
