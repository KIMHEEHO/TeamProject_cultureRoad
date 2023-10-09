package com.culture.admin.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.admin.comment.vo.AdminCommentVO;

@Mapper
public interface AdminCommentDAO {
	public List<AdminCommentVO> adminCommentList(AdminCommentVO cvo);
	public AdminCommentVO adminCommentDetail(AdminCommentVO cvo);
	public int adminCommentDelete(int mvCoNum);
	public int adminCommentListCnt(AdminCommentVO cvo);
}
