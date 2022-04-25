package com.lol.java.shop;

import lombok.Data;

@Data
public class ShopVO {
	
	// shop_items 테이블
	private String item_name;
	private int item_remain;
	private int item_total;
	private int item_per;
	private int item_point;
	private String item_file;
	
	// shop_apply 테이블
	private int apply_no;
	
	// user_no
	private int user_no;
	
	// 응모횟수
	private int item_applied;
	
}
