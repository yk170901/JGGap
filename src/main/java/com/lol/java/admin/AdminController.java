package com.lol.java.admin;

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

	/* 회원 정보 페이징 */
	@RequestMapping("/admin_page.do")
	public String member_info(Paging_VO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session) {

		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		} else {

			/* 회원 총 인원 카운트 */
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

			vo = new Paging_VO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

			model.addAttribute("paging", vo);
			model.addAttribute("list", adminService.user_list(vo));

		}
		return "/admin/admin_page";
	}

	/* 회원 정보 페이지 이동 */
	@RequestMapping("/achievement_grant.do")
	public String achievement_grant(HttpSession session) {

		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		}

		return "/admin/achievement_grant";
	}

	/* 업적 부여 */
	@ResponseBody
	@RequestMapping("/grant.do")
	public String grant(AdminVO vo) {

//		가져온 유저 id를 유저 고유번호로 변경 (db에 넣기 위한 작업)
		vo.setUser_no(adminService.conversion(vo.getUser_id()));

//		유저 존재 유무와 업적 보유 유무 확인
		if (adminService.overlap_check(vo) > 0) {

			return "1";
		} else {

			adminService.grant(vo);
			return "0";
		}
	}

	/* 신고 내역 페이징 */
	@RequestMapping("/report_history.do")
	public String report(Paging_VO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpSession session) {

		if (session.getAttribute("user_no") == null) {
			return "redirect:/login.jsp";
		} else {
			System.out.println("컨트롤 접속");
			/* 신고 총 카운트 */
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

	/* 신고 접수 */
	@RequestMapping("/accepted.do")
	public void accepted(AdminVO vo) {

		adminService.accepted(vo);
	}
}
