package com.lol.java.profile;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lol.java.user.UserVO;

// 회원정보 페이지
@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	
	@RequestMapping("/profile.do")
	public void profile(Model model, ProfileVO profileVO) {
		model.addAttribute("profile_info", profileService.mypage_info(profileVO));
		model.addAttribute("profile_badge", profileService.mypage_badge(profileVO));
		model.addAttribute("profile_board", profileService.mypage_board(profileVO));
	}
	
	@RequestMapping("/Chg_Pwd.do")
	public String Check_Pwd(HttpServletRequest request) {
		String password = request.getParameter("new-password");
		profileService.chg_pwd(password);
		return "redirect:/profile/profile.do";
	}
	
	
}
