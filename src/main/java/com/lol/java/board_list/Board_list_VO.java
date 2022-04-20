package com.lol.java.board_list;

import java.sql.Date;

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
}
