package com.culture.user.board.vo;


import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieBoardVO extends CommonVO{
	private int mv_bo_num = 0;
	private String mv_bo_title = "";
	private String mv_bo_content = "";
	private String mv_bo_write_date;
	private int mv_bo_hidden = 0;
	private int mv_bo_readcnt = 0;
	private int user_no;
	private String user_name;
	private int mv_bo_replycnt;
}
