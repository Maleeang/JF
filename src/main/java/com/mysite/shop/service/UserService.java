package com.mysite.shop.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.UserBean;
import com.mysite.shop.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;	
	
	//세션에 저장된 로그인 객체를 가져오기
	@Resource(name = "loginUserBean")
	private LoginUserBean loginUserBean;

	//아이디 중복확인
	public boolean checkuserIdExist(String user_id) {
		
		String user_name = userMapper.checkUserIdExist(user_id);
		
		if(user_name == null) {
			return true;
		} else {
			return false;
		}
	}
	
	//이메일로 아이디찾기
	public String findId(String user_email) {
		
		String user_id = userMapper.findId(user_email);
		return user_id;
	}
	
	public void addUserInfo(UserBean joinUserBean) {
		userMapper.addUserInfo(joinUserBean);
	}
	
	public LoginUserBean getLoginUserInfo(LoginUserBean loginBean) {
		//DB에서 id pw로 검색하여 유저정보 조회
		LoginUserBean tempLoginBean = userMapper.getLoginUserInfo(loginBean);
		return tempLoginBean;
//		if(tempLoginBean != null) {
//			//세션 로그인객체에 정보를 입력
//			loginUserBean.setUser_idx(tempLoginBean.getUser_idx());
//			loginUserBean.setUser_name(tempLoginBean.getUser_name());
//			loginUserBean.setUserLogin(true); //로그인 상태 true
//		}
	}
	
	public void getModifyUserInfo(UserBean modifyUserBean) {
		UserBean temp = userMapper.getModifyUserInfo(loginUserBean.getUser_idx());
		
		modifyUserBean.setUser_id(temp.getUser_id());
		modifyUserBean.setUser_name(temp.getUser_name());
		modifyUserBean.setUser_email(temp.getUser_email());
		modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
	}

	public void modifyUserInfo(UserBean modifyUserBean) {
		
		modifyUserBean.setUser_idx(loginUserBean.getUser_idx());
		
		userMapper.modifyUserInfo(modifyUserBean);
	}
	
	public void changePw(UserBean changePwUserBean) {
		
		userMapper.changePw(changePwUserBean);
	}
	
	public String getUserName(int user_idx) {
		String user_name = userMapper.getUserName(user_idx);
		return user_name;
	}
}
