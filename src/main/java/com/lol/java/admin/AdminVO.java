package com.lol.java.admin;

import java.sql.Date;

import lombok.Data;

@Data
public class AdminVO {

	private int user_no;
	private int ban;
	private int site_level;
	private int usable_point;
	private int profile_icon;
	private float honor_rate;
	private Date join_date;
	private String user_id;
	private String summoner_id;
	private String phone_number;
	
	
}
