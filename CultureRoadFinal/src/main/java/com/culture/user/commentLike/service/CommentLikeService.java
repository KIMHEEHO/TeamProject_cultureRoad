package com.culture.user.commentLike.service;

import com.culture.user.commentLike.vo.CommentLikeVO;

public interface CommentLikeService {
	public int insertLike(CommentLikeVO likeVO);

	public int deleteLike(CommentLikeVO likeVO);

	public int getLikeStatus(CommentLikeVO likeVO);

	public int getLikeCount(int mvCoNum);
}