package com.lol.java.board_detail;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("board_detail_DAO")
public class Board_detail_DAOImpl implements Board_detail_DAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
}
