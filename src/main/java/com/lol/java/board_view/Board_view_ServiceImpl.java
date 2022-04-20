package com.lol.java.board_view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_view_Service")
public class Board_view_ServiceImpl implements Board_view_Service{

	@Autowired
	Board_view_DAO board_view_DAO;

	@Override
	public Board_view_VO viewBoard(Board_view_VO vo) {

		// 게시글 정보를 받는 메소드
		vo = board_view_DAO.selectBoard(vo.getPost_no());
		System.out.println("게시글 정보만 가져온 뒤" +  vo);
		// 게시글 글쓴이의 정보를 받는 메소드
		/*
		 * System.out.println("유저넘버:"+ vo.getUser_no_writer()); vo =
		 * board_view_DAO.selectWriter(vo.getUser_no_writer());
		 */

		System.out.println("게시글 글쓴이 정보도 가져온 뒤" +  vo);
		// 댓글 정보를 댓글의 수만큼 배열의 형태로 가져오는 메소드
		// 얘는 DAOImpl에서 mybatis.selectList("selectReplyList",vo); 하면 될 듯
		// List<Board_view_VO_reply>
		 
		return vo;
		
	}

	@Override
	public void insertReply(Board_view_VO vo) {
		board_view_DAO.insertReply(vo);
	}

}
