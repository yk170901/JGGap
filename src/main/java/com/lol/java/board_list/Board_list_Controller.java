package com.lol.java.board_list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인게시판(목록) 페이지
@Controller
@RequestMapping("/board_list")
public class Board_list_Controller {

	@Autowired
	private Board_list_Service board_list_Service;
	
	@RequestMapping(value="/board_list.do")
	public String boardList(Model model) {
		model.addAttribute("list", board_list_Service.boardList());
		return "/board_list/board_list";
	}

}
