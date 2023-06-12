package com.mysite.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.shop.beans.GoodsBean;
import com.mysite.shop.mapper.SearchMapper;

@Service
public class SearchService {
	
	@Autowired
	private SearchMapper searchMapper;	
	
	public List<GoodsBean> getResult(String question) {
		List<GoodsBean> resultGoods = searchMapper.getResult(question);
		return resultGoods;
	}
	
	public List<GoodsBean> getCategory(String category) {
		List<GoodsBean> categoryGoods = searchMapper.getCategory(category);
		return categoryGoods;
	}

}
