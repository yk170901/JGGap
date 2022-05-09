package com.lol.java.basic;

import java.util.List;

public interface BasicDAO {

	// 헤더 포인트
	BasicVO header_point(Object user_no);
	// 헤더 친구
	List<BasicVO> getfriends(Object user_no);
	// 헤더 차단
	List<BasicVO> getbanned(Object user_no);
	
}
