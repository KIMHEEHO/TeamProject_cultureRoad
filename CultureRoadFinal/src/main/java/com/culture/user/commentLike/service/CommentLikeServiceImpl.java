package com.culture.user.commentLike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.commentLike.dao.CommentLikeDAO;
import com.culture.user.commentLike.vo.CommentLikeVO;

import lombok.Setter;


@Service
public class CommentLikeServiceImpl implements CommentLikeService {
	
		@Setter(onMethod_ = @Autowired)
		private CommentLikeDAO commentLikeDAO;


	@Override
	public int insertLike(CommentLikeVO likeVO) {
	      int result = commentLikeDAO.insertLike(likeVO);
	      
	      return result;
	}

	@Override
	public int deleteLike(CommentLikeVO likeVO) {
	      int result = commentLikeDAO.deleteLike(likeVO);
	      
	      return result;
	}

	@Override
	public int getLikeStatus(CommentLikeVO likeVO) {
	      int result = commentLikeDAO.getLikeStatus(likeVO);
	      
	      return result;
	}

	@Override
	public int getLikeCount(int mvCoNum) {
	      int result = commentLikeDAO.getLikeCount(mvCoNum);
	      
	      return result;
	} 
}