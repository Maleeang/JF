package com.mysite.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.mysite.shop.beans.GoodsBean;

@Mapper
public interface SearchMapper {
	
	@Select("select * " + 
			"from goods where goods_name like '%' ||#{question}|| '%' " + 
			"order by goods_idx desc")
	List<GoodsBean> getResult(String question);
	
	@Select("select * " + 
			"from goods where goods_category like '%' ||#{category}|| '%' " + 
			"order by goods_idx desc")
	List<GoodsBean> getCategory(String category);
}
