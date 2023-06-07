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
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	
	//세션에 저장된 로그인 객체를 가져오기
	@Resource(name = "loginUserBean")
	private LoginUserBean loginUserBean;
	
	public CartBean checkCart(int user_idx) {
		return cartMapper.selectCartInfo(user_idx);
	}

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
		cartMapper.addCart(cartBean);
	}
	
	//장바구니목록에서 하나삭제
	public void deleteCart(int cart_idx) {
		cartMapper.deleteCart(cart_idx);
	}
}
