package com.culture.user.board.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class CultureBoardVO extends CommonVO{
	private int ctBoNum;
	private String ctBoTitle = "";
	private String ctBoContent = "";
	private String ctBoWriteDate;
	private int ctBoHidden = 0;
	private int ctBoReadcnt = 0;
	private int userNo;
	private String userName;
	private int ctBoReplycnt;
	
	public int getCt_bo_num() {
	    return ctBoNum;
	}
}
