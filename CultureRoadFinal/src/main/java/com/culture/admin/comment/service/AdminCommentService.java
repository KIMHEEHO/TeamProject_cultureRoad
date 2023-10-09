package com.culture.admin.comment.service;

import java.util.List;

import com.culture.admin.comment.vo.AdminCommentVO;

public interface AdminCommentService {
	public List<AdminCommentVO> adminCommentList(AdminCommentVO cvo);

	public AdminCommentVO adminCommentDetail(AdminCommentVO cvo);

	public int adminCommentListCnt(AdminCommentVO cvo);

	public int adminCommentDelete(AdminCommentVO cvo) throws Exception;
}
