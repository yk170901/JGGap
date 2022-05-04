package com.lol.java.record;

import java.util.HashMap;
import java.util.List;

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
	
	// 롤 전적 가져오기
	@Override
	public List<RecordVO> record_score(RecordVO recordVO) {
		return recordDAO.record_score(recordVO);
	}
	
	// 전적 더보기 버튼
	@Override
	public List<RecordVO> record_more(HashMap<String, Object> record) {
		return recordDAO.record_more(record);
	}

	// 시각화를 위한 데이터 가져오기
	// 20판 전체승률
	@Override
	public List<RecordVO> record_chart(int user_no) {
		return recordDAO.record_chart(user_no);
	}

	// 20판 챔피언별승률
	@Override
	public List<RecordVO> record_champion_rate(int user_no) {
		return recordDAO.record_champion_rate(user_no);
	}

	// 20판 라인별승률
	@Override
	public List<RecordVO> record_lane_rate(int user_no) {
		return recordDAO.record_lane_rate(user_no);
	}
	
}
