package com.lol.java.basic;

import java.util.List;

public interface BasicDAO {

	// 헤더 포인트
	BasicVO header_point(Object user_no);
	// 헤더 팔로워
	List<BasicVO> follower(Object user_no);
}
