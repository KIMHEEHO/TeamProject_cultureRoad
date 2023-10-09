package com.culture.common.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CommonVO {
	private int pageNum = 0;	// 페이지 번호
	private int amount = 0;		// 페이지 당 보여줄 데이터 수
	
	// 조건 검색시 사용할 필드
	private String search = "";
	private String keyword = "";

	//날짜 검색시 사용할 필드
	private String start_date = "";
	private String end_date = "";
	
	public CommonVO() {
		this(1,10);
	}
	
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
