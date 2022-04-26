package com.lol.java.profile;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;



// 회원정보 페이지
@Controller
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;

	// 마이페이지 불러오기
	@RequestMapping("/profile.do")
	public void profile(Model model, HttpSession session) {
		Object user_no = session.getAttribute("user_no");
		model.addAttribute("profile_info", profileService.mypage_info(user_no));
		model.addAttribute("profile_badge", profileService.mypage_badge(user_no));
		model.addAttribute("profile_choice", profileService.mypage_choice(user_no));
		model.addAttribute("profile_board", profileService.mypage_board(user_no));
	}
	
	// 비밀번호 변경
	@ResponseBody
	@RequestMapping("/Chg_Pwd.do")
	public void chg_pwd(ProfileVO profileVO)  {
		profileService.chg_pwd(profileVO);
	}
	
	// 프로필 아이콘 변경
	@ResponseBody
	@RequestMapping("/Chg_icon.do")
	public void chg_icon(ProfileVO profileVO)  {
		profileService.chg_icon(profileVO);
	}
	
	// 채택 해제
	@ResponseBody
	@RequestMapping("/delete_choice.do")
	public void delete_choice(ProfileVO profileVO, HttpSession session)  {
		profileVO.setUser_no((int)session.getAttribute("user_no"));
		profileService.delete_choice(profileVO);
	}
	
	// 명예 점수
	@ResponseBody
	@RequestMapping("/honor_rate.do")
	public void honor_rate(ProfileVO profileVO) {
		profileService.honor_rate(profileVO);
	}
	
	
}