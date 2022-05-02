package com.lol.java.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDAO")
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<AdminVO> user_list() {
		
		return mybatis.selectList("AdminDAO.user_list");
	}

	@Override
	public int member_count() {
		
		return mybatis.selectOne("AdminDAO.member_count");
	}
	
}
