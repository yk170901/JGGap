package com.lol.java.board_detail;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		// 치영 세션 업데이트 후 제거
		session.setAttribute("user_no", 10027);
	
		vo.setUser_no(String.valueOf(session.getAttribute("user_no")));
		
		System.out.println(vo);
		
		board_detail_Service.insertPost(vo);
		
		// 포스트 넘버가 안 받아진다. DAOImpl에서 setPost_no 할 Mapper 오가는 코드가 있어야겠다. Mapper에 <select id= getPostNo></select> 매퍼 놓으면 됨
		System.out.println("포스트 넘버 : "+vo.getPost_no());
		/* int post_no = vo.getPost_no(); */
		
//		return "redirect:/viewBoard?post_no="+post_no".do";
		return "redirect:/board_list/board_list.do";
	}
}
