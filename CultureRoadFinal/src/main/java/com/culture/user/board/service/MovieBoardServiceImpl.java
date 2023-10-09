package com.culture.user.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.board.dao.MovieBoardDAO;
import com.culture.user.board.vo.MovieBoardVO;
import com.culture.user.board.vo.MovieReplyVO;

import lombok.Setter;

@Service
public class MovieBoardServiceImpl implements MovieBoardService {

	@Setter(onMethod_ = @Autowired)
	public MovieBoardDAO movieBoardDAO;
	
	@Override
	public List<MovieBoardVO> movieBoardList(MovieBoardVO mvo) {
		List<MovieBoardVO> list = movieBoardDAO.movieBoardList(mvo);
//		list.addAll(movieBoardDAO.movieReplyCnt(mvo));
		return list;
	}
	
	@Override
	public int movieBoardtotal(MovieBoardVO mvo) {
		int total = movieBoardDAO.movieBoardtotal(mvo);
		return total;
	}

	@Override
	public void movieBoardReadCntUpdate(MovieBoardVO mvo) {
		movieBoardDAO.movieBoardReadCntUpdate(mvo);
	}

	@Override
	public MovieBoardVO movieBoardDetail(MovieBoardVO mvo) {
		MovieBoardVO data = movieBoardDAO.movieBoardDetail(mvo);
		return data;
	}

	@Override
	public void movieBoardInsert(MovieBoardVO mvo) {
		movieBoardDAO.movieBoardInsert(mvo);
	}

	@Override
	public void movieBoardDelete(MovieBoardVO mvo) {
		movieBoardDAO.movieBoardDelete(mvo);
	}

	@Override
	public void movieBoardUpdate(MovieBoardVO mvo) {
		movieBoardDAO.movieBoardUpdate(mvo);
	}

	@Override
	public void movieHidden(MovieBoardVO mvo) {
		movieBoardDAO.movieHidden(mvo);
	}


}
