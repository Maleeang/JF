package com.mysite.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.mysite.shop.beans.CartBean;
import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.mapper.CartMapper;

@Service
@PropertySource("/static/properties/option.properties")
public class CartService {
	
	@Autowired
	private CartMapper cartMapper;
	
	@Resource(name = "loginUserBean")
	private LoginUserBean loginUserBean;
	
	@Value("${path.upload}")
	private String path_upload;
	
	//내 카트불러오기
	public List<CartBean> myCartListService(int user_idx) {
		return cartMapper.getmyCartList(user_idx);
	}

	//결제 후 장바구니삭제
	public void deleteCartInfo(int user_idx) {
		cartMapper.deleteCartInfo(user_idx);
	}
	
	//장바구니에 아이템추가
	public void addCart(CartBean cartBean) {

		if(cartMapper.isInCart(cartBean.getGoods_idx(), cartBean.getUser_idx()) != null) {
			int quantity = cartMapper.getQuantity(cartBean.getGoods_idx());
			int updateQuantity = quantity + cartBean.getGoods_quantity();
			cartMapper.updateQuantity(updateQuantity, cartBean);
		} else {
			cartMapper.addCart(cartBean);
		}
	}
	
	//장바구니목록에서 하나삭제
	public void deleteCart(int cart_idx) {
		cartMapper.deleteCart(cart_idx);
	}
	
	public void checkPay(int user_idx) {
		cartMapper.checkPay(user_idx);
	}
	
	public CartBean isPay(int user_idx, int goods_idx) {
		CartBean cartBean = cartMapper.isPay(user_idx, goods_idx);
		return cartBean;
	}
}
