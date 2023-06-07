package com.mysite.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.UserBean;
import com.mysite.shop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;
	
	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean user) {
		return "user/join";
	}
	
	@PostMapping("/join_pro")
	public String join_pro(@Valid @ModelAttribute("joinUserBean") UserBean joinUserBean, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "user/join";
		}
		if(!joinUserBean.getUser_pw().equals(joinUserBean.getUser_pw2())) {
			model.addAttribute("msg", "비밀번호가 같지 않습니다!");
			return "user/join";
		}
		//유효성 및 비번검사 후에 DB에 새유저를 저장
		userService.addUserInfo(joinUserBean);
		return "user/join_success";
	}

	

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		loginUserBean.setUserLogin(false);
		session.invalidate();
		return "user/logout";
	}
	
	@GetMapping("/login")
	public String login(@ModelAttribute("loginBean") LoginUserBean user, @RequestParam(value="fail", defaultValue="false") boolean fail) {
		
		return "user/login";
	}
	
	@PostMapping("/login_pro")
	public String login_pro(@Valid @ModelAttribute("loginBean") LoginUserBean loginBean, BindingResult result, HttpSession session) {
		
		if(result.hasErrors()) {
			return "user/login";
		}
		//입력된 id pw가 DB에 있는지 확인한다.
		userService.getLoginUserInfo(loginBean);
		session.setAttribute("loginUserBean", loginUserBean);
		if(loginUserBean.isUserLogin()== true) {
			return "user/login_success";
		} else {
			return "user/login_fail";
		}
	}
	
	@GetMapping("/not_login")
	public String not_login() {
		return "user/not_login";
	}
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean) {
		//현재 로그인중인 loginUserBean에서 아이디와 이름값을 얻어 modifyUserBean에 넣음
		userService.getModifyUserInfo(modifyUserBean);
		return "user/modify";
	}
	
	@PostMapping("/modify_pro")
	public String modify_pro(@Valid @ModelAttribute("modifyUserBean") UserBean modifyUserBean, BindingResult result, Model model) {
		if(result.hasErrors()) {
			return "user/modify";
		}
		if(!modifyUserBean.getUser_pw().equals(modifyUserBean.getUser_pw2())) {
			model.addAttribute("msg", "비밀번호가 같지 않습니다!");
			return "user/modify";
		}
		
		//DB에 수정된 비밀번호 저장하기
		userService.modifyUserInfo(modifyUserBean);
		return "user/modify_success";
	}
}
