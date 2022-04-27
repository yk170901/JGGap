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

	@RequestMapping("/postInsert.do")
	public String insertPost(Board_detail_VO vo, HttpSession session) {

		vo.setUser_no(Integer.parseInt(String.valueOf(session.getAttribute("user_no"))));

		System.out.println(session.getAttribute("user_no"));
		
		board_detail_Service.insertPost(vo);
		
		// 유저 번호를 사용해, 그 유저의 최신 작성글 번호 post_no 가져오기
		int post_no = board_detail_Service.getPost_no(vo.getUser_no());
		
		return "redirect:/board_view/viewBoard.do?post_no="+post_no;
	}
	
	@RequestMapping("/updateBoard.do")
	public void getBoardToUpdate(Board_detail_VO vo, Model model) {

		model.addAttribute("update", board_detail_Service.getBoard(vo.getPost_no()));
	}
	

	@RequestMapping("/postUpdate.do")
	public String updateBoard(Board_detail_VO vo) {

		System.out.println("PostUpdate");
		System.out.println(vo.getPost_no());
		board_detail_Service.updatePost(vo);
		System.out.println(vo.getPost_no());
		
		return "redirect:/board_view/viewBoard.do?post_no="+vo.getPost_no();
		
	}
	
	@RequestMapping("/postDelete.do")
	public String deleteBoard(int post_no, HttpServletResponse response) throws IOException {
		System.out.println(post_no);
		
		board_detail_Service.deletePost(post_no);
		
		/* 게시글이 삭제되었습니다 alert 문
		 * response.setContentType("text/html; charset=UTF-8"); PrintWriter writer =
		 * response.getWriter();
		 * 
		 * writer.println("<script language='javascript'>'+alert('게시글이 삭제되었습니다.')+</script>");
		 * 
		 * writer.flush();
		 */
		
		return "redirect:/board_list/board_list.do";
	}
}
