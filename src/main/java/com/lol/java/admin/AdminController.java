package com.lol.java.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
				cntPerPage = "3";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "3";
			}
			System.out.println("토탈 계산 끝 : " + total);
			vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("paging", vo);
			model.addAttribute("list", adminService.user_list());
			System.out.println(adminService.user_list());
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
	
	@RequestMapping("/grant.do")
	public String grant(AdminVO vo) {
		
		vo.setUser_no(adminService.conversion(vo.getUser_id()));
		
		if(adminService.overlap_check(vo) > 0) {
			
			return "/admin/overlap";
			
		}else {
			
			adminService.grant(vo);
			return "/admin/success";
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
				cntPerPage = "3";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) { 
				cntPerPage = "3";
			}
			System.out.println("토탈 계산 끝 : " + total);
			vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			model.addAttribute("paging", vo);
			model.addAttribute("list", adminService.report_list());
			System.out.println(adminService.report_list());
		}
		 return "/admin/report_history";
	}
}

