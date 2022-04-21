package com.lol.java.board_view;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_view_DAO")
public class Board_view_DAOImpl implements Board_view_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertReply(Board_view_VO_reply vo) {
		// 댓글 넣기
		mybatis.insert("Board_view_DAO.insertReply", vo);
	}
	
	@Override
	public Board_view_VO selectBoard(String post_no) {
		return mybatis.selectOne("Board_view_DAO.selectBoard",post_no);
	}
	
	public List<Board_view_VO_reply> selectReplyList(String post_no) {
		// 댓글의 정보, 댓글쓴이의 정보를 가져올 것. 여러 사람이 댓글을 달 수 있기에 List의 형태로 줌.
		return mybatis.selectList("Board_view_DAO.selectReplyList",post_no);
	}

}