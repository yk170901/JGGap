package com.lol.java.board_view;

import java.util.Date;

import lombok.Data;

@Data
public class Board_view_VO_reply {

	/* Board */
	private int post_no;

	/* Re_board */
	private String user_re_no;
	private String user_no;
	private String re_text;
	private Date re_date;
	
	/* 댓글 개수 */
	
	/* 채택된 댓글 수 */

}
