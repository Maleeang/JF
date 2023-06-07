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
import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.PayBean;
import com.mysite.shop.service.CartService;
import com.mysite.shop.service.ShopService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	CartService cartService;
	
	@Autowired
	ShopService shopService;
	
	@GetMapping("/cartlist")
	public String cartList(Model model) {
		int totalprice = 0;
		List<CartBean> cartList = cartService.myCartListService(loginUserBean.getUser_idx());
		model.addAttribute("cartList", cartList);
		for (CartBean cartBean : cartList) {
			cartBean.setTotal_price(cartBean.getGoods_quantity()*cartBean.getGoods_price());
			totalprice = totalprice + cartBean.getTotal_price();
		}
		model.addAttribute("totalprice", totalprice);
		return "cart/cartList";
	}

	@GetMapping("/pay")
	public String pay(@RequestParam(value="totalprice") int totalprice, Model model) {
		model.addAttribute("totalprice", totalprice);
		return "cart/pay";
	}
	

	@PostMapping("/pay_pro")
	public String pay_pro(@Valid @ModelAttribute("PayBean") PayBean payBean, BindingResult result, Model model) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "cart/pay";
		}
		//장바구니비우기
		cartService.deleteCartInfo(loginUserBean.getUser_idx());
		//shopService.addShopInfo(payBean);
		return "cart/pay_success";
	}
	
	@GetMapping("/add_cart")
	public String addCart_main(@RequestParam(value="goods_idx") int goods_idx,Model model) {
		CartBean cartBean = new CartBean();
		cartBean.setUser_idx(loginUserBean.getUser_idx());
		cartBean.setGoods_idx(goods_idx);
		cartBean.setGoods_quantity(1);
		cartService.addCart(cartBean);
		model.addAttribute("goods_idx", cartBean.getGoods_idx());
		return "cart/addCart_success";
	}
	
	@PostMapping("/add_cart")
	public String addCart(@ModelAttribute("CartBean") CartBean cartBean,Model model) {
		cartBean.setUser_idx(loginUserBean.getUser_idx());
		cartService.addCart(cartBean);
		model.addAttribute("goods_idx", cartBean.getGoods_idx());
		return "cart/addCart_success";
	}
	
	@GetMapping("/delete_cart")
	public String deleteCart(@RequestParam(value="cart_idx") int cart_idx) {
		cartService.deleteCart(cart_idx);
		return "cart/delete_cart";
	}
}