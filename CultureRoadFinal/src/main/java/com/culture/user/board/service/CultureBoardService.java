package com.culture.user.board.service;

import java.util.List;

import com.culture.user.board.vo.CultureBoardVO;

public interface CultureBoardService {

	public List<CultureBoardVO> cultureBoardList(CultureBoardVO cvo);
	public int cultureBoardtotal(CultureBoardVO cvo);
	public void cultureBoardReadCntUpdate(CultureBoardVO cvo);
	public CultureBoardVO cultureBoardDetail(CultureBoardVO cvo);
	public void cultureBoardInsert(CultureBoardVO cvo);
	public void cultureBoardDelete(CultureBoardVO cvo);
	public void cultureBoardUpdate(CultureBoardVO cvo);
	
	/*관리자*/
	public void cultureHidden(CultureBoardVO cvo);
}
