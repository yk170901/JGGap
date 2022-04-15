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
	public List<Board_list_VO> boardList(Board_list_VO vo) {
		// TODO Auto-generated method stub
		System.out.println("나왔졍");
		List<Board_list_VO> list = mybatis.selectList("Board_list_DAO.boardList", vo);
		System.out.println(list);
		return mybatis.selectList("Board_list_DAO.boardList");
	}
	
}
