package com.lol.java.record;

import java.util.HashMap;
import java.util.List;

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
	
	// 롤 전적 가져오기
	@Override
	public List<RecordVO> record_score(RecordVO recordVO) {
		return mybatis.selectList("RecordDAO.record_score",recordVO);
	}
	
	// 전적 더보기 버튼
	@Override
	public List<RecordVO> record_more(HashMap<String, Object> record) {
		return mybatis.selectList("RecordDAO.record_more", record);
	}
	
}
