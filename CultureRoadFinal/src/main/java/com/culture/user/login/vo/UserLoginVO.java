package com.culture.user.login.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserLoginVO extends CommonVO{

	private int userNo;
	private String userId;
	private String userPw ="";
	private String userName;
	private String userEmail="";
	private String userPhone="";
	private String userBirth;
	private String userDate;
	private int userDelete;
	private String userStatus;
}
