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
	public Board_view_VO viewBoard(int post_no) {
		return board_view_DAO.selectBoard(post_no);
	}

	@Override
	public List<Integer> viewChoiceList(int user_no) {
		return board_view_DAO.selectChoiceList(user_no);
	};
	
	@Override
	public List<Board_view_VO_reply> viewReplyList(int post_no) {
		return board_view_DAO.selectReplyList(post_no);
	}

	@Override
	public void insertReply(Board_view_VO_reply vo) {
		board_view_DAO.insertReply(vo);
	}

	@Override
	public void chooseUser(HashMap<String, Integer> map) {
		board_view_DAO.insertChosenUser(map);
	}

	@Override
	public void cancelUser(HashMap<String, Integer> map) {
		board_view_DAO.deleteChosenUser(map);
	}

	/*
	 * @Override public boolean replyAlreadyChosen(HashMap<String, Integer> map) {
	 * int count_chosen_user = board_view_DAO.selectUserChoNo(map);
	 * 
	 * if(count_chosen_user == 1) { return true; }else {
	 * System.out.println(count_chosen_user); } return false; }
	 */

}
