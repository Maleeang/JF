package com.mysite.shop.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.UserBean;

@Mapper
public interface UserMapper {
	
	//중복확인
	@Select("select user_name " +
			"from user_table " +
			"where user_id = #{user_id}")
	String checkUserIdExist(String user_id);
	
	//아이디찾기
	@Select("select user_id " +
			"from user_table " +
			"where user_email = #{user_email}")
	String findId(String user_email);

	//유저등록
	@Insert("insert into user_table (user_idx, user_name, user_id, user_pw, user_email) " +
			"values (user_seq.nextval, #{user_name}, #{user_id}, #{user_pw}, #{user_email})")
	void addUserInfo(UserBean joinUserBean);
	
	//로그인
	@Select("select user_idx, user_name, user_pw " + 
			"from user_table " + 
			"where user_id=#{user_id}")
	LoginUserBean getLoginUserInfo(LoginUserBean loginBean);
	
	@Select("select user_id, user_name, user_email " +
			"from user_table " +
			"where user_idx = #{user_idx}")
	UserBean getModifyUserInfo(int user_idx);
	
	//비밀번호 변경
	@Update("update user_table " +
			"set user_pw = #{user_pw} " +
			"where user_idx = #{user_idx}")
	void modifyUserInfo(UserBean modifyUserBean);
	
	//비밀번호 변경
	@Update("update user_table " +
			"set user_pw = #{user_pw} " +
			"where user_id = #{user_id}")
	void changePw(UserBean changePwUserBean);
	
	//인덱스로 유저이름찾기
	@Select("select user_name " +
			"from user_table " +
			"where user_idx = #{user_idx}")
	String getUserName(int user_idx);
}
