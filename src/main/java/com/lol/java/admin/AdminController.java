package com.lol.java.admin;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

// 관리자 페이지
@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/admin_page.do")
	public String member_info(Paging_VO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session) {
		
		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		}
		else {
			System.out.println("컨트롤 접속");
			/* 회원 총 인원 카운트*/
			int total = adminService.member_count();
			
			// 리스트에 개수 보여주는 기능
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			System.out.println("토탈 계산 끝 : " + total);
			vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println("이게뭐냐" + Integer.parseInt(nowPage) +"/"+ Integer.parseInt(cntPerPage));
			
			model.addAttribute("paging", vo);
			model.addAttribute("list", adminService.user_list(vo));
			
		}
		return "/admin/admin_page";
	}
	
	@RequestMapping("/achievement_grant.do")
	public String achievement_grant(HttpSession session) {
		
		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		}
		
		return "/admin/achievement_grant";
	}
	@ResponseBody
	@RequestMapping("/grant.do")
	public String grant(AdminVO vo) {
		
		vo.setUser_no(adminService.conversion(vo.getUser_id()));
		System.out.println(adminService.overlap_check(vo));
		if(adminService.overlap_check(vo) > 0) {
			System.out.println("false");
			return "1";
		}else {
			adminService.grant(vo);
			System.out.println("true");
			return "0";
		}
		
		
	}
	
	@RequestMapping("/report_history.do")
	public String report(Paging_VO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage
			, HttpSession session) {
		
		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		}
		else {
			System.out.println("컨트롤 접속");
			/* 신고 총 카운트*/
			int total = adminService.report_count();
			
			// 리스트에 개수 보여주는 기능
			if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "5";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "5";
			}
			System.out.println("토탈 계산 끝 : " + total);
			vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("paging", vo);
			model.addAttribute("list", adminService.report_list(vo));
			System.out.println(adminService.report_list(vo));
		}
		 return "/admin/report_history";
	}
	
	@RequestMapping("/accepted.do")
	public void accepted(AdminVO vo) {

		adminService.accepted(vo);
	}
}

