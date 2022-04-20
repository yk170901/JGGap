package com.lol.java.profile;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lol.java.board_detail.Board_detail_VO;
import com.lol.java.user.UserVO;

@Repository("profileDAO")
public class ProfileDAOImpl implements ProfileDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public Object mypage_info(ProfileVO profileVO) {
		return mybatis.selectOne("ProfileDAO.profile_info", profileVO);
	}

	@Override
	public List<ProfileVO> mypage_badge(ProfileVO profileVO) {
		return mybatis.selectList("ProfileDAO.profile_badge", profileVO);
	}

	@Override
	public List<ProfileVO> mypage_board(ProfileVO profileVO) {
		return mybatis.selectList("ProfileDAO.profile_board", profileVO);
	}

	@Override
	public void chg_pwd(String password) {
		mybatis.update("ProfileDAO.chg_pwd", password);
		
	}

}
