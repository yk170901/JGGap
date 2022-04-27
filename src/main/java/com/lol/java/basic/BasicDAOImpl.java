package com.lol.java.basic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("basicDAO")
public class BasicDAOImpl implements BasicDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public String header_point(Object user_no) {
		return mybatis.selectOne("BasicDAO.header_point", user_no);
	}
	
}
