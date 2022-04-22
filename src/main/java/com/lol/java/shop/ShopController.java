package com.lol.java.shop;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

// 상점페이지
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	
	// 사용가능 포인트 가져오기
	@RequestMapping("/shop.do")
	public void shopenter(Model model, HttpSession session){
		int user_no = (int) session.getAttribute("user_no");
		ShopVO vo = new ShopVO();
		vo.setUser_no(user_no);
		model.addAttribute("", shopService.getUsablePoints(vo));
		
	}

}
