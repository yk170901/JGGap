package com.lol.java.board_view;

import lombok.Data;

@Data
public class Board_view_VO_writer {

	/* User_info */
	private String user_no;
	private String summoner_id;
	private float honor_rate;
	private int site_level;

	/* Lol_info */
	private String solo_rank_tier;
}
