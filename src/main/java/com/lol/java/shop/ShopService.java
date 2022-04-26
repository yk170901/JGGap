package com.lol.java.shop;

import java.util.List;

public interface ShopService {
	// 사용가능 포인트 조회
	List<ShopVO> getUsablePoints(ShopVO vo);
	// 상품테이블 전체조회
	List<ShopVO> getItems();
	// 상품 추가
	void insertItem(ShopVO vo);	
	// 응모횟수 조회
	List<ShopVO> getCounts(ShopVO vo);
	// 응모버튼 클릭
	void insertApply(ShopVO vo);
}
