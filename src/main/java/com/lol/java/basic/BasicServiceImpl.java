package com.lol.java.basic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("basicService")
public class BasicServiceImpl implements BasicService{

	@Autowired
	BasicDAO basicDAO;

	// 포인트 지급 시스템
	// 채택 시간 가져오기
	@Override
	public List<BasicVO>choice_time() {
		return basicDAO.choice_time();
	}
	// 전적에서 필요한 정보 가져오기
	@Override
	public List<BasicVO>record_time(BasicVO basicVO) {
		return basicDAO.record_time(basicVO);
	}
	// 채택 목록 가져오기
	@Override
	public List<BasicVO>taking_choice(BasicVO basicVO) {
		return basicDAO.taking_choice(basicVO);
	}
	// 포인트 주기
	@Override
	public void giving_point(BasicVO basicVO) {
		basicDAO.giving_point(basicVO);	
	}
	
	// 헤더 포인트
	@Override
	public BasicVO header_point(Object user_no) {
		return basicDAO.header_point(user_no);
	}

	@Override
	public List<BasicVO> getfriends(Object user_no) {
		return basicDAO.getfriends(user_no);
	}

	@Override
	public List<BasicVO> getbanned(Object user_no) {		
		return basicDAO.getbanned(user_no);
	}
	
	@Override
	public String level_point(Object user_no) {
	    return basicDAO.level_point(user_no);
	}

	
}
