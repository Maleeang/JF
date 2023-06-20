package com.mysite.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mysite.shop.beans.CartBean;

@Mapper
public interface CartMapper {
	
	//장바구니 등록
	@Insert("insert into cart (cart_idx, goods_quantity, goods_idx, user_idx, pay) " +
			"values (cart_seq.nextval, #{goods_quantity}, #{goods_idx}, #{user_idx}, 0)")
	void addCart(CartBean cartBean);
	
	//장바구니 리스트 가져오기
	@Select("select * " + 
			"from cart C join goods G on C.goods_idx = G.goods_idx " +
			"where C.user_idx = #{user_idx} and C.pay = 0 " +
			"order by cart_idx desc")
	List<CartBean> getmyCartList(int user_idx);
	
	//장바구니에 상품이 이미 들어있는지 확인
	@Select("select * " +
			"from cart " +
			"where goods_idx = #{goods_idx} and user_idx = #{user_idx}")
	CartBean isInCart(int goods_idx, int user_idx);
	
	//수량가져오기
	@Select("select goods_quantity " +
			"from cart " +
			"where goods_idx = #{goods_idx}")
	int getQuantity(int goods_idx);
	
	//상품이 이미있다면 수량만 추가
	@Update("update cart " +
			"set goods_quantity = #{updateQuantity} " +
			"where goods_idx = #{cartBean.goods_idx}")
	void updateQuantity( int updateQuantity, CartBean cartBean);

	//장바구니정보삭제
	@Delete("delete from cart where user_idx=#{user_idx}")
	void deleteCartInfo(int user_idx);
	
	//장바구니목록에서 하나삭제
	@Delete("delete from cart where cart_idx=#{cart_idx}")
	void deleteCart(int cart_idx);
	
	//결제여부수정
	@Update("update cart " +
			"set pay = 1 " +
			"where user_idx = #{user_idx}")
	void checkPay(int user_idx);
	
	//결제여부확인
	@Select("select * " + 
			"from cart " +
			"where user_idx = #{user_idx} and goods_idx = #{goods_idx} and pay = 1 " +
			"order by cart_idx desc")
	CartBean isPay(int user_idx, int goods_idx);
}
