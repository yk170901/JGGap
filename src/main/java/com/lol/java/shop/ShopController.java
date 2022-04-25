package com.lol.java.shop;

import java.util.List;

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
	ShopVO vo = new ShopVO();
	
	// 페이지 진입시
	@RequestMapping("/shop.do")
	public void shopEnter(Model model, HttpSession session){
		int user_no = (int) session.getAttribute("user_no");
		vo.setUser_no(user_no);
		List<ShopVO> items = shopService.getItems();
		int[] applied = shopService.getCounts();
		int i = 0;
		for (ShopVO vo : items) {
			vo.setItem_applied(applied[i]);
			i++;
		}
		
		model.addAttribute("usablePoints", shopService.getUsablePoints(vo));
		model.addAttribute("items", items);
	}
	
	// 응모버튼 클릭시
	@RequestMapping("/apply.do")
	public String shopApply(ShopVO vo) {
		shopService.insertApply(vo);
		int itemPer = vo.getItem_per();
		
		return "redirect:/shop/shop.do";
	}
	

}
