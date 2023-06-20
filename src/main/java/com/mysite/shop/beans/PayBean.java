package com.mysite.shop.beans;

public class PayBean {

	private String name;

	private String address;
	
	private String detail_address;
	
	private String phone;
	
	private int pay;
	
	private int goods_idx;
	
	private int cart_idx;
	
	private int user_idx;

	
	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public int getGoods_idx() {
		return goods_idx;
	}

	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetail_address() {
		return detail_address;
	}

	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

}
