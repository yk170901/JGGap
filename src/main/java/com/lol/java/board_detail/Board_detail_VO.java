package com.lol.java.board_detail;

import lombok.Data;

@Data
public class Board_detail_VO {

	private int post_no;
	private int cru_max;
	private int cru_pre;
	private int user_no;
	private String board_title;
	private String board_text;
	private String game_map;
	private String game_mode;
}
