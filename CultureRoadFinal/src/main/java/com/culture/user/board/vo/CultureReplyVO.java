package com.culture.user.board.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CultureReplyVO extends CommonVO{
	private int ctReNum;
	private String ctReContent;
	private String ctReWriteDate;
	private int ctReHidden = 0;
	private int userNo;
	private int ctBoNum;
	private String userName;
	
}
