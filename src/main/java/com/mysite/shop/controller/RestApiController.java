package com.mysite.shop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.mysite.shop.service.UserService;

@RestController
public class RestApiController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/user/check/{user_id}")
	public String checkUserIdExist(@PathVariable String user_id) {
		// 유저 아이디가 없으면 true 있으면 false
		boolean check = userService.checkuserIdExist(user_id);
		// rest컨트롤러는 데이터를 그대로 리턴
		return check + ""; //불린+문자열=>문자열
	}
}
