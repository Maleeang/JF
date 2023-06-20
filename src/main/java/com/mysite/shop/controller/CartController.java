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

@Controller
@RequestMapping("/cart")
public class CartController {

	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	CartService cartService;
	
	//장바구니목록
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

	//결제페이지
	@GetMapping("/pay")
	public String pay(@ModelAttribute("PayBean") PayBean payBean, @RequestParam(value="totalprice") int totalprice, Model model) {
		model.addAttribute("totalprice", totalprice);
		return "cart/pay";
	}
	

	@PostMapping("/pay_pro")
	public String pay_pro(@Valid @ModelAttribute("PayBean") PayBean payBean, BindingResult result, Model model) {

		if(result.hasErrors()) {
			return "cart/pay";
		}
		
		//결제여부 변경
		cartService.checkPay(loginUserBean.getUser_idx());
		return "cart/pay_success";
	}
	
	@PostMapping("/add_cart")
	public String addCart(@ModelAttribute("CartBean") CartBean cartBean, Model model) {
		cartBean.setUser_idx(loginUserBean.getUser_idx());
		cartService.addCart(cartBean);
		model.addAttribute("goods_idx", cartBean.getGoods_idx());
		return "cart/addCart_success";
	}
	
	//장바구니 목록삭제
	@GetMapping("/delete_cart")
	public String deleteCart(@RequestParam(value="cart_idx") int cart_idx) {
		cartService.deleteCart(cart_idx);
		return "cart/delete_cart";
	}
}
