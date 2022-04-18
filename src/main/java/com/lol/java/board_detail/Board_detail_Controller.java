package com.lol.java.board_detail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인게시판(작성, 상세) 페이지
@Controller
@RequestMapping("/board_detail")
public class Board_detail_Controller {
 
	@Autowired
	private Board_detail_Service board_detail_Service;
	

	@RequestMapping("/{path}.do")
	public String viewPage(@PathVariable String path) {
		return "board_detail/"+path;
	}

	@RequestMapping("/postInsert.do")
	public String insertPost(Board_detail_VO vo) {
		System.out.println(vo);
		board_detail_Service.insertPost(vo);
		
//		return "redirect:/detail_page.do";
		return "redirect:/board_list/board_list.do";
	}
	
	@RequestMapping("/board_detail.do")
	public String insertPost(int user_no) {
		board_detail_Service.getUserInfo(user_no);
		
//		return "redirect:/detail_page.do";
		return "redirect:/board_list/board_list.do";
	}

}
