package com.lol.java.board_view;

import java.util.List;

public interface Board_view_Service {
	
	public void insertReply(Board_view_VO_reply vo);
	
	public Board_view_VO viewBoard(Board_view_VO vo);
	
	public List<Board_view_VO_reply> viewReplies(String post_no);
}
