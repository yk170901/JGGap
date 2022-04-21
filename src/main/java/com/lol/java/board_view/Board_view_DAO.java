package com.lol.java.board_view;

import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO_reply vo);
	
	public Board_view_VO selectBoard(String post_no);
	
	public List<Board_view_VO_reply> selectReplyList(String post_no);
}
