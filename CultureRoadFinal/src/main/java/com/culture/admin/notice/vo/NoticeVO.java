package com.culture.admin.notice.vo;

import com.culture.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class NoticeVO extends CommonVO{

	private int noc_num = 0;
	private String noc_title = "";
	private String noc_content = "";
	private int manager_no = 0;
	private String noc_write_date;
	private int readcnt = 0;
	
	
}
