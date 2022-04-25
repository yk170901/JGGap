package com.lol.java.board_detail;

public interface Board_detail_Service {

	public void insertPost(Board_detail_VO vo);
	
	public int getPost_no(int user_no);	
	
	public Board_detail_VO getBoard(int post_no);

}
