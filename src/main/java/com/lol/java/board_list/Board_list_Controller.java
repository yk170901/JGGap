package com.lol.java.board_list;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// 구인게시판(목록) 페이지
@Controller
@RequestMapping("/board_list")
public class Board_list_Controller {

	@Autowired
	private Board_list_Service board_list_Service;
	
	@RequestMapping("/board_list.do")
	public String boardList(Paging_VO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, String searchCondition,String searchKeyword) {
		
		int total = board_list_Service.countBoard();
		// 리스트에 몇개 보여주는 기능
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchCondition, searchKeyword);
		model.addAttribute("admin_list", board_list_Service.admin_boardList());
		model.addAttribute("paging", vo);
		model.addAttribute("list", board_list_Service.selectBoard(vo));
		return "/board_list/board_list";
	}
}
