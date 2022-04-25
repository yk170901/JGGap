package com.lol.java.board_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_detail_Service")
public class Board_detail_ServiceImpl implements Board_detail_Service{

	@Autowired
	Board_detail_DAO board_detail_DAO;

	@Override
	public void insertPost(Board_detail_VO vo) {
		board_detail_DAO.insertPost(vo);
	}

	@Override
	public int getPost_no(int user_no) {
		return board_detail_DAO.getPost_no(user_no);
	}

	@Override
	public Board_detail_VO getBoard(int post_no) {
		return board_detail_DAO.getBoard(post_no);
	}

}
