package com.mysite.shop.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.web.multipart.MultipartFile;

public class GoodsBean {

	private int goods_idx;
	@NotBlank
	private String goods_name;
	
	private String goods_picture; //파일이름

	private MultipartFile goods_file;
	
	private String goods_category;
	
	private String goods_des; //상품설명
	
	@NumberFormat
	private int goods_price;
	
	private int user_idx;

	public int getGoods_idx() {
		return goods_idx;
	}

	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_picture() {
		return goods_picture;
	}

	public void setGoods_picture(String goods_picture) {
		this.goods_picture = goods_picture;
	}

	public MultipartFile getGoods_file() {
		return goods_file;
	}

	public void setGoods_file(MultipartFile goods_file) {
		this.goods_file = goods_file;
	}

	public String getGoods_category() {
		return goods_category;
	}

	public void setGoods_category(String goods_category) {
		this.goods_category = goods_category;
	}

	public String getGoods_des() {
		return goods_des;
	}

	public void setGoods_des(String goods_des) {
		this.goods_des = goods_des;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	
	
}
