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
	public void viewBoard(Board_view_VO board_vo, Board_view_VO_reply reply_vo, Model model) {

		// 포스트 넘버 가져오기
		System.out.println("삽입 전의 포스트 넘버 : "+ board_vo.getPost_no());
		board_vo.setPost_no("108");
		reply_vo.setPost_no("108");
		
		// 들어온 사람이 
		if (true) {
			System.out.println("당신은 글쓴이입니다");
			// 수정, 삭제 버튼도 보여주기
		}
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewBoard(board_vo));
		
		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
		
		System.out.println("최종 보드 : " + board_vo);
		System.out.println("최종 댓글 : " + reply_vo);
	}
	
	// 댓긋 삽입 컨트롤러
	@RequestMapping("/insertReply.do")
	public String insertReply(Board_view_VO_reply reply_vo, HttpSession session, Model model){
		
		session.setAttribute("user_no", 10028);

		reply_vo.setUser_no(String.valueOf(session.getAttribute("user_no")));
		
		board_view_Service.insertReply(reply_vo);
		
		reply_vo.setPost_no("108");
		
		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
		
		return "redirect:/board_view/viewBoard.do";
	}
	
}
