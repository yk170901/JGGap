package com.lol.java.board_view;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_view_DAO")
public class Board_view_DAOImpl implements Board_view_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;

}