package com.culture.admin.notice.service;

import java.util.List;

import com.culture.admin.notice.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeCnt(NoticeVO nvo);
	public void readCntUpdate(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public void noticeDelete(NoticeVO nvo);
	public void noticeInsert(NoticeVO nvo);
	public void noticeUpdate(NoticeVO nvo);
	

}
