package com.lol.java.profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



// 회원정보 페이지
@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	
	@RequestMapping("/profile.do")
	public void profile(Model model, HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		model.addAttribute("profile_info", profileService.mypage_info(user_no));
		model.addAttribute("profile_badge", profileService.mypage_badge(user_no));
		int total = profileService.mypage_countBoard(user_no);
		System.out.println(total);
//		model.addAttribute("profile_board", profileService.mypage_board(user_no));
	}
	
	@ResponseBody
	@RequestMapping("/Chg_Pwd.do")
	public void chg_pwd(ProfileVO profileVO)  {
		profileService.chg_pwd(profileVO);
	}
	
	@ResponseBody
	@RequestMapping("/Chg_icon.do")
	public void chg_icon(ProfileVO profileVO)  {
		profileService.chg_icon(profileVO);
	}
	
	
}