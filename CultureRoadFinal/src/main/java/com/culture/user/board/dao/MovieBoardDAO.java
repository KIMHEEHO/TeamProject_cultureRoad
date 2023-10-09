package com.culture.user.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.board.vo.MovieBoardVO;

@Mapper
public interface MovieBoardDAO {
	
	public List<MovieBoardVO> movieBoardList(MovieBoardVO mvo);
	public int movieBoardtotal(MovieBoardVO mvo);
	public void movieBoardReadCntUpdate(MovieBoardVO mvo);
	public MovieBoardVO movieBoardDetail(MovieBoardVO mvo);
	public void movieBoardInsert(MovieBoardVO mvo);
	public void movieBoardDelete(MovieBoardVO mvo);
	public void movieBoardUpdate(MovieBoardVO mvo);
	
	/*관리자*/
	public void movieHidden(MovieBoardVO mvo);
	
}
