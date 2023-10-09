package com.culture.user.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.comment.dao.CommentDAO;
import com.culture.user.comment.vo.UserCommentVO;

import lombok.Setter;

@Service
public class CommentServiceImpl implements CommentService {
	
	@Setter(onMethod_ = @Autowired)
	private CommentDAO commentDAO;
	
	// 글 목록 구현 - 댓글 목록 조회
	@Override
	public List<UserCommentVO> commentList(UserCommentVO cvo) {
		List<UserCommentVO> list = null;
		list = commentDAO.commentList(cvo);
		return list;
	}
	
	// 글 입력 구현
	@Override
	public int commentInsert(UserCommentVO cvo) {
		int result = 0;
		result = commentDAO.commentInsert(cvo);
		
		return result;
	}

	@Override
	public int commentUpdate(UserCommentVO cvo) {
		int result = 0;
		result = commentDAO.commentUpdate(cvo);
		return result;
	}

	@Override
	public int commentDelete(int mv_co_num) {
		int result = 0;
		result = commentDAO.commentDelete(mv_co_num);
		return result;
	}

	@Override
	public List<UserCommentVO> bestComment() {
		List<UserCommentVO> list = null;
		list = commentDAO.bestComment();
		return list;
	}

	

}
