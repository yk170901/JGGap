package com.lol.java.board_detail;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_detail_DAO")
public class Board_detail_DAOImpl implements Board_detail_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public void insertPost(Board_detail_VO vo) {
		mybatis.insert("Board_detail_DAO.insertPost", vo);
	}

	@Override
	public void insertAdminPost(Board_detail_VO vo) {
		mybatis.insert("Board_detail_DAO.insertAdminPost", vo);	
	};

	@Override
	public int getAdminPostNo(int user_no) {
		return mybatis.selectOne("Board_detail_DAO.getAdminPostNo", user_no);
	}

	@Override
	public int getPostNo(int user_no) {
		return mybatis.selectOne("Board_detail_DAO.getPostNo", user_no);
	}

	@Override
	public Board_detail_VO getAdminBoard(int post_no) {
		return mybatis.selectOne("Board_detail_DAO.getAdminBoard", post_no);
	}


	@Override
	public Board_detail_VO getBoard(int post_no) {
		return mybatis.selectOne("Board_detail_DAO.getBoard", post_no);
	}

	
	@Override
	public void updatePost(Board_detail_VO vo) {
		mybatis.update("updatePost", vo);
	}

	@Override
	public void updateAdminPost(Board_detail_VO vo) {
		mybatis.update("updateAdminPost", vo);
		
	}

	@Override
	public void deleteAdminPost(int post_no) {
		mybatis.update("deleteAdminPost",post_no);
		
	}
	
	@Override
	public void deletePost(int post_no) {
		mybatis.update("deletePost",post_no);
	}
}
