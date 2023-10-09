package com.culture.user.board.service;

import java.util.List;

import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;


public interface MovieBoardService {
	
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
