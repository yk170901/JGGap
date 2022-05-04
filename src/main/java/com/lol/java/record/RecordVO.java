package com.lol.java.record;

import lombok.Data;

@Data
public class RecordVO {

	// User_Info
		private int user_no;
		private String summoner_id;
		private String profile_icon;
		
	// LOL_Info
		private int lol_info_no;
		private String solo_tier;
		private String solo_tier_grade;
		private int solo_win;
		private int solo_lose;
		private int solo_lp;
		private String free_tier;
		private String free_tier_grade;
		private int free_win;
		private int free_lose;
		private int free_lp;
		
	// LOL_Record
		private int record_no;
		private String champion_name;
}
