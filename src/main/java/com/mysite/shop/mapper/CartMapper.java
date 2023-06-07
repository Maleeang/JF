package com.mysite.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.mysite.shop.beans.CartBean;
import com.mysite.shop.beans.GoodsBean;

@Mapper
public interface CartMapper {
	
	//상품등록
	@Insert("insert into cart (cart_idx, goods_quantity, goods_idx, user_idx) " +
			"values (cart_seq.nextval, #{goods_quantity}, #{goods_idx}, #{user_idx})")
	void addCart(CartBean cartBean);
	
	@Select("select * " +
			"from shop_table " +
			"where user_idx = #{user_idx}")
	CartBean selectCartInfo(int user_idx);
	
	//전체 상품가져오기
	@Select("select * " + 
			"from goods " + 
			"order by goods_idx desc")
	List<GoodsBean> getContentList(RowBounds rowBounds);
	
	@Select("select * " + 
			"from cart C join goods G on C.goods_idx = G.goods_idx " +
			"where C.user_idx = #{user_idx} " +
			"order by cart_idx desc")
	List<CartBean> getmyCartList(int user_idx);
	
	@Select("select count(*) from goods")
	int getContentCnt();
	
	//상품하나의 정보 가져오기
	@Select("select * " +
			"from goods " +
			"where goods_idx = #{goods_idx}")
	GoodsBean getOneGoods(int goods_idx);
	
	//상품수정
	@Update("update goods " +
			"set goods_name = #{goods_name}, goods_picture = #{goods_picture}, " +
			"goods_category = #{goods_category}, goods_price = #{goods_price}, goods_des = #{goods_des}, user_idx = #{user_idx} " +
			"where goods_idx = #{goods_idx}")
	void modifyGoods(GoodsBean goodsBean);
	
	//장바구니정보삭제
	@Delete("delete from cart where user_idx=#{user_idx}")
	void deleteCartInfo(int user_idx);
	
	//장바구니목록에서 하나삭제
	@Delete("delete from cart where cart_idx=#{cart_idx}")
	void deleteCart(int cart_idx);
}
