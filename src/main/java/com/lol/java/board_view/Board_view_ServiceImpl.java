package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("board_view_Service")
public class Board_view_ServiceImpl implements Board_view_Service{

	@Autowired
	Board_view_DAO board_view_DAO;

	
	// 관리자 공지글 상세 보기
	@Override
	public Board_view_VO viewAdminBoard(int post_no) {
		return board_view_DAO.selectAdminBoard(post_no);
	}

	// 글 상세 보기
	@Override
	public Board_view_VO viewBoard(int post_no) {
		Board_view_VO vo = board_view_DAO.selectBoard(post_no);
		vo.setReply_amount(board_view_DAO.selectReplyAmount(post_no));
		return vo;
	}

	// 채택 목록 가져오기
	@Override
	public List<Integer> viewChoiceList(int user_no) {
		return board_view_DAO.selectChoiceList(user_no);
	};
	
	// 댓글 목록 가져오기
	@Override
	public List<Board_view_VO_reply> viewReplyList(int post_no) {
		return board_view_DAO.selectReplyList(post_no);
	}

	// 댓글 작성
	@Override 
	public void insertReply(Board_view_VO_reply vo) {
		board_view_DAO.insertReply(vo);
	}

	// 유저 채택
	@Override
	public void chooseUser(HashMap<String, Long> map) {
		board_view_DAO.insertChosenUser(map);
		board_view_DAO.increaseCruPre(Math.toIntExact(map.get("writer_no")));
	}

	// 채택 취소
	@Override
	public void cancelUser(HashMap<String, Integer> map) {
		board_view_DAO.deleteChosenUser(map);
		board_view_DAO.decreaseCruPre(map.get("writer_no"));
	}

	// 댓글 삭제
	@Override
	public void deleteReply(int user_re_no) {
		board_view_DAO.deleteReply(user_re_no);
	}
	
	// 신고 작성
	@Override
	public void submitReport(HashMap<String, String> map) {
		board_view_DAO.insertReport(map);
	}

	// 친구 추가
	@Override
	public void befriend(HashMap<String, String> map) {
		board_view_DAO.insertFriendRequest(map);
	}

	// 친구 목록 가져오기
	@Override
	public List<Board_view_VO_friend> getFriends(int user_no) {
		return board_view_DAO.selectFriendsAndStatuses(user_no);
	}

	// 친구 상태 바꾸기
	@Override
	public void chgFriendStatus(HashMap<String, String> map) {
		switch (map.get("action")) {
		case "cancelBan":
		case "deleteFriend":
			board_view_DAO.deleteFriend(map);
		case "cancelFriendRequest":
			board_view_DAO.cancelFriendRequest(map);
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
