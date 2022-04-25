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
	private String badge_file;
	private String badge_require;
	
	// Board
	private int post_no;
	private String board_title;
	private String board_text;
	private String board_date;
	
	// Choice
	private int choice_user_no;
	private String solo_rank_tier;
	
	
}
