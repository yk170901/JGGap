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
	public void viewBoard(Board_view_VO board_vo, Board_view_VO_reply reply_vo, Model model) {

		int post_no = board_vo.getPost_no();
		
		// 글 & 글쓴이 보여주는 메소드
		model.addAttribute("board",board_view_Service.viewBoard(post_no));

		// 채택 유저 목록 가져오는 메소드
		model.addAttribute("choice", board_view_Service.viewChoiceList(post_no));
		
		// 댓글들 & 댓글쓴이들 보여주는 메소드
		model.addAttribute("reply", board_view_Service.viewReplyList(post_no));
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

	// 댓글 채택
	@ResponseBody
	@RequestMapping("/chooseUser.do")
	public void chooseUser(int writer_no, int chosen_user_no, int post_no, Model model) {
		System.out.println("chooseUser 들어옴"+writer_no+" " + chosen_user_no);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		System.out.println("해쉬맵 만듦");
		
		map.put("writer_no", writer_no);
		System.out.println("writer_no 만듦");
		map.put("chosen_user_no", chosen_user_no);
		System.out.println("chosen_user_no 만듦");
		
		board_view_Service.chooseUser(map);
		System.out.println("post_no = "+post_no);

		/* jsp 파일 내의 chosen-users 갱신을 위해 새로고침/새로 넣기 필요 */
		model.addAttribute("choice", board_view_Service.viewChoiceList(post_no));
	}

	// 댓글 채택 취소
	@ResponseBody
	@RequestMapping("/cancelUser.do")
	public void cancelUser(int writer_no, int chosen_user_no, int post_no, Model model) {
		System.out.println("chooseUser 들어옴"+writer_no+" " + chosen_user_no);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("writer_no", writer_no);
		map.put("chosen_user_no", chosen_user_no);
		
		board_view_Service.cancelUser(map);
		
		
		/* jsp 파일 내의 chosen-users 갱신을 위해 새로고침/새로 넣기 필요 */
		model.addAttribute("choice", board_view_Service.viewChoiceList(post_no));
	}

	// 신고
	@ResponseBody
	@RequestMapping("/submitReport.do")
	public void submitReport(String report_title, String report_content, String report_target, String post_no, HttpSession session) {
		System.out.println("submitReport 들어옴"+(int)session.getAttribute("user_no")+""+report_title+" " + report_content + " " + report_target + " " + post_no);
		
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
		model.addAttribute("reply", board_view_Service.viewReplyList(reply_vo.getPost_no()));
	}
	

}
