package com.mysite.shop.beans;

public class MessageBean {

	private int msg_idx;

	private String msg_title;
	
	private String msg_content;
	
	private int user_idx; //보낸사람
	
	private String user_name; //보낸사람 이름
	
	private int receiver_idx; //받는사람

	private String message_date;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getMsg_idx() {
		return msg_idx;
	}

	public void setMsg_idx(int msg_idx) {
		this.msg_idx = msg_idx;
	}

	public String getMsg_title() {
		return msg_title;
	}

	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}

	public String getMsg_content() {
		return msg_content;
	}

	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getReceiver_idx() {
		return receiver_idx;
	}

	public void setReceiver_idx(int receiver_idx) {
		this.receiver_idx = receiver_idx;
	}

	public String getMessage_date() {
		return message_date;
	}

	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}

}
