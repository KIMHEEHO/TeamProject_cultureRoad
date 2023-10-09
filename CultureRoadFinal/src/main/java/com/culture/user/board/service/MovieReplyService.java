package com.culture.user.board.service;

import java.util.List;

import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

public interface MovieReplyService {
	public List<MovieReplyVO> movieReplyList(MovieReplyVO mrvo);
	public int movieReplyInsert(MovieReplyVO mrvo);
	public int movieReplyUpdate(MovieReplyVO mrvo);
	public int movieReplyDelete(MovieReplyVO mrvo);
	public List<MovieReplyVO> movieReplyAllList(MovieReplyVO mrvo);
	public int movieReplyTotal(MovieReplyVO mrvo);
	public int movieReplyHidden(MovieReplyVO mrvo);
	
}
