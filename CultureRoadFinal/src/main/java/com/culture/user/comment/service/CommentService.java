package com.culture.user.comment.service;

import java.util.List;

import com.culture.user.comment.vo.UserCommentVO;



public interface CommentService {

	public List<UserCommentVO> commentList(UserCommentVO cvo);

	public int commentInsert(UserCommentVO cvo);

	public int commentUpdate(UserCommentVO cvo);

	public int commentDelete(int mv_co_num);
	
	public List<UserCommentVO> bestComment();
	

}
