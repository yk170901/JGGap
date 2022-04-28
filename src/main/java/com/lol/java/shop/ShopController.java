package com.lol.java.shop;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

// 상점페이지
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	ShopVO vo = new ShopVO();
	
	// 페이지 진입시
	@RequestMapping("/shop.do")
	public void shopEnter(Model model, HttpSession session) {
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		model.addAttribute("usablePoints", shopService.getUsablePoints(vo));
		model.addAttribute("items", shopService.getItems());
		model.addAttribute("applied", shopService.getCounts(vo));
		System.out.println("진입완료");
	}
	
	// 응모버튼 클릭시	
	@RequestMapping("/apply.do")
	public @ResponseBody ShopVO shopApply(HttpSession session, ShopVO vo) {
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		System.out.println("apply 컨트롤러");
		shopService.insertApply(vo);
		return vo;				
	}	

}
