package com.mysite.shop.beans;

public class ReviewBean {

	private int review_idx;

	private String review_score; //리뷰별점

	private String review_content; //리뷰내용
	
	private int goods_idx;
	
	private int user_idx;
	
	private String user_name;
	
	private String review_date;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
	}

	public String getReview_score() {
		return review_score;
	}

	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
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

	public String getDate() {
		return review_date;
	}

	public void setDate(String review_date) {
		this.review_date = review_date;
	}
}
