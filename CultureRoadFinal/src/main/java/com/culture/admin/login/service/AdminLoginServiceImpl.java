package com.culture.admin.login.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.admin.login.dao.AdminLoginDAO;
import com.culture.admin.login.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {

	@Setter(onMethod_ = @Autowired)
	private AdminLoginDAO adminLoginDAO;

	@Override
	public AdminLoginVO adminLogin(AdminLoginVO alvo) {
		return adminLoginDAO.adminLogin(alvo);
	}

	@Override
	public int userCount() {
		int result = adminLoginDAO.userCount();
		return result;
	}

	@Override
	public int replyCount() {
		int result = adminLoginDAO.replyCount();
		return result;
	}

	@Override
	public int commentCount() {
		int result = adminLoginDAO.commentCount();
		return result;
	}

	@Override
	public int boardCount() {
		int result = adminLoginDAO.boardCount();
		return result;
	}
	


}
