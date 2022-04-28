package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

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

		System.out.println("viewBoard 셀렉트 보드" +  vo);
		return vo;	
	}
	
	@Override
	public List<Board_view_VO_reply> viewReplyList(int post_no) {
		return board_view_DAO.selectReplyList(post_no);
	}

	@Override
	public void insertReply(Board_view_VO_reply vo) {
		board_view_DAO.insertReply(vo);
	}

	@Override
	public boolean replyAlreadyChosen(HashMap<String, Integer> map) {
		int count_chosen_user = board_view_DAO.selectUserChoNo(map);
		
		if(count_chosen_user == 1) {
			return true;
		}else {
			System.out.println(count_chosen_user);
		}
		return false;
	}

}
