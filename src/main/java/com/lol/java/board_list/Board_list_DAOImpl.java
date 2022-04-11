package com.lol.java.board_list;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_list_DAO")
public class Board_list_DAOImpl implements Board_list_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
}
