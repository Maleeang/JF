package com.mysite.shop.beans;

import javax.validation.constraints.AssertTrue;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserBean {
	private int user_idx;
	@Size(min=2, max=8)
	@Pattern(regexp="[가-힣]*", message="한글로 입력해주세요.")
	private String user_name;
	
	@Size(min=2, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*", message="아이디는 4~20자")
	private String user_id;
	
	@Pattern(regexp="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*", message="이메일형식으로 입력해주세요.")
	private String user_email;
	
	@Size(min=4, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*", message="비밀번호는 4~20자.")
	private String user_pw;
	
	@Size(min=4, max=20)
	@Pattern(regexp="[a-zA-Z0-9]*", message="비밀번호는 4~20자.")
	private String user_pw2;
	
	//참이 아니면 에러처리
	@AssertTrue(message = "아이디 중복체크 해주세요")
	private boolean userIdChecked;
	
	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public UserBean() {
		
		userIdChecked = false; //UserBean이 생성될때는 false
	}
	
	
	public boolean isUserIdChecked() {
		return userIdChecked;
	}



	public void setUserIdChecked(boolean userIdChecked) {
		this.userIdChecked = userIdChecked;
	}



	public String getUser_pw2() {
		return user_pw2;
	}
	public void setUser_pw2(String user_pw2) {
		this.user_pw2 = user_pw2;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
}
