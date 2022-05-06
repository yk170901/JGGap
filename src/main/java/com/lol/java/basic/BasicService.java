package com.lol.java.basic;

import java.util.List;

public interface BasicService {

	// 헤더 포인트
	BasicVO header_point(Object user_no);
	List<BasicVO> getfriends(Object user_no);
	List<BasicVO> getbanned(Object user_no);
}
