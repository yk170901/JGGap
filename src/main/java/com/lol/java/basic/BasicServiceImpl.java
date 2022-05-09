package com.lol.java.basic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("basicService")
public class BasicServiceImpl implements BasicService{

	@Autowired
	BasicDAO basicDAO;

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
