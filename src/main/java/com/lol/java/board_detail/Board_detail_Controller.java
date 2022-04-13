package com.lol.java.board_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

// 구인게시판(작성, 상세) 페이지
@Controller
@RequestMapping("/board_detail")
public class Board_detail_Controller {

	@Autowired
	private Board_detail_Service board_detail_Service;

	@RequestMapping("/writing_page.do")
	public void getPost() {
		Board_detail_VO b_vo = new Board_detail_VO();
		
		b_vo= board_detail_Service.getPost(null);
		System.out.println(b_vo.getName());
	}

}
