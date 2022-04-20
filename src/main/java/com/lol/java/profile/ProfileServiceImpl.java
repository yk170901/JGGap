package com.lol.java.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profileDAO;

	@Override
	public Object mypage_info(ProfileVO profileVO) {
		return profileDAO.mypage_info(profileVO);
	}
	
	@Override
	public List<ProfileVO> mypage_badge(ProfileVO profileVO) {
		return profileDAO.mypage_badge(profileVO);
	}
	
	@Override
	public List<ProfileVO> mypage_board(ProfileVO profileVO) {
		return profileDAO.mypage_board(profileVO);
	}

	@Override
	public Object Check_Pwd(ProfileVO profileVO) {
		return profileDAO.Check_Pwd(profileVO);
	}
	
}
