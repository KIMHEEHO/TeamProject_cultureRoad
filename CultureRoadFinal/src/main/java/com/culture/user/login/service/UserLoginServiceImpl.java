package com.culture.user.login.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.login.dao.UserLoginDAO;
import com.culture.user.login.vo.UserLoginVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserLoginServiceImpl implements UserLoginService {

	@Setter(onMethod_ = @Autowired)
	private UserLoginDAO userDAO;

	
	public UserLoginVO userLogin(UserLoginVO uvo) {

		UserLoginVO userVO = userDAO.userLogin(uvo);
		log.info("login결과" + uvo);
		return userVO;
	}

	public int signUp(UserLoginVO uvo) {
	
		return userDAO.signUp(uvo);
	}

	
	public int idChk(UserLoginVO uvo) {
		return userDAO.idChk(uvo);
	}

	
	public int updateMyPage(UserLoginVO uvo) {
		return userDAO.updateMyPage(uvo);
	}

	
	public int pwChk(UserLoginVO uvo) {
		int result = 0;
		result = userDAO.pwChk(uvo);
		return result;
	}

	
	public UserLoginVO myPage(UserLoginVO uvo) {
		UserLoginVO user = userDAO.myPage(uvo);
		return user;
	}

	
	public int deleteAccount(UserLoginVO uvo) {
		int result = userDAO.deleteAccount(uvo);
		return result;
	}

	
	public int personalInfoEmail(UserLoginVO uvo) {
		int result = userDAO.personalInfoEmail(uvo);
		return result;
	}

	
	public UserLoginVO findId(UserLoginVO uvo) {
		UserLoginVO user = userDAO.findId(uvo);
		return user;
	}

	
	public int personalPwInfoEmail(UserLoginVO uvo) {
		int result = userDAO.personalPwInfoEmail(uvo);
		return result;
	}

	
	public int updatePw(UserLoginVO uvo) {
		int result = userDAO.updatePw(uvo);
		return result;
	}

	
	public int personalInfoPhone(UserLoginVO uvo) {
		int result = userDAO.personalInfoPhone(uvo);
		return result;
	}

	
	public UserLoginVO findIdPhone(UserLoginVO uvo) {
		UserLoginVO user = userDAO.findIdPhone(uvo);
		return user;
	}

	
	public int personalPwInfoPhone(UserLoginVO uvo) {
		int result = userDAO.personalPwInfoPhone(uvo);
		return result;
	}

	@Override
	public UserLoginVO myOrderList(UserLoginVO uvo) {
		 UserLoginVO userLogin = userDAO.myOrderList(uvo);
		 return userLogin;
	}

	@Override
	public List<UserLoginVO> userList(UserLoginVO uvo) {
		List<UserLoginVO> userList = userDAO.userList(uvo);
		return userList;
	}

	@Override
	public int userCnt(UserLoginVO uvo) {
		int userCnt = userDAO.userCnt(uvo);
		return userCnt;
	}

	@Override
	public int  userStatusUpdate(UserLoginVO uvo) {
		int result = userDAO.userStatusUpdate(uvo);
		return result;
	}

	

}
