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
import com.mysite.shop.service.SearchService;

@Controller
public class SearchController {

	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	SearchService searchService;
	
	@GetMapping("/search")
	public String search(Model model,
			@RequestParam(value="question") String question) {

		List<GoodsBean> resultGoods = searchService.getResult(question);
		model.addAttribute("resultGoods", resultGoods);
		model.addAttribute("question", question);
		return "search/result";
	}
	
	@GetMapping("/search/category")
	public String category(Model model,
			@RequestParam(value="category") String category) {

		System.out.println(category);
		if(category.contains("Jewelry")) {
			category = "Jewelry&Accessories";
		} else if(category.contains("Art")) {
			category = "Art&Collection";
		}
		List<GoodsBean> categoryGoods = searchService.getCategory(category);
		model.addAttribute("resultGoods", categoryGoods);
		model.addAttribute("question", category);
		return "search/categoryResult";
	}
}
