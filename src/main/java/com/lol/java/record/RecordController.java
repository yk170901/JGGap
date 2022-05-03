package com.lol.java.record;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 전적 페이지
@Controller
@RequestMapping("/record")
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	// 전적 페이지 불러오기
	@RequestMapping("/record.do")
	public void record(Model model, RecordVO recordVO) {
		model.addAttribute("record", recordService.record_info(recordVO));
		model.addAttribute("score", recordService.record_score(recordVO));
	}
	
	// 전적 더보기 버튼
	@ResponseBody
	@RequestMapping("/record_more.do")
	public Object record_more(int begin_num, HttpSession session) {
		
		HashMap<String,Object> record = new HashMap<String, Object>();
		record.put("user_no", session.getAttribute("user_no"));
		record.put("begin_num", begin_num);
		List<RecordVO> recordVO = recordService.record_more(record);
		return recordVO;
		
	}
	
}
