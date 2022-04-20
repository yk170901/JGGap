package com.lol.java.board_view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_view_Service")
public class Board_view_ServiceImpl implements Board_view_Service{

	@Autowired
	Board_view_DAO board_view_DAO;

	@Override
	public void viewBoard(Board_view_VO vo) {
		
		// 게시글 정보를 받는 메소드 호출하여 게시글 번호 (post_no) 넘겨주기
		board_view_DAO.selectBoard(vo.getPost_no());
		
		// 댓글 정보를 댓글의 수만큼 배열의 형태로 가져오는 메소드
		
	}

	@Override
	public void insertReply(Board_view_VO vo) {
		board_view_DAO.insertReply(vo);
	}

}
