package com.lol.java.board_list;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			,String searchCondition, String searchKeyword, HttpSession session
			,HttpServletRequest request
			,String[] search_check_map
			,String[] search_check_mode) {
		
			if (session.getAttribute("user_no") == null) {
				return "redirect:/login.jsp";
			}
			else {
				/* 게시글 총 갯수 카운트*/
				int total = 0;
				
				if(searchKeyword == null) {
					/* 검색 키워드가 없을때 일반 페이징*/
					total = board_list_Service.countBoard();
				}
				else if(searchKeyword != "" || searchKeyword != null){
					vo = new Paging_VO(search_check_map, search_check_mode, searchCondition, searchKeyword);
					total = board_list_Service.searchCountBoard(vo);
				}
				
				// 리스트에 개수 보여주는 기능
				if (nowPage == null && cntPerPage == null) {
					nowPage = "1";
					cntPerPage = "10";
				} else if (nowPage == null) {
					nowPage = "1";
				} else if (cntPerPage == null) { 
					cntPerPage = "10";
				}
				System.out.println("토탈 계산 끝 : " + total);
				vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchCondition, searchKeyword, search_check_map, search_check_mode);
				if(vo.getSearch_check_map() != null) {
					for(int i=0; i<vo.getSearch_check_map().length; i++) {
						System.out.println(vo.getSearch_check_map()[i]);
					}
				}
				if(vo.getSearch_check_mode() != null) {
					for(int i=0; i<vo.getSearch_check_mode().length; i++) {
						System.out.println(vo.getSearch_check_mode()[i]);
					}
				}
				
				model.addAttribute("admin_list", board_list_Service.admin_boardList());
				model.addAttribute("paging", vo);
				model.addAttribute("list", board_list_Service.selectBoard(vo));
				System.out.println(board_list_Service.selectBoard(vo));
				System.out.println(session.getAttribute("user_no"));
				System.out.println(session.getAttribute("summoner_id"));
				return "/board_list/board_list";
			}
		}
}
