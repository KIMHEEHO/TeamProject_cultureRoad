package com.culture.user.login.service;

import java.util.List;

import com.culture.user.login.vo.UserLoginVO;

public interface UserLoginService {
	public UserLoginVO userLogin(UserLoginVO uvo);
	public int signUp(UserLoginVO uvo);
	public int idChk(UserLoginVO uvo);
	public int updateMyPage(UserLoginVO uvo);
	public int pwChk(UserLoginVO uvo);
	public UserLoginVO myPage(UserLoginVO uvo);
	public int deleteAccount(UserLoginVO uvo);
	public int personalInfoEmail(UserLoginVO uvo);
	public UserLoginVO findId(UserLoginVO uvo);
	public int personalPwInfoEmail(UserLoginVO uvo);
	public int updatePw(UserLoginVO uvo);
	public int personalInfoPhone(UserLoginVO uvo);
	public UserLoginVO findIdPhone(UserLoginVO uvo);
	public int personalPwInfoPhone(UserLoginVO uvo);
	public UserLoginVO myOrderList(UserLoginVO uvo);
	public List<UserLoginVO> userList(UserLoginVO uvo);
	public int userCnt(UserLoginVO uvo);
	public int userStatusUpdate(UserLoginVO uvo);
}
