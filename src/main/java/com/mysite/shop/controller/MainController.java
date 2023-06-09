package com.mysite.shop.controller;

import java.util.ArrayList;
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

		//카테고리별로 구분해서 리스트에담기
		List<GoodsBean> JaList = new ArrayList<GoodsBean>();
		List<GoodsBean> ClothingList = new ArrayList<GoodsBean>();
		List<GoodsBean> ArtList = new ArrayList<GoodsBean>();
		List<GoodsBean> OtherList = new ArrayList<GoodsBean>();
		List<GoodsBean> goodsList = shopService.goodsListService(page);
		
		for (GoodsBean goodsBean : goodsList) {
			if(goodsBean.getGoods_category().contains("Jewelry&Accessories")) {
				JaList.add(goodsBean);
			} else if(goodsBean.getGoods_category().contains("Clothing")) {
				ClothingList.add(goodsBean);			
			} else if(goodsBean.getGoods_category().contains("Art&Collection")) {
				ArtList.add(goodsBean);			
			} else if(goodsBean.getGoods_category().contains("Other")) {
				OtherList.add(goodsBean);			
			}
		}

		model.addAttribute("JaList", JaList);
		model.addAttribute("ClothingList", ClothingList);
		model.addAttribute("ArtList", ArtList);
		model.addAttribute("OtherList", OtherList);
		
		PageBean pageBean = shopService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		return "main";
	}
}
