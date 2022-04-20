package com.lol.java.profile;

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
	
	@ResponseBody
	@RequestMapping("/Check_Pwd.do")
	public Object Check_Pwd(ProfileVO profileVO) {
		Object password = profileService.Check_Pwd(profileVO);
		return password;
	}
	
	
}
