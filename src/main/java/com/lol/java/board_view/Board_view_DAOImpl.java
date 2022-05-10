package com.lol.java.board_view;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_view_DAO")
public class Board_view_DAOImpl implements Board_view_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	// 댓글 작성
	@Override
	public void insertReply(Board_view_VO_reply vo) {
		mybatis.insert("Board_view_DAO.insertReply", vo);
	}
	
	// 관리자 공지글 상세 보기
	@Override
	public Board_view_VO selectAdminBoard(int post_no) {
		return mybatis.selectOne("Board_view_DAO.selectAdminBoard",post_no);
	}
	
	// 글 상세 보기
	@Override
	public Board_view_VO selectBoard(int post_no) {
		return mybatis.selectOne("Board_view_DAO.selectBoard",post_no);
	}

	// 채택 유저 가져오기
	@Override
	public List<Integer> selectChoiceList(int user_no) {
		return mybatis.selectList("Board_view_DAO.selectChoiceList",user_no);
	};
	
	// 댓글 리스트 보기
	@Override
	public List<Board_view_VO_reply> selectReplyList(int post_no) {
		return mybatis.selectList("Board_view_DAO.selectReplyList",post_no);
	}

	@Override
	public int selectReplyAmount(int post_no) {
		return mybatis.selectOne("Board_view_DAO.selectReplyAmount",post_no);
	}
	
	// 채택
	@Override
	public void insertChosenUser(HashMap<String, Integer> map) {
		mybatis.insert("insertChosenUser", map);
	}
	
	// 채택 취소
	@Override
	public void deleteChosenUser(HashMap<String, Integer> map) {
		mybatis.delete("deleteChosenUser", map);
	}

	@Override
	public void deleteReply(int user_re_no) {
		mybatis.delete("deleteReply", user_re_no);
	}

	@Override
	public void increaseCruPre(int writer_no) {
		mybatis.update("increaseCruPre", writer_no);
		
	}

	@Override
	public void decreaseCruPre(int writer_no) {
		mybatis.update("decreaseCruPre", writer_no);
		
	}

	@Override
	public void insertReport(HashMap<String, String> map) {
		mybatis.insert("insertReport", map);
	}

	@Override
	public void insertFriendRequest(HashMap<String, String> map) {
		mybatis.insert("insertFriendRequest", map);
		
	}

	@Override
	public List<Board_view_VO_friend> selectFriendsAndStatuses(int user_no) {
		return mybatis.selectList("Board_view_DAO.selectFriendsAndStatuses",user_no);
	}

	@Override
	public void acceptFriendRequest(HashMap<String, String> map) {
		mybatis.update("Board_view_DAO.acceptFriendRequest", map);
	}

	@Override
	public void insertFriendAfterAcceptance(HashMap<String, String> map) {
		mybatis.insert("Board_view_DAO.insertFriendAfterAcceptance", map);
	}

	@Override
	public void deleteFriend(HashMap<String, String> map) {
		mybatis.delete("Board_view_DAO.deleteFriend", map);
	}


}