package com.lol.java.profile;

import java.util.List;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

public interface ProfileDAO {

	// 마이페이지 유저 정보 불러오기
	Object mypage_info(ProfileVO profileVO);
	// 마이페이지 뱃지 목록 불러오기
	List<ProfileVO> mypage_badge(ProfileVO profileVO);
	// 마이페이지 게시글 목록 불러오기
	List<ProfileVO> mypage_board(ProfileVO profileVO);
	// 비밀번호 변경 체크
	Object Check_Pwd(ProfileVO profileVO);
	
	

}
