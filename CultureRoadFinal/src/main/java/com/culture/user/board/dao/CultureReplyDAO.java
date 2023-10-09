package com.culture.user.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.board.vo.CultureReplyVO;


@Mapper
public interface CultureReplyDAO {

	public List<CultureReplyVO> cultureReplyList(CultureReplyVO crvo);
	public int cultureReplyInsert(CultureReplyVO crvo);
	public int cultureReplyUpdate(CultureReplyVO crvo);
	public int cultureReplyDelete(CultureReplyVO crvo);
	public List<CultureReplyVO> cultureReplyAllList(CultureReplyVO crvo);
	public int cultureReplyTotal(CultureReplyVO crvo);
	public int cultureReplyHidden(CultureReplyVO crvo);
}
