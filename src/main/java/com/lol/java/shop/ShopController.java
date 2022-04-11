package com.lol.java.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 상점페이지
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;

}
