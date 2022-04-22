package com.lol.java.board_list;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_list_DAO")
public class Board_list_DAOImpl implements Board_list_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public List<Board_list_VO> admin_boardList() {
		return mybatis.selectList("Board_list_DAO.admin_boardList");
	}

	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return mybatis.selectOne("Board_list_DAO.countBoard");
	}

	@Override
	public List<Board_list_VO> selectBoard(Paging_VO pvo) {
		// TODO Auto-generated method stub
		return mybatis.selectList("Board_list_DAO.selectBoard", pvo);
	}

	@Override
	public int searchCountBoard(Paging_VO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("searchCountBoard", vo);
	}


	
}
