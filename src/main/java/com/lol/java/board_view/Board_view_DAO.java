package com.lol.java.board_view;

import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO vo);
	
	public Board_view_VO selectBoard(int post_no);
	
	public List<Board_view_VO> selectReply(int post_no);
}
