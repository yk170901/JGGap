package com.lol.java.record;

import java.util.HashMap;
import java.util.List;

public interface RecordDAO {

	// 전적 회원,롤 정보 가져오기
	Object record_info(RecordVO recordVO);
	
	// 롤 전적 가져오기
	List<RecordVO> record_score(RecordVO recordVO);

	// 전적 더보기 버튼
	List<RecordVO> record_more(HashMap<String, Object> record);

	// 시각화를 위한 데이터 가져오기
	List<RecordVO> record_chart(int user_no);
}
