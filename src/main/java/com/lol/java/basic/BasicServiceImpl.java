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
	public List<BasicVO> follower(Object user_no) {
		return basicDAO.follower(user_no);
	}
	
}
