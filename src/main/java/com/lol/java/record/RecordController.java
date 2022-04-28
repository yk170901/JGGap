package com.lol.java.record;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 전적 페이지
@Controller
@RequestMapping("/record")
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	// 전적 페이지 불러오기
	@RequestMapping("/record.do")
	public void profile(Model model, RecordVO recordVO) {
		model.addAttribute("record", recordService.record_info(recordVO));
		model.addAttribute("score", recordService.record_score(recordVO));
	}
}
