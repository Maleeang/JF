package com.mysite.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.mysite.shop.beans.MessageBean;

@Mapper
public interface MessageMapper {
	
	//받은 메세지 불러오기
	@Select("select * " + 
			"from messages " + 
			"where receiver_idx = #{user_idx}" +
			"order by msg_idx desc")
	List<MessageBean> getMessageList(int user_idx);
	
	//보낸 메세지 불러오기
	@Select("select * " + 
			"from messages " + 
			"where user_idx = #{user_idx}" +
			"order by msg_idx desc")
	List<MessageBean> getSendList(int user_idx);
	
	//보낸 메세지 저장
	@Insert("insert into messages (msg_idx, msg_title, msg_content, user_idx, receiver_idx, message_date, user_name) " +
			"values (message_seq.nextval, #{msg_title}, #{msg_content}, #{user_idx}, #{receiver_idx}, sysdate, #{user_name})")
	void addMessage(MessageBean msgBean);
	
	//메세지삭제
	@Delete("delete from messages where msg_idx=#{msg_idx}")
	void deleteMessage(int msg_idx);
}
