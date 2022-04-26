package com.lol.java.profile;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{

	@Autowired
	private ProfileDAO profileDAO;
	
	// 마이페이지 유저 정보 불러오기
	@Override
	public Object mypage_info(Object user_no) {
		return profileDAO.mypage_info(user_no);
	}
	
	// 마이페이지 뱃지 목록 불러오기
	@Override
	public List<ProfileVO> mypage_badge(Object user_no) {
		return profileDAO.mypage_badge(user_no);
	}
	
	// 마이페이지 채택 목록 불러오기
	@Override
	public List<ProfileVO> mypage_choice(Object user_no) {
		return profileDAO.mypage_choice(user_no);
	}
	
	// 마이페이지 게시글 목록 불러오기
	@Override
	public List<ProfileVO> mypage_board(Object user_no) {
		return profileDAO.mypage_board(user_no);
	}

	// 비밀번호 변경
	@Override
	public void chg_pwd(ProfileVO profileVO) {
		profileDAO.chg_pwd(profileVO);
	}

	// 프로필 아이콘 변경
	@Override
	public void chg_icon(ProfileVO profileVO) {
		profileDAO.chg_icon(profileVO);
	}
	
	// 채택 헤제
	@Override
	public void delete_choice(ProfileVO profileVO) {
		profileDAO.delete_choice(profileVO);
		
	}

	// 명예 점수
	@Override
	public void honor_rate(ProfileVO profileVO) {
		profileDAO.honor_rate(profileVO);
		
	}
	

	
}