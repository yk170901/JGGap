package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO_reply vo);
	
	public Board_view_VO selectBoard(int post_no);
	
	public List<Board_view_VO_reply> selectReplyList(int post_no);
	
	public int selectUserChoNo(HashMap<String, Integer> map);
}
