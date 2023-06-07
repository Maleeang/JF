package com.mysite.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.mysite.shop.beans.GoodsBean;
import com.mysite.shop.beans.ShopBean;

@Mapper
public interface ShopMapper {
	
	//상점등록
	@Insert("insert into shop_table (shop_idx, shop_name, shop_picture, category, description, user_idx) " +
			"values (shop_seq.nextval, #{shop_name}, #{shop_picture}, #{category}, #{description}, #{user_idx})")
	void addShopInfo(ShopBean shopBean);
	
	@Select("select * " +
			"from shop_table " +
			"where user_idx = #{user_idx}")
	ShopBean selectShopInfo(int user_idx);
	
	//전체 상품가져오기
	@Select("select * " + 
			"from goods " + 
			"order by goods_idx desc")
	List<GoodsBean> getContentList(RowBounds rowBounds);
	
	//상점정보수정
	@Update("update shop_table " +
			"set shop_name = #{shop_name}, shop_picture = #{shop_picture}, " +
			"category = #{category}, description = #{description}, user_idx = #{user_idx} " +
			"where user_idx = #{user_idx}")
	void modifyMyShop(ShopBean shopBean);
	
	@Select("select * " + 
			"from goods " +
			"where user_idx = #{user_idx}" +
			"order by goods_idx desc")
	List<GoodsBean> getmyShopList(int user_idx, RowBounds rowBounds);
	
	@Select("select count(*) from goods")
	int getContentCnt();
	
	//상품등록
	@Insert("insert into goods (goods_idx, goods_name, goods_picture, goods_category, goods_des, goods_price, user_idx) " +
			"values (goods_seq.nextval, #{goods_name}, #{goods_picture}, #{goods_category}, #{goods_des}, #{goods_price}, #{user_idx})")
	void addGoodsInfo(GoodsBean goodsBean);
	
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
	
	@Delete("delete from goods where goods_idx=#{goods_idx}")
	void deleteGoods(int goods_idx);
}
