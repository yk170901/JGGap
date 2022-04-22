package com.lol.java.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("shopService")
public class ShopServiceImpl implements ShopService{

	@Autowired
	ShopDAO shopDAO;

	@Override
	public int getUsablePoints(ShopVO vo) {
		return shopDAO.getUsablePoints(vo);
	}
	
}
