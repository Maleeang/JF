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
import com.mysite.shop.beans.ReviewBean;
import com.mysite.shop.beans.ShopBean;
import com.mysite.shop.service.ShopService;
import com.mysite.shop.service.UserService;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	ShopService shopService;
	
	@Autowired
	UserService userService;
	
	//상점이 없으면 상점만들기, 있으면 내 상점으로 이동
	@GetMapping("/join")
	public String join(@ModelAttribute("joinShopBean") ShopBean shopbean, Model model) {
		if(shopService.getMyShop(loginUserBean.getUser_idx()) != null) {
			model.addAttribute("user_idx", loginUserBean.getUser_idx());
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
			@RequestParam(value="user_idx") int user_idx) {
		shopBean = shopService.selectShopInfo(user_idx);
		model.addAttribute("ShopBean",shopBean);
		
		List<GoodsBean> goodsList = shopService.myShopListService(user_idx);
		model.addAttribute("goodsList", goodsList);
		
		model.addAttribute("loginUser", loginUserBean.getUser_idx());
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
		model.addAttribute("goodsBean", goodsBean);
		return "shop/addGoods_success";
	}
	
	@GetMapping("/goods_detail")
	public String goods_detail(Model model, @RequestParam(value="goods_idx") int goods_idx, @ModelAttribute("CartBean") CartBean cartBean, @ModelAttribute("ReviewBean") ReviewBean reviewBean) {
		GoodsBean goodsBean = shopService.getOneGoods(goods_idx);
		model.addAttribute("goodsBean", goodsBean);
		
		//리뷰 리스트
		List<ReviewBean> reviewList = shopService.reviewListService(goods_idx);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("loginUserBean", loginUserBean);
		
		//판매자 상점
		ShopBean shopBean = shopService.getMyShop(goodsBean.getUser_idx());
		model.addAttribute("shopBean", shopBean);
		if(loginUserBean.getUser_idx() == goodsBean.getUser_idx()) {
			return "shop/myGoods_detail";
		} else {
			return "shop/goods_detail";
		}
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
	
	@PostMapping("/write_review")
	public String write_review(@Valid @ModelAttribute("ReviewBean") ReviewBean reviewBean, BindingResult result,Model model) {
		reviewBean.setUser_idx(loginUserBean.getUser_idx());
		reviewBean.setUser_name(userService.getUserName(loginUserBean.getUser_idx()));
		shopService.addReview(reviewBean);
		model.addAttribute("reviewBean", reviewBean);
		return "shop/review_success";
	}
	
	@GetMapping("/delete_review")
	public String deleteReview(@RequestParam(value="review_idx") int review_idx, @RequestParam(value="goods_idx") int goods_idx, Model model) {
		shopService.deleteReview(review_idx);
		model.addAttribute("goods_idx", goods_idx);
		return "shop/delete_review";
	}
}
