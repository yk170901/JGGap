package com.lol.java.shop;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("shopDAO")
public class ShopDAOImpl implements ShopDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int getUsablePoints(ShopVO vo) {		
		return mybatis.selectOne("ShopDAO.usablePoints", vo.getUser_no());
	}

	@Override
	public List<ShopVO> getItems() {
		return mybatis.selectList("ShopDAO.getItems");
	}

	@Override
	public void insertItem(ShopVO vo) {
		mybatis.insert("ShopDAO.insertItem", vo);
	}

	@Override
	public List<ShopVO> getCounts(ShopVO vo) {
		return mybatis.selectOne("ShopDAO.getCounts", vo);
	}

	@Override
	public void insertApply(ShopVO vo) {
		mybatis.insert("ShopDAO.insertApply", vo);
	}

}
