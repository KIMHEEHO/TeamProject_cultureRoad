package com.culture.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.board.dao.MovieReplyDAO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;

@Service
public class MovieReplyServiceImpl implements MovieReplyService {

	@Setter(onMethod_ = @Autowired)
	public MovieReplyDAO movieReplyDAO;
	
	@Override
	public List<MovieReplyVO> movieReplyList(MovieReplyVO mrvo) {
		List<MovieReplyVO> list = movieReplyDAO.movieReplyList(mrvo);
		return list;
	}

	@Override
	public int movieReplyInsert(MovieReplyVO mrvo) {
		int result = movieReplyDAO.movieReplyInsert(mrvo);
		return result;
	}

	@Override
	public int movieReplyUpdate(MovieReplyVO mrvo) {
		int result = movieReplyDAO.movieReplyUpdate(mrvo);
		return result;
	}

	@Override
	public int movieReplyDelete(MovieReplyVO mrvo) {
		int result = movieReplyDAO.movieReplyDelete(mrvo);
		return result;
	}

	@Override
	public List<MovieReplyVO> movieReplyAllList(MovieReplyVO mrvo) {
		List<MovieReplyVO> list = movieReplyDAO.movieReplyAllList(mrvo);
		return list;
	}

	@Override
	public int movieReplyTotal(MovieReplyVO mrvo) {
		int cnt = movieReplyDAO.movieReplyTotal(mrvo);
		return cnt;
	}

	@Override
	public int movieReplyHidden(MovieReplyVO mrvo) {
		int result = movieReplyDAO.movieReplyHidden(mrvo);
		return result;
	}

	

}
