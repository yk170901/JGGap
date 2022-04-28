package com.lol.java.record;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("recordDAO")
public class RecordDAOImpl implements RecordDAO{

	@Autowired
	private SqlSessionTemplate mybatis;

	// 전적 회원,롤 정보 가져오기
	@Override
	public Object record_info(RecordVO recordVO) {
		return mybatis.selectOne("RecordDAO.record_info",recordVO);
	}
	
}
