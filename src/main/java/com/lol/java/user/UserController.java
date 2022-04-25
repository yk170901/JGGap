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
	
	@RequestMapping("/join.do")
	public ModelAndView sign_up(UserVO vo/*, Model model, HttpServletRequest request*/) {
//		// 암호 확인
//		System.out.println("첫번째:" + UserVO.getUser_pw());
//		// 비밀번호 암호화 (sha256
//		String encryPassword = UserSHA.encrypt(vo.getUser_pwd());
//		vo.setUser_pwd(encryPassword);
//		System.out.println("두번째:" + vo.getUser_pwd());
		System.out.println("sign_up");
		int result = userService.sign_up(vo);
		String message = "가입되지 않았습니다";
		
//		if (result > 0)
		
		ModelAndView mv = new ModelAndView();
		System.out.println("가입완료");
		mv.setViewName("/user/join");
		mv.addObject(result);
		
		return mv;
	}
	
	@RequestMapping("/login_ok.do")
	public String login(UserVO vo, HttpSession session) throws Exception {
		UserVO result = userService.idCheck_Login(vo);
		System.out.println("login 컨트롤러 호출");

		if (result == null) {
			System.out.println("로그인 실패");
			return "redirect:./login";
		} else {
			
			session.setAttribute("user_no", result.getUser_no());
			return "redirect:/board_list/board_list.do";
		}
	}
	
	// id 중복 체크 컨트롤러
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(String user_id) {
		System.out.println("진입");
		String x = userService.idCheck(user_id);
		System.out.println(x);

		return userService.idCheck(user_id);
	}
	
	// 로그아웃
	   @RequestMapping("/logout.do")
	   public String logout(HttpSession session) {
	      session.invalidate();
	      return "redirect:/login.jsp";
	   }
	
}


