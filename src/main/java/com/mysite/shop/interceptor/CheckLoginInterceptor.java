package com.mysite.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mysite.shop.beans.LoginUserBean;

public class CheckLoginInterceptor implements HandlerInterceptor{

	private LoginUserBean loginUserBean;
	
	public CheckLoginInterceptor(LoginUserBean loginUserBean) {
		this.loginUserBean = loginUserBean;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		if(loginUserBean.isUserLogin() == false) {
			String contexPath = request.getContextPath();
			response.sendRedirect(contexPath + "/user/not_login");
			return false;
		}
		return true;
	}
}
