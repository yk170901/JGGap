package com.lol.java.board_view;

import lombok.Data;

@Data
public class Board_view_VO_replier {

	/* Board */
	private String post_no;
	
	/* Reply 단 유저의 User_info */
	private String user_no;
	
	private String summoner_id;
	private int honor_rate;

	/* Reply 단 유저의 Lol_info */
	private String solo_rank_tier;
}
