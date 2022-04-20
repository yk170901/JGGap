package com.lol.java.profile;

import lombok.Data;

@Data
public class ProfileVO {
	
	// User_Info
	private int user_no;
	private String summoner_id;
	private String user_pwd;
	private float honor_rate;
	private String profile_icon;
	
	// Badge
	private int badge_no;
	private String badge_name;
	
	// Board
	private int post_no;
	private String board_title;
	private String board_text;
	private String board_date;
	
	// Choice
	private int user_cho_no;
	private int user_re_no;
	private String choice;
	
	
}
