package com.lol.java.board_view;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	// 글 상세보기 
	@RequestMapping("/viewBoard.do")
	public void viewBoard(Board_view_VO board_vo, Board_view_VO_reply reply_vo, HttpSession session, Model model) {

		board_vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewBoard(board_vo));

		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
	}
	
	// 댓글 삽입
	@RequestMapping("/insertReply.do")
	public String insertReply(Board_view_VO_reply reply_vo, HttpSession session, Model model){
		
		reply_vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		// 댓글 넣기
		board_view_Service.insertReply(reply_vo);
		
		// 넣은 후 댓글들 보여주는 메소드 -- 아래에서 리다이렉트 할 때 자연스럽게 새로고침되지 않을까 싶어서 이게 필요한가 의문
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
		
		return "redirect:/board_view/viewBoard.do?post_no="+reply_vo.getPost_no();
	}
	
	// 댓글 채택 시 이미 채택됐던 댓글인가 보기
	@ResponseBody
	@RequestMapping("checkReplyIfChosen.do")
	public boolean checkReplyIfChosen(int user_no, int user_re_no) {
		System.out.println("ajax 요청 도착 " + user_no + "  " + user_re_no);
		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("user_no", user_no);
		map.put("user_re_no", user_re_no);

		boolean diis = board_view_Service.replyAlreadyChosen(map);
		System.out.println(diis);
		return diis;
	}

	// 댓글 채택
	@ResponseBody
	@RequestMapping("/chooseUser.do")
	public void chooseUser(int writer_no, int chosen_user_no) {
		System.out.println("chooseUser 들어옴"+writer_no+" " + chosen_user_no);
	}
}
