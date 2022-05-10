package com.lol.java.board_view;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
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

	// 관리자 글 상세보기 
	@RequestMapping("/viewAdminBoard.do")
	public String viewAdminBoard(Board_view_VO board_vo, Model model, HttpSession session) {
		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		 }
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewAdminBoard(board_vo.getPost_no()));

		return "/board_view/viewAdminBoard";
	}

	// 글 상세보기 
	@RequestMapping("/viewBoard.do")
	public String viewBoard(Board_view_VO board_vo, Board_view_VO_reply reply_vo, Model model, HttpSession session) {
		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		 }
		
		int post_no = board_vo.getPost_no();
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewBoard(post_no));

		// 채택 유저 목록 가져오는 메소드
		model.addAttribute("choice", board_view_Service.viewChoiceList(post_no));
		
		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(post_no));
		
		// 접속자 친구 상태 담은 VO 전달
		model.addAttribute("friends", board_view_Service.getFriends((int)session.getAttribute("user_no")));

		return "/board_view/viewBoard";
	}
	

	// 댓글 삽입
	@ResponseBody
	@RequestMapping("/insertReply.do")
	public String insertReply(Board_view_VO_reply reply_vo, HttpSession session, Model model){
		reply_vo.setUser_no((int)session.getAttribute("user_no"));
		
		// 댓글 넣기 
		board_view_Service.insertReply(reply_vo);
		
		return "redirect:/board_view/viewBoard.do?post_no="+reply_vo.getPost_no();
	}

	// 댓글 채택
	@ResponseBody
	@RequestMapping("/chooseUser.do")
	public void chooseUser(int writer_no, int chosen_user_no, Model model) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("writer_no", writer_no);
		map.put("chosen_user_no", chosen_user_no);
		
		board_view_Service.chooseUser(map);
	}

	// 댓글 채택 취소
	@ResponseBody
	@RequestMapping("/cancelUser.do")
	public void cancelUser(int writer_no, int chosen_user_no, Model model) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("writer_no", writer_no);
		map.put("chosen_user_no", chosen_user_no);
		
		board_view_Service.cancelUser(map);
	}

	// 신고
	@ResponseBody
	@RequestMapping("/submitReport.do")
	public void submitReport(String report_title, String report_content, String report_target, String post_no, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("report_title", report_title);
		map.put("report_content", report_content);
		map.put("reporter", String.valueOf(session.getAttribute("user_no")));
		map.put("report_target", report_target);
		map.put("report_url", post_no);
		
		board_view_Service.submitReport(map);
	} 
	

	// 댓글 삭제   
	@ResponseBody
	@RequestMapping("/deleteReply.do")
	public void deleteReply(int user_re_no, Model model, Board_view_VO_reply reply_vo) {
		board_view_Service.deleteReply(user_re_no);
	}


	// 친구 신청
	@ResponseBody
	@RequestMapping("/befriend.do")
	public void befriend(String asked_user_id, HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("asking_user_no", String.valueOf(session.getAttribute("user_no")));
		map.put("asked_user_id", asked_user_id);
		
		board_view_Service.befriend(map);
	}

	// 친구 상태 수정
	@ResponseBody
	@RequestMapping("/chgFriendStatus.do")
	public void chgFriendStatus(String action, String user_no, String friend) {
		HashMap<String, String> map = new HashMap<String, String>();

		map.put("action", action);
		map.put("user_no", user_no);
		map.put("friend", friend);
		
		board_view_Service.chgFriendStatus(map);
	}
	
}
