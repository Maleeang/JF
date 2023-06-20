package com.mysite.shop.beans;

public class CartBean {

	private int cart_idx;
	
	private int goods_quantity;
	
	private String goods_name;
	
	private String goods_picture;

	private int goods_price;
	
	private int goods_idx;
	
	private int user_idx;

	private int total_price = goods_quantity*goods_price;

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_picture() {
		return goods_picture;
	}

	public void setGoods_picture(String godds_picture) {
		this.goods_picture = godds_picture;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getGoods_quantity() {
		return goods_quantity;
	}

	public void setGoods_quantity(int goods_quantity) {
		this.goods_quantity = goods_quantity;
	}

	public int getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(int goods_price) {
		this.goods_price = goods_price;
	}

	public int getGoods_idx() {
		return goods_idx;
	}

	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


}
