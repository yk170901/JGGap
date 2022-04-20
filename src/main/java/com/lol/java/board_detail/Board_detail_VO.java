package com.lol.java.board_detail;

import java.util.Date;

import lombok.Data;

@Data
public class Board_detail_VO {

	private int post_no;
	private int recruitment;
	private String user_no;
	private String board_title;
	private String board_text;
	private String game_map;
	private String game_mode;
	
}
