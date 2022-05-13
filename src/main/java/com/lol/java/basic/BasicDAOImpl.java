package com.lol.java.basic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("basicDAO")
public class BasicDAOImpl implements BasicDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 포인트 지급 시스템
	// 채택 시간 가져오기
	@Override
	public List<BasicVO> choice_time() {
		return mybatis.selectList("BasicDAO.choice_time");
	}
	// 전적에서 필요한 정보 가져오기
	@Override
	public List<BasicVO> record_time(BasicVO basicVO) {
		return mybatis.selectList("BasicDAO.record_time", basicVO);
	}
	// 채택 목록 가져오기
	@Override
	public List<BasicVO> taking_choice(BasicVO basicVO) {
		return mybatis.selectList("BasicDAO.taking_choice", basicVO);
	}
	// 포인트 주기
	@Override
	public void giving_point(BasicVO basicVO) {
		mybatis.insert("BasicDAO.giving_point", basicVO);
	}
	
	// 사용 가능한 포인트
	@Override
	public BasicVO header_point(Object user_no) {
		return mybatis.selectOne("BasicDAO.header_point", user_no);
	}
	
	// 친구목록
	@Override
	public List<BasicVO> getfriends(Object user_no) {
		return mybatis.selectList("BasicDAO.header_friends", user_no);
	}
	
	// 차단목록
	@Override
	public List<BasicVO> getbanned(Object user_no) {		
		return mybatis.selectList("BasicDAO.header_banned", user_no);
	}
	
    @Override
    public String level_point(Object user_no) {
       return mybatis.selectOne("BasicDAO.level_point", user_no);
    }

	
	
}
