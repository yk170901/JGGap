package com.lol.java.profile;

import java.util.List;
import java.util.Map;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

public interface ProfileDAO {

	// 마이페이지 유저 정보 불러오기
	Object mypage_info(Object user_no);
	
	// 마이페이지 뱃지 목록 불러오기
	List<ProfileVO> mypage_badge(Object user_no);
	
	// 마이페이지 게시글 목록 불러오기
	List<ProfileVO> mypage_board(Object user_no);
	
	// 비밀번호 변경
	void chg_pwd(ProfileVO profileVO);
	
	// 프로필 아이콘 변경
	void chg_icon(ProfileVO profileVO);
	
	

}