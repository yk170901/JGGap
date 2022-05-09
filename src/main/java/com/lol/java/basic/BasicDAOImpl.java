package com.lol.java.basic;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("basicDAO")
public class BasicDAOImpl implements BasicDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
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
