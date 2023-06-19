package com.mysite.shop.controller;

import java.util.List;

import javax.annotation.Resource;
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
import com.mysite.shop.beans.MessageBean;
import com.mysite.shop.beans.ShopBean;
import com.mysite.shop.service.MessageService;
import com.mysite.shop.service.ShopService;
import com.mysite.shop.service.UserService;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Resource(name="loginUserBean")
	private LoginUserBean loginUserBean;

	@Autowired
	MessageService msgService;
	
	@Autowired
	ShopService shopService;
	
	@Autowired
	UserService userService;
	
	//메세지함
	@GetMapping("/messagelist")
	public String messageList(@ModelAttribute("MessageBean") MessageBean msgBean, Model model) {

		List<MessageBean> msgList = msgService.getMessageService(loginUserBean.getUser_idx());
		List<MessageBean> sentList = msgService.getSendService(loginUserBean.getUser_idx());
		ShopBean shopBean = shopService.getMyShop(loginUserBean.getUser_idx());
		model.addAttribute("ShopBean",shopBean);
		model.addAttribute("msgList", msgList);
		model.addAttribute("sentList", sentList);
		model.addAttribute("loginUser", loginUserBean.getUser_idx());
		
		return "message/messagebox";
	}

	//메세지 보내기
	@GetMapping("/send")
	public String send(@ModelAttribute("msgBean") MessageBean msgBean, Model model,
			@RequestParam(value="receiver_idx") int receiver_idx) {
		model.addAttribute("receiver_idx", receiver_idx);
		model.addAttribute("user_idx", loginUserBean.getUser_idx());
		//받는사람 이름 찾기
		String receiver_name = userService.getUserName(receiver_idx);
		model.addAttribute("receiver_name", receiver_name);
		return "message/send";
	}

	@PostMapping("/send_pro")
	public String send_pro(@Valid @ModelAttribute("msgBean") MessageBean msgBean, Model model, BindingResult result) {
		//유효성검사 후에 DB에 상점정보를 저장
		if(result.hasErrors()) {
			return "message/send";
		}
		msgBean.setUser_name(userService.getUserName(loginUserBean.getUser_idx()));
		msgService.sendMessage(msgBean);
		model.addAttribute("user_idx", msgBean.getReceiver_idx());
		return "message/send_success";
	}
	
	@GetMapping("/delete")
	public String deleteMessage(@RequestParam(value="message_idx") int msg_idx) {
		msgService.deleteMessage(msg_idx);
		return "message/delete_message";
	}

}
