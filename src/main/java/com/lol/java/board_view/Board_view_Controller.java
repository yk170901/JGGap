package com.lol.java.board_view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// 구인게시판(작성, 상세) 페이지
@Controller
@RequestMapping("/board_view")
public class Board_view_Controller {
 
	@Autowired
	private Board_view_Service board_view_Service;
	

	@RequestMapping("/{path}.do")
	public String viewPage(@PathVariable String path) {
		return "board_view/"+path;
	}
	
	@RequestMapping("/viewBoard.do")
	public void viewBoard(Board_view_VO vo) {
		board_view_Service.viewBoard(vo);
	}
	
	
	
	// 댓긋 삽입 컨트롤러
	@RequestMapping("/insertReply.do")
	public String insertReply(Board_view_VO vo, HttpSession session){
		
		session.setAttribute("user_no", 10028);
		
		vo.setUser_no_reply_insert(String.valueOf(session.getAttribute("user_no")));
		
		System.out.println(vo);
		
		board_view_Service.insertReply(vo);
		
		return "redirect:/board_view/viewBoard.do";
		
	}
	
}
