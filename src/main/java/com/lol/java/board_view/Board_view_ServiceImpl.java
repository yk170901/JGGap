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
		Board_view_VO vo = board_view_DAO.selectBoard(post_no);
		vo.setReply_amount(board_view_DAO.selectReplyAmount(post_no));
		return vo;
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
		board_view_DAO.increaseCruPre(map.get("writer_no"));
	}

	@Override
	public void cancelUser(HashMap<String, Integer> map) {
		board_view_DAO.deleteChosenUser(map);
		board_view_DAO.decreaseCruPre(map.get("writer_no"));
	}

	@Override
	public void deleteReply(int user_re_no) {
		board_view_DAO.deleteReply(user_re_no);
	}
	
	@Override
	public void submitReport(HashMap<String, String> map) {
		board_view_DAO.insertReport(map);
	}


	@Override
	public void befriend(HashMap<String, String> map) {
		board_view_DAO.insertFriendRequest(map);
	}

	@Override
	public List<Board_view_VO_friend> getFriends(int user_no) {
		return board_view_DAO.selectFriendsAndStatuses(user_no);
	}

	@Override
	public void chgFriendStatus(HashMap<String, String> map) {
		switch (map.get("action")) {
		case "cancelBan":
		case "deleteFriend":
		case "cancelFriendRequest":
			board_view_DAO.deleteFriend(map);
			break;
		case "acceptFriendRequest":
			board_view_DAO.acceptFriendRequest(map);
			board_view_DAO.insertFriendAfterAcceptance(map);
			break;
		default:
			System.out.println("chgFriendStatus action 에러 발생");
			break;
		}
	}
}
