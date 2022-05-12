package com.lol.java.board_detail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	// 관리자글 작성
	@RequestMapping("/adminPostInsert.do")
	public String insertAdminPost(Board_detail_VO vo, HttpSession session) {
		vo.setUser_no((int)session.getAttribute("user_no"));
		
		board_detail_Service.insertAdminPost(vo);
		
		// 유저 번호를 사용해, 그 유저의 최신 작성글 번호 post_no 가져오기		
		return "redirect:/board_view/viewAdminBoard.do?post_no=" + board_detail_Service.getAdminPostNo(vo.getUser_no());
	}

	// 글 작성
	@RequestMapping("/postInsert.do")
	public String insertPost(Board_detail_VO vo, HttpSession session) {
		vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));
		
		board_detail_Service.insertPost(vo);
		
		// 유저 번호를 사용해, 그 유저의 최신 작성글 번호 post_no 가져오기
		int post_no = board_detail_Service.getPostNo(vo.getUser_no());
		
		return "redirect:/board_view/viewBoard.do?post_no="+post_no;
	}
	
	// 글 수정 정보 가져오기
	@RequestMapping("/updateBoard.do")
	public void getBoardToUpdate(Board_detail_VO vo, Model model) {
		model.addAttribute("update", board_detail_Service.getBoard(vo.getPost_no()));
	}

	
	// 공지 글 수정 정보 가져오기
	@RequestMapping("/updateAdminBoard.do")
	public void getAdminBoardToUpdate(Board_detail_VO vo, Model model) {
		model.addAttribute("update", board_detail_Service.getAdminBoard(vo.getPost_no()));
	}

	// 관리자 글 수정
	@RequestMapping("/adminPostUpdate.do")
	public String updateAdminBoard(Board_detail_VO vo) {
		board_detail_Service.updateAdminPost(vo);
		return "redirect:/board_view/viewAdminBoard.do?post_no="+vo.getPost_no();
		
	}

	// 글 수정
	@RequestMapping("/postUpdate.do")
	public String updateBoard(Board_detail_VO vo) {
		board_detail_Service.updatePost(vo);
		return "redirect:/board_view/viewBoard.do?post_no="+vo.getPost_no();
		
	}
	
	// 관리자글 삭제
	@RequestMapping("/adminPostDelete.do")
	public void deleteAdminBoard(int post_no) {
		board_detail_Service.deleteAdminPost(post_no);
	}
	
	// 글 삭제
	@RequestMapping("/postDelete.do")
	public void deleteBoard(int post_no) {
		board_detail_Service.deletePost(post_no);
	}
}
