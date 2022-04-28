package com.lol.java.record;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("recordService")
public class RecordServiceImpl implements RecordService{

	@Autowired
	RecordDAO recordDAO;

	// 전적 회원,롤 정보 가져오기
	@Override
	public Object record_info(RecordVO recordVO) {
		return recordDAO.record_info(recordVO);
	}
	
}
