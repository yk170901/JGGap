package com.lol.java.board_view;

import java.util.Date;

import lombok.Data;

@Data
public class Board_view_VO_reply {

	/* Board */
	private int post_no;

	/* Re_board */
	private int user_re_no;
	private int user_no;
	private String re_text;
	private Date re_date;
	
	Board_view_VO_replier replier;
	 
	/* 댓글 개수 */
	private int reply_count;
}
