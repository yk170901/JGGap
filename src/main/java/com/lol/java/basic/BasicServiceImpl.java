package com.lol.java.basic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("basicService")
public class BasicServiceImpl implements BasicService{

	@Autowired
	BasicDAO basicDAO;

	// 헤더 포인트
	@Override
	public String header_point(Object user_no) {
		return basicDAO.header_point(user_no);
	}
	
}
