package com.lol.java.board_view;

import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO vo);
	
	public Board_view_VO selectBoard(String post_no);
	
	public Board_view_VO selectWriter(String user_no_writer);
	
	public List<Board_view_VO> selectReply(int post_no);
	
}
