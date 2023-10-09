package com.culture.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.admin.notice.dao.NoticeDAO;
import com.culture.admin.notice.vo.NoticeVO;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	public NoticeDAO noticeDAO;

	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> list = noticeDAO.noticeList(nvo);
		return list;
	}

	@Override
	public int noticeCnt(NoticeVO nvo) {
		return noticeDAO.noticeCnt(nvo);
	}


	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		NoticeVO detail = noticeDAO.noticeDetail(nvo);
		
		if(detail!=null) {
			detail.setNoc_content(detail.getNoc_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}
	@Override
	public void readCntUpdate(NoticeVO nvo) {
		noticeDAO.readCntUpdate(nvo);
	}

	@Override
	public void noticeDelete(NoticeVO nvo) {
		noticeDAO.noticeDelete(nvo);
	}

	@Override
	public void noticeInsert(NoticeVO nvo) {
		noticeDAO.noticeInsert(nvo);
	}

	@Override
	public void noticeUpdate(NoticeVO nvo) {
		noticeDAO.noticeUpdate(nvo);
	}

}
