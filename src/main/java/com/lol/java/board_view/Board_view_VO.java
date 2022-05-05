package com.lol.java.board_view;

import java.util.Date;

import lombok.Data;

@Data
public class Board_view_VO {

	/* User_info */
	private int user_no;

	/* Board */
	private int post_no;
	private String board_title;
	private String board_text;
	private String game_map;
	private String game_mode;
	private int cru_pre;
	private int cru_max;
	private String board_date;

	/* 댓글 수 */
	private int reply_amount;
	
	Board_view_VO_writer writer;
}
