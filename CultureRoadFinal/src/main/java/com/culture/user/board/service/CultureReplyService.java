package com.culture.user.board.service;

import java.util.List;

import com.culture.user.board.vo.CultureReplyVO;

public interface CultureReplyService {
	public List<CultureReplyVO> cultureReplyList(CultureReplyVO crvo);
	public int cultureReplyInsert(CultureReplyVO crvo);
	public int cultureReplyUpdate(CultureReplyVO crvo);
	public int cultureReplyDelete(CultureReplyVO crvo);
	public List<CultureReplyVO> cultureReplyAllList(CultureReplyVO crvo);
	public int cultureReplyTotal(CultureReplyVO crvo);
	public int cultureReplyHidden(CultureReplyVO crvo);
	
}
