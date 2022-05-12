package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

public interface Board_view_DAO {
	public void insertReply(Board_view_VO_reply vo);

	public Board_view_VO selectAdminBoard(int post_no);

	public Board_view_VO selectBoard(int post_no);

	public List<Integer> selectChoiceList(int user_no);
	
	public List<Board_view_VO_reply> selectReplyList(int post_no);
	
	public int selectReplyAmount(int post_no);

	public void insertChosenUser(HashMap<String, Integer> map);

	public void deleteChosenUser(HashMap<String, Integer> map);

	public void increaseCruPre(int writer_no);

	public void decreaseCruPre(int writer_no);

	public void insertReport(HashMap<String, String> map);
	
	public void deleteReply(int user_re_no);
	
	public void insertFriendRequest(HashMap<String, String> map);
	
	public List<Board_view_VO_friend> selectFriendsAndStatuses(int user_no);

	public void acceptFriendRequest(HashMap<String, String> map);

	public void insertFriendAfterAcceptance(HashMap<String, String> map);

	public void deleteFriend(HashMap<String, String> map);
	
	public void cancelFriendRequest(HashMap<String, String> map);
}
