package com.lol.java.record;

import java.util.List;

public interface RecordService {
	
	// 전적 회원,롤 정보 가져오기
	Object record_info(RecordVO recordVO);
	
	// 롤 전적 가져오기
	List<RecordVO> record_score(RecordVO recordVO);

}
