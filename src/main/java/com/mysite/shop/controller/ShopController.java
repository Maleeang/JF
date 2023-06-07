package com.mysite.shop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysite.shop.beans.CartBean;
import com.mysite.shop.beans.GoodsBean;
import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.PageBean;
import com.mysite.shop.beans.ShopBean;
import com.mysite.shop.service.ShopService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	ShopService shopService;
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinShopBean") ShopBean shopbean) {
		if(shopService.getMyShop(loginUserBean.getUser_idx()) != null) {
			return "shop/goMyShop";
		}
		return "shop/join";
	}

	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinShopBean") ShopBean shopBean, BindingResult result, Model model) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "shop/join";
		}
		shopService.addShopInfo(shopBean);
		return "shop/join_success";
	}
	
	@GetMapping("/myShop")
	public String myShop(@ModelAttribute("ShopBean") ShopBean shopBean, Model model,
			@RequestParam(value="page", defaultValue="1") int page) {
		shopBean = shopService.selectShopInfo();
		model.addAttribute("ShopBean",shopBean);
		
		List<GoodsBean> goodsList = shopService.myShopListService(loginUserBean.getUser_idx(), page);
		model.addAttribute("goodsList", goodsList);
		
		PageBean pageBean = shopService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		return "shop/myShop";
	}
	
	@GetMapping("/modify_myshop")
	public String modify_myShop(Model model, @ModelAttribute("modifyShopBean") ShopBean shopBean) {
		shopBean = shopService.getMyShop(loginUserBean.getUser_idx());
		model.addAttribute("shopBean", shopBean);
		return "shop/modify_myshop";
	}
	
	@PostMapping("/modify_myshop_pro")
	public String modify_myShop_pro(@Valid @ModelAttribute("modifyShopBean") ShopBean shopBean, BindingResult result, Model model) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "shop/modify_myshop";
		}
		shopService.modifymyShop(shopBean);
		return "shop/modifyshop_success";
	}
	
	@GetMapping("/addGoods")
	public String addGoods(@ModelAttribute("addGoodsBean") GoodsBean goodsBean) {
		return "shop/addGoods";
	}
	
	@PostMapping("/addGoods_pro")
	public String addGoods_pro(@Valid @ModelAttribute("addGoodsBean") GoodsBean goodsBean, BindingResult result, Model model) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "shop/addGoods";
		}
		shopService.addGoodsInfo(goodsBean);
		return "shop/addGoods_success";
	}
	
	@GetMapping("/goods_detail")
	public String goods_detail(Model model, @RequestParam(value="goods_idx") int goods_idx, @ModelAttribute("CartBean") CartBean cartBean) {
		GoodsBean goodsBean = shopService.getOneGoods(goods_idx);
		model.addAttribute("goodsBean", goodsBean);
		return "shop/goods_detail";
	}
	
	@GetMapping("/modify_goods")
	public String modify_goods(@RequestParam(value="goods_idx") int goods_idx, Model model, @ModelAttribute("modifyGoodsBean") GoodsBean goodsBean) {
		goodsBean = shopService.getOneGoods(goods_idx);
		model.addAttribute("goodsBean", goodsBean);
		return "shop/modify_goods";
	}
	
	@PostMapping("/modifyGoods_pro")
	public String modifyGoods_pro(@Valid @ModelAttribute("modifyGoodsBean") GoodsBean goodsBean, BindingResult result, Model model,
			@RequestParam(value="goods_idx") int goods_idx) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "shop/modify_goods";
		}
		goodsBean.setGoods_idx(goods_idx);
		shopService.modifyGoods(goodsBean);
		return "shop/modifyGoods_success";
	}
	
	@GetMapping("/delete_goods")
	public String deleteGoods(@RequestParam(value="goods_idx") int goods_idx) {
		shopService.deleteGoods(goods_idx);
		return "shop/delete_goods";
	}
}
