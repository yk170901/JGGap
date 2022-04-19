package com.lol.java.board_list;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 구인게시판(목록) 페이지
@Controller
@RequestMapping("/board_list")
public class Board_list_Controller {

	@Autowired
	private Board_list_Service board_list_Service;
	
	@RequestMapping(value="/board_list.do")
	public String boardList(Model model, HttpServletRequest request) {
		String result = request.getParameter("searchKeyword");
		model.addAttribute("admin_list", board_list_Service.admin_boardList());
		model.addAttribute("list", board_list_Service.boardList(result));
		return "/board_list/board_list";
	}
	
//	@RequestMapping(value="/board_list_search.do", method = RequestMethod.GET)
//	public String search_boardList(Model model, HttpServletRequest request) {
//		model.addAttribute("search_list", board_list_Service.search_boardList());		
//		return "/board_list/test";
//	}
}
