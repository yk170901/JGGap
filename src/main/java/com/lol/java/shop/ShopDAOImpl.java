package com.lol.java.shop;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shopDAO")
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int getUsablePoints(ShopVO vo) {		
		return mybatis.selectOne("ShopDAO.usablepoints", vo);
	}

}
