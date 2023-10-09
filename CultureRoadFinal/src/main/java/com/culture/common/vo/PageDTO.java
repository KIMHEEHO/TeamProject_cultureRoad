package com.culture.common.vo;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int initpage = 1;
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private CommonVO cvo;
	
	public PageDTO(CommonVO cvo, int total) { //CommonVO cvo = new NoticeVO() 주소값 대입
		this.cvo = cvo;
		this.total = total;
		
		/* 페이징의 끝번호(endPage) 구하기
		   this.endPage = (int)(Math.ceil(페이지번호/10.0)) *10;  */
		this.endPage = (int)(Math.ceil(cvo.getPageNum() / 10.0)) * 10;
		
		/* 페이징의 시작번호 구하기 10페이지씩 보여주려면 endPage 에서 9를 빼주면 됨*/
		this.startPage = this.endPage - 9;
		
		/* 끝페이지 구하기 */
		int realEnd = (int)(Math.ceil((total * 1.0) / cvo.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		/* 이전(prev) 구하기[이전10개] - 이전의 경우는 시작번호가 1보다 큰경우라면 존재하게 된다 */
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
