package com.lol.java.board_view;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public void viewBoard(Board_view_VO board_vo, Board_view_VO_reply reply_vo, HttpSession session, Model model) {

		session.setAttribute("user_no", 10028);
		board_vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewBoard(board_vo));

		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
	}
	
	// 채택 버튼 누르기 컨트롤러
	@RequestMapping("/checkUser.do")
	public void checkUser(){
		// 글쓴이가 눌렀나 아닌가는 이미 js에서 걸러서 true 값을 받아 진행된다는 전제 하에 코드를 쓴다.
	}
	
	// 댓긋 삽입 컨트롤러
	@RequestMapping("/insertReply.do")
	public String insertReply(Board_view_VO_reply reply_vo, HttpSession session, Model model){
		
		session.setAttribute("user_no", 10028);

		reply_vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		
		System.out.println("댓글에서 가져가는 post_no"+reply_vo.getPost_no());

		board_view_Service.insertReply(reply_vo);
		
		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
		
		return "redirect:/board_view/viewBoard.do?post_no="+reply_vo.getPost_no();
	}
	
}
