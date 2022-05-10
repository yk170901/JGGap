package com.lol.java.board_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_detail_Service")
public class Board_detail_ServiceImpl implements Board_detail_Service{

	@Autowired
	Board_detail_DAO board_detail_DAO;

	@Override
	public void insertAdminPost(Board_detail_VO vo) {
		board_detail_DAO.insertAdminPost(vo);
	}

	@Override
	public void insertPost(Board_detail_VO vo) {
		board_detail_DAO.insertPost(vo);
	}

	@Override
	public void updateAdminPost(Board_detail_VO vo) {
		board_detail_DAO.updateAdminPost(vo);
	}

	@Override
	public void updatePost(Board_detail_VO vo) {
		board_detail_DAO.updatePost(vo);
	}

	@Override
	public int getAdminPostNo(int user_no) {
		return board_detail_DAO.getAdminPostNo(user_no);
	}
	
	@Override
	public int getPostNo(int user_no) {
		return board_detail_DAO.getPostNo(user_no);
	}

	@Override
	public Board_detail_VO getAdminBoard(int post_no) {
		return board_detail_DAO.getAdminBoard(post_no);
	}


	@Override
	public Board_detail_VO getBoard(int post_no) {
		return board_detail_DAO.getBoard(post_no);
	}
	
	@Override
	public void deleteAdminPost(int post_no) {
		board_detail_DAO.deleteAdminPost(post_no);
	};
	
	@Override
	public void deletePost(int post_no) {
		board_detail_DAO.deletePost(post_no);
	};

}
