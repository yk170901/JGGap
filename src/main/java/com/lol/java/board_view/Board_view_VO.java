package com.lol.java.board_view;

import java.util.Date;

import lombok.Data;

@Data
public class Board_view_VO {

	/* User_info */
	private String user_no_writer;
	private String summoner_id_writer;
	private int honor_rate_writer;

	/* Lol_info */
	private String solo_rank_tier_writer;

	/* Board */
	private int post_no;
	private String board_title;
	private String board_text;
	private String game_map;
	private String game_mode;
	private Date board_date;


	/* 댓글 달 때 쓸, Reply 단 유저의 user_no (세션으로 받음) */
	private String user_no_reply_insert;
	private String re_text_insert;
	
	/* Reply 단 유저의 User_info */
	private String summoner_id_reply[];
	private String user_no_reply[];
	private int honor_rate_reply[];

	/* Reply 단 유저의 Lol_info */
	private String solo_rank_tier_reply[];

	/* Re_board */
	private String re_text[];
	private Date re_date[];

	/* 댓글 수. 내가 DAOImpl에서 따로 set 해야 함. */
	private int re_no;
	
	/*
	 * 채택된 댓글 수. 내가 DAOImpl에서 따로 set 해야 함. private int choice_no;
	 */
}
