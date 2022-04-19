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
	public void insertReply(Board_view_VO vo) {
		// 댓글 넣기
		mybatis.insert("insertReply", vo);
	}
	
	@Override
	public Board_view_VO selectBoard(int post_no) {
		mybatis.selectOne("selectBoard",post_no);
		return null;
	}

	public List<Board_view_VO> selectReply(int post_no) {
		// 댓글의 정보, 댓글쓴이의 정보를 가져올 것. 여러 사람이 댓글을 달 수 있기에 List의 형태로 줌.
		return null;
	}

}