package com.culture.user.board.dao;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import com.culture.user.board.vo.MovieReplyVO;

@Mapper
public interface MovieReplyDAO {
	
	public List<MovieReplyVO> movieReplyList(MovieReplyVO mrvo);
	public int movieReplyInsert(MovieReplyVO mrvo);
	public int movieReplyUpdate(MovieReplyVO mrvo);
	public int movieReplyDelete(MovieReplyVO mrvo);
	public List<MovieReplyVO> movieReplyAllList(MovieReplyVO mrvo);
	public int movieReplyTotal(MovieReplyVO mrvo);
	public int movieReplyHidden(MovieReplyVO mrvo);
}
