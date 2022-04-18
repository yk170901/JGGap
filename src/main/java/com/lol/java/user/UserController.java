package com.lol.java.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// 로그인페이지(메인) 및 회원가입페이지
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join.do")
	public ModelAndView sign_up(UserVO vo) {
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

}
