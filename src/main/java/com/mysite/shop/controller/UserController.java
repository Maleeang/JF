package com.mysite.shop.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import com.mysite.shop.service.EmailServiceImpl;
import com.mysite.shop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private EmailServiceImpl emailService;
	
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
			model.addAttribute("msg", "비밀번호가 같지 않습니다.");
			return "user/join";
		}
		//암호화해서 비밀번호저장
		String encodingPw = encoder.encode(joinUserBean.getUser_pw());
		joinUserBean.setUser_pw(encodingPw);
		//joinUserBean.setUser_pw2(encodingPw);

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
		//입력된 id로 객체를 받아오고 DB에 저장된 암호와 입력된 암호를 비교 후 세션에저장
		LoginUserBean tempUser = userService.getLoginUserInfo(loginBean);
		if(encoder.matches(loginBean.getUser_pw(), tempUser.getUser_pw())){
			//세션 로그인객체에 정보를 입력
			loginUserBean.setUser_idx(tempUser.getUser_idx());
			loginUserBean.setUser_name(tempUser.getUser_name());
			loginUserBean.setUserLogin(true); //로그인 상태 true
		}
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
	public String modify(@ModelAttribute("modifyUserBean") UserBean modifyUserBean, Model model) {
		userService.getModifyUserInfo(modifyUserBean);
		model.addAttribute("user_email", modifyUserBean.getUser_email());
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
		
		//비밀번호 암호화 후 DB 수정하기
		String encodingPw = encoder.encode(modifyUserBean.getUser_pw());
		modifyUserBean.setUser_pw(encodingPw);
		userService.modifyUserInfo(modifyUserBean);
		return "user/modify_success";
	}
	
	@GetMapping("/emailcheck")
	public String emailcheck(@RequestParam(value="fail", defaultValue="false") boolean fail) {
		return "user/emailcheck";
	}
	
	@GetMapping("/emailConfirm")
	public String emailConfirm(@RequestParam String email, Model model) throws Exception {
		
		if(userService.findId(email) != null) {
			String confirm = emailService.sendSimpleMessage(email);
			model.addAttribute("key", confirm);
			model.addAttribute("email", email);
			return "user/codecheck";
		} else {
			return "user/emailcheck_fail";
		}
	}
	
	@GetMapping("/codeConfirm")
	public String codeConfirm(@RequestParam String input, @RequestParam String key, @RequestParam String email, Model model) {
		
		model.addAttribute("email", email);
		if(input.equals(key)) {
			return "user/codeconfirm_success";
		} else {
			return "user/codeconfirm_fail";
		}
	}
	
	@GetMapping("/showid")
	public String showId(@RequestParam String email, Model model) {
		
		String user_id = userService.findId(email);
		model.addAttribute("user_id", user_id);
		model.addAttribute("email", email);

		return "user/showid";
	}
	
	@GetMapping("/changepw")
	public String changePw(@RequestParam String email, @ModelAttribute("changePwUserBean") UserBean changePwUserBean, Model model) {
		
		String user_id = userService.findId(email);
		model.addAttribute("user_id", user_id);
		model.addAttribute("email", email);

		return "user/changepw";
	}
	
	@PostMapping("/changepw_pro")
	public String changePw_pro(@Valid @ModelAttribute("changePwUserBean") UserBean changePwUserBean, BindingResult result, Model model) {

		if(!changePwUserBean.getUser_pw().equals(changePwUserBean.getUser_pw2())) {
			model.addAttribute("msg", "비밀번호가 같지 않습니다!");
			return "user/changepw";
		}
		
		//비밀번호 암호화 후 DB 수정하기
		String encodingPw = encoder.encode(changePwUserBean.getUser_pw());
		changePwUserBean.setUser_pw(encodingPw);
		userService.changePw(changePwUserBean);
		return "user/changepw_success";
	}
}
