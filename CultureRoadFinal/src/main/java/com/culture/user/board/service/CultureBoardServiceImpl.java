package com.culture.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.board.dao.CultureBoardDAO;
import com.culture.user.board.vo.CultureBoardVO;

import lombok.Setter;

@Service
public class CultureBoardServiceImpl implements CultureBoardService {

	@Setter(onMethod_ = @Autowired)
	CultureBoardDAO cultureDAO;

	@Override
	public List<CultureBoardVO> cultureBoardList(CultureBoardVO cvo) {
		List<CultureBoardVO> list = cultureDAO.cultureBoardList(cvo);
		return list;
	}

	@Override
	public int cultureBoardtotal(CultureBoardVO cvo) {
		int total = cultureDAO.cultureBoardtotal(cvo);
		return total;
	}

	@Override
	public void cultureBoardReadCntUpdate(CultureBoardVO cvo) {
		cultureDAO.cultureBoardReadCntUpdate(cvo);
	}

	@Override
	public CultureBoardVO cultureBoardDetail(CultureBoardVO cvo) {
		CultureBoardVO detail = cultureDAO.cultureBoardDetail(cvo);
		return detail;
	}

	@Override
	public void cultureBoardInsert(CultureBoardVO cvo) {
		cultureDAO.cultureBoardInsert(cvo);
	}

	@Override
	public void cultureBoardDelete(CultureBoardVO cvo) {
		cultureDAO.cultureBoardDelete(cvo);
	}

	@Override
	public void cultureBoardUpdate(CultureBoardVO cvo) {
		cultureDAO.cultureBoardUpdate(cvo);
	}

	@Override
	public void cultureHidden(CultureBoardVO cvo) {
		cultureDAO.cultureHidden(cvo);
	}

	
	
}
