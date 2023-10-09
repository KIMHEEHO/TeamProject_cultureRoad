package com.culture.admin.login.dao;

import org.apache.ibatis.annotations.Mapper;

import com.culture.admin.login.vo.AdminLoginVO;

@Mapper
public interface AdminLoginDAO {
	public AdminLoginVO adminLogin(AdminLoginVO alvo);
	public int userCount();
	public int replyCount();
	public int commentCount();
	public int boardCount();

}
