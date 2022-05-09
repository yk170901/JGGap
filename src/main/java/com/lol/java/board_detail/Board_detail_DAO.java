package com.lol.java.board_detail;

public interface Board_detail_DAO {

	public void insertPost(Board_detail_VO vo);
	
	public void insertAdminPost(Board_detail_VO vo);

	public int getPost_no(int user_no);

	public Board_detail_VO getBoard(int post_no);

	public void updatePost(Board_detail_VO vo);
	
	public void deletePost(int post_no);
	
}
