package com.lol.java.record;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("recordDAO")
public class RecordDAOImpl implements RecordDAO{

	@Autowired
	private SqlSessionTemplate mybatis;
	
}
