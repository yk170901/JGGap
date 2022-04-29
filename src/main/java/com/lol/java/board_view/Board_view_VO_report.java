package com.lol.java.board_view;

import lombok.Data;

@Data
public class Board_view_VO_report {
	private int report_no;
	private String reporter;
	private String report_target;
	private String report_url;
	private String report_title;
	private String report_content;
}
