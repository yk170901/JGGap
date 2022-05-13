package com.lol.java.basic;

import lombok.Data;

@Data
public class BasicVO {
	private String summoner_id;
	private int usable_point;	
	private int site_level;
	private int ban;
	private String friend;
	private int login_or_not;
	
	// choice
	private int cho_timestamp;
	private int user_no;
	private int choice_user_no;
	private String opp_summoner_id;
	
	// record
	private int game_timestamp;
	private String game_mode;
	private String win;
	private String blue_summonerid1;
	private String blue_summonerid2;
	private String blue_summonerid3;
	private String blue_summonerid4;
	private String blue_summonerid5;
	private String red_summonerid1;
	private String red_summonerid2;
	private String red_summonerid3;
	private String red_summonerid4;
	private String red_summonerid5;
	
	private int yesterday_time;
	private int point;
	
}
