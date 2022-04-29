package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

public interface Board_view_Service {
	
	public void insertReply(Board_view_VO_reply vo);
	
	public Board_view_VO viewBoard(int post_no);
	
	public List<Integer> viewChoiceList(int user_no);
	
	public List<Board_view_VO_reply> viewReplyList(int post_no);
	
	public boolean replyAlreadyChosen(HashMap<String, Integer> map);
}
