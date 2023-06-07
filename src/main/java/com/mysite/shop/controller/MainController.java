package com.mysite.shop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysite.shop.beans.GoodsBean;
import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.PageBean;
import com.mysite.shop.service.ShopService;

@Controller
public class MainController {

	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	ShopService shopService;
	
	@GetMapping("/main")
	public String main(Model model,
			@RequestParam(value="page", defaultValue="1") int page) {

		List<GoodsBean> goodsList = shopService.goodsListService(page);
		model.addAttribute("goodsList", goodsList);
		
		PageBean pageBean = shopService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		return "main";
	}
}
