package com.mysite.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.MessageBean;
import com.mysite.shop.mapper.MessageMapper;

@Service
@PropertySource("/static/properties/option.properties")
public class MessageService {
	
	@Autowired
	private MessageMapper msgMapper;	
	
	//세션에 저장된 로그인 객체를 가져오기
	@Resource(name = "loginUserBean")
	private LoginUserBean loginUserBean;

	//받은 메세지 불러오기
	public List<MessageBean> getMessageService(int user_idx) {
		return msgMapper.getMessageList(user_idx);
	}
	
	//보낸 메세지 불러오기
	public List<MessageBean> getSendService(int user_idx) {
		return msgMapper.getSendList(user_idx);
	}
	
	//메세지 쓰기
	public void sendMessage(MessageBean msgBean) {

		msgBean.setUser_idx(loginUserBean.getUser_idx());
		msgMapper.addMessage(msgBean);
	}
	
	public void deleteMessage(int msg_idx) {
		msgMapper.deleteMessage(msg_idx);
	}
	
}
