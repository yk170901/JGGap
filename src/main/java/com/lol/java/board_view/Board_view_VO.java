package com.lol.java.board_view;

import java.util.Date;

import lombok.Data;

@Data
public class Board_view_VO {

	private int user_no;

	/* User_info*/
	/* private int site_level; */
	private int honor_rate;
	
	/* Lol_info */
	private String solo_rank_tier;
	

	/* Board */
	private int post_no;
	private String board_title;
	private String board_text;
	private String game_map;
	private String game_mode;
	private Date board_date;
	
	/* Re_board */
	private String re_text;
	private Date re_date;
	
	
	/* 댓글 수. 내가 DAOImpl에서 따로 set 해야 함. */
	private int re_no;
}
