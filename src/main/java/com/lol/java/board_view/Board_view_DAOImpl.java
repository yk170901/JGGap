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
		// 댓글의 정보, 댓글쓴이의 정보를 가져올 것. 여러 사람이 댓글을 달 수 있기에 List의 형태로 줌.
		return mybatis.selectList("Board_view_DAO.selectReplyList",post_no);
	}
	
	// 댓글 채택
	@Override
	public void insertChosenUser(HashMap<String, Integer> map) {
		mybatis.update("increaseCruPre", map.get("writer_no"));
		mybatis.insert("insertChosenUser", map);
	}

	@Override
	public void deleteChosenUser(HashMap<String, Integer> map) {
		mybatis.update("decreaseCruPre", map.get("writer_no"));
		mybatis.delete("deleteChosenUser", map);
		
	}

	@Override
	public void insertReport(HashMap<String, String> map) {
		mybatis.insert("insertReport", map);
	}

	@Override
	public void deleteReply(int user_re_no) {
		mybatis.delete("deleteReply", user_re_no);
	}

	@Override
	public void insertFriendRequest(HashMap<String, Integer> map) {
		mybatis.insert("insertFriendRequest", map);
		System.out.println("하싲말ㄹ");
		
	}

	@Override
	public List<Board_view_VO_friend> selectFriendsAndStatuses(int user_no) {
		return mybatis.selectList("Board_view_DAO.selectFriendsAndStatuses",user_no);
	}
}