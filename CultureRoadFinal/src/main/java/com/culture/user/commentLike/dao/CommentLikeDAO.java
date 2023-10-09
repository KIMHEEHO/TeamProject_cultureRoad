package com.culture.user.commentLike.dao;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.commentLike.vo.CommentLikeVO;

@Mapper
public interface CommentLikeDAO {

	public int insertLike(CommentLikeVO likeVO);

	public int deleteLike(CommentLikeVO likeVO);

	public int getLikeStatus(CommentLikeVO likeVO);

	public int getLikeCount(int cnt);
}
