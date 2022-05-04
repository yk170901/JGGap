package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO_reply vo);
	
	public Board_view_VO selectBoard(int post_no);

	public List<Integer> selectChoiceList(int user_no);
	
	public List<Board_view_VO_reply> selectReplyList(int post_no);

	public void insertChosenUser(HashMap<String, Integer> map);

	public void deleteChosenUser(HashMap<String, Integer> map);

	public void insertReport(HashMap<String, String> map);
	
	public void deleteReply(int user_re_no);
	
	public void insertFriendRequest(HashMap<String, Integer> map);
	
	public List<Board_view_VO_friend> selectFriendsAndStatuses(int user_no);
}
