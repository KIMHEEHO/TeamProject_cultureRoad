package com.culture.user.board.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class MovieReplyVO extends CommonVO{
	private int mv_re_num;
	private String mv_re_content = "";
	private String mv_re_write_date;
	private int mv_re_hidden = 0;
	private int user_no;
	private int mv_bo_num;
	private String user_name;
}
