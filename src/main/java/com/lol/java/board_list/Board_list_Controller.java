package com.lol.java.board_list;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인게시판(목록) 페이지
@Controller
@RequestMapping("/board_list")
public class Board_list_Controller {

	@Autowired
	private Board_list_Service board_list_Service;

}
