package com.mysite.shop.config;

import javax.annotation.Resource;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.interceptor.CheckLoginInterceptor;

//Spring MVC 관련된 설정을 하는 클래스
@Configuration
public class ServletAppContext implements WebMvcConfigurer {
	
	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		WebMvcConfigurer.super.addInterceptors(registry);
		//로그인요청 인터셉터
		CheckLoginInterceptor checkLoginInterceptor = new CheckLoginInterceptor(loginUserBean);
		InterceptorRegistration reg1 = registry.addInterceptor(checkLoginInterceptor);
		
		reg1.addPathPatterns("/user/modify", "/user/logout", "/shop/**", "/cart/**", "/message/**");
		reg1.excludePathPatterns("/shop/myShop", "/shop/goods_detail, /user/emailcheck");
	}
	
	// 정적 파일의 경로를 매핑한다.
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		WebMvcConfigurer.super.addResourceHandlers(registry);
		registry.addResourceHandler("/upload/**")
		.addResourceLocations("file:///C:/SpringBoot/SpringBoot-workspace/Shop/src/main/resources/static/upload/");
	}	
	
}
