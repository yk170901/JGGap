package com.lol.java.profile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

@Repository("profileDAO")
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	// 마이페이지 유저 정보 불러오기
	@Override
	public Object mypage_info(Object user_no) {
		return mybatis.selectOne("ProfileDAO.profile_info", user_no);
	}

	// 마이페이지 친구 신청 목록 불러오기
	@Override
	public List<ProfileVO> mypage_friend(HashMap<String, Object> friend) {
		return mybatis.selectList("ProfileDAO.profile_friend", friend);
	}
	
	// 마이페이지 뱃지 목록 불러오기
	@Override
	public List<ProfileVO> mypage_badge(Object user_no) {
		return mybatis.selectList("ProfileDAO.profile_badge", user_no);
	}

	// 마이페이지 채택 목록 불러오기
	@Override
	public List<ProfileVO> mypage_choice(Object user_no) {
		return mybatis.selectList("ProfileDAO.profile_choice", user_no);
	}
	
	// 마이페이지 게시글 목록 불러오기
	@Override
	public List<ProfileVO> mypage_board(Object user_no) {
		return mybatis.selectList("ProfileDAO.profile_board", user_no);
	}

	// 비밀번호 변경
	@Override
	public void chg_pwd(ProfileVO profileVO) {
		mybatis.update("ProfileDAO.chg_pwd", profileVO);
		
	}

	// 프로필 아이콘 변경
	@Override
	public void chg_icon(ProfileVO profileVO) {
		mybatis.update("ProfileDAO.chg_icon", profileVO);
		
	}
	
	// 채택 해제
	@Override
	public void delete_choice(ProfileVO profileVO) {
		mybatis.delete("ProfileDAO.delete_choice", profileVO);
		
	}

	// 명예 점수
	@Override
	public void honor_rate(ProfileVO profileVO) {
		mybatis.update("ProfileDAO.honor_rate", profileVO);
		
	}

	// 친구 신청 수락
	@Override
	public void friend_add(Map<String, Object> friend) {
		mybatis.update("ProfileDAO.friend_add1", friend);
		mybatis.insert("ProfileDAO.friend_add2", friend);
		
	}

	// 친구 신청 차단
	@Override
	public void friend_block(Map<String, Object> friend) {
		mybatis.insert("ProfileDAO.friend_block", friend);
		
	}

	// 친구 신청 취소
	@Override
	public void friend_cancle(Map<String, Object> friend) {
		mybatis.delete("ProfileDAO.friend_cancle", friend);
		
	}
	
	

}