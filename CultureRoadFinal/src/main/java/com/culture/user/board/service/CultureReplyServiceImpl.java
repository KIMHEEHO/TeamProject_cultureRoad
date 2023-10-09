package com.culture.user.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.board.dao.CultureReplyDAO;
import com.culture.user.board.vo.CultureReplyVO;

import lombok.Setter;

@Service
public class CultureReplyServiceImpl implements CultureReplyService {

	@Setter(onMethod_ = @Autowired)
	private CultureReplyDAO cultureDAO;
	@Override
	public List<CultureReplyVO> cultureReplyList(CultureReplyVO crvo) {
		List<CultureReplyVO> list = cultureDAO.cultureReplyList(crvo);
		return list;
	}

	@Override
	public int cultureReplyInsert(CultureReplyVO crvo) {
		int result = cultureDAO.cultureReplyInsert(crvo);
		return result;
	}

	@Override
	public int cultureReplyUpdate(CultureReplyVO crvo) {
		int result = cultureDAO.cultureReplyUpdate(crvo);
		return result;
	}

	@Override
	public int cultureReplyDelete(CultureReplyVO crvo) {
		int result = cultureDAO.cultureReplyDelete(crvo);
		return result;
	}

	@Override
	public List<CultureReplyVO> cultureReplyAllList(CultureReplyVO crvo) {
		List<CultureReplyVO> list = cultureDAO.cultureReplyAllList(crvo);
		return list;
	}

	@Override
	public int cultureReplyTotal(CultureReplyVO crvo) {
		int result = cultureDAO.cultureReplyTotal(crvo);
		return result;
	}

	@Override
	public int cultureReplyHidden(CultureReplyVO crvo) {
		int result = cultureDAO.cultureReplyHidden(crvo);
		return result;
	}

}
