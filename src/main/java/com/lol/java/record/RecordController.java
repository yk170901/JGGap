package com.lol.java.record;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 페이지
@Controller
@RequestMapping("/record")
public class RecordController {

	@Autowired
	private RecordService recordService;

}
