package com.lol.java.board_detail;

public interface Board_detail_Service {

	public void insertAdminPost(Board_detail_VO vo);

	public void insertPost(Board_detail_VO vo);

	public void updateAdminPost(Board_detail_VO vo);

	public void updatePost(Board_detail_VO vo);
	
	public int getAdminPostNo(int user_no);	
	
	public int getPostNo(int user_no);	

	public Board_detail_VO getAdminBoard(int post_no);

	public Board_detail_VO getBoard(int post_no);

	public void deleteAdminPost(int post_no);

	public void deletePost(int post_no);
}
