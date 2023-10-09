package com.culture.user.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.board.vo.CultureBoardVO;

@Mapper
public interface CultureBoardDAO {
	
	public List<CultureBoardVO> cultureBoardList(CultureBoardVO cvo);
	public int cultureBoardtotal(CultureBoardVO cvo);
	public void cultureBoardReadCntUpdate(CultureBoardVO cvo);
	public CultureBoardVO cultureBoardDetail(CultureBoardVO cvo);
	public void cultureBoardInsert(CultureBoardVO cvo);
	public void cultureBoardDelete(CultureBoardVO cvo);
	public void cultureBoardUpdate(CultureBoardVO cvo);
	
	/*관리자*/
	public void cultureHidden(CultureBoardVO mvo);
}
