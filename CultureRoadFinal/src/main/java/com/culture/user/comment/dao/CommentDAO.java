package com.culture.user.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.comment.vo.UserCommentVO;



@Mapper
public interface CommentDAO {
	public List<UserCommentVO> commentList(UserCommentVO cvo);
	public int commentInsert(UserCommentVO rvo);
	public int commentUpdate(UserCommentVO rvo);
	public int commentDelete(int mv_co_num);
	public int commentChoiceDelete(int mv_co_num);
	public List<UserCommentVO> bestComment();

}
