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
		private int champion_level;
		private int primary_perk;
		private int sub_perk;
		private int item0;
		private int item1;
		private int item2;
		private int item3;
		private int item4;
		private int item5;
		private int item6;
		private int kills;
		private int deaths;
		private int assists;
		private String win;
		private String spell_fir;
		private String spell_sec;
		private int gameid;
		private String lane;
		private String game_duration;
		private String game_timestamp;
		private String multi_killed;
		private String game_mode;
		private int eaten_minions;
		private int vision_point;
		private int ward_cnt;
		private int team_total_kills;
		private String blue_champion1;
		private String blue_summonerid1;
		private String blue_champion2;
		private String blue_summonerid2;
		private String blue_champion3;
		private String blue_summonerid3;
		private String blue_champion4;
		private String blue_summonerid4;
		private String blue_champion5;
		private String blue_summonerid5;
		private String red_champion1;
		private String red_summonerid1;
		private String red_champion2;
		private String red_summonerid2;
		private String red_champion3;
		private String red_summonerid3;
		private String red_champion4;
		private String red_summonerid4;
		private String red_champion5;
		private String red_summonerid5;
		private String champion_name_KR;
		
		// count
		private int champion_cnt;
		private int lane_cnt;
		private int win_cnt;
		private int lose_cnt;
}
