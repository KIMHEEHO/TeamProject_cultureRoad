package com.culture.admin.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.culture.admin.notice.vo.NoticeVO;


@Mapper
public interface NoticeDAO {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	public int noticeCnt(NoticeVO nvo);
	public NoticeVO noticeDetail(NoticeVO nvo);
	public void readCntUpdate(NoticeVO nvo);
	public void noticeDelete(NoticeVO nvo);
	public void noticeInsert(NoticeVO nvo);
	public void noticeUpdate(NoticeVO nvo);
}
