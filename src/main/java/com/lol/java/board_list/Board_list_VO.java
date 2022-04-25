package com.lol.java.board_list;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board_list_VO {
	
	private int post_no;
	private int user_no;
	private String board_text;
	private String board_title;
	private Date board_date;
	private String game_map;
	private String game_mode;
	
	private String searchKeyword;
	private String searchCondition;
	
	private String[] search_check_map;
	private String[] search_check_mode;
	
	private String summoner_id;
	private int site_level;
	private float honor_rate;
	private String solo_rank_tier;
	private int cru_max;
	private int cru_pre;
	
}
