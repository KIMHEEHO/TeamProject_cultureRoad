package com.culture.admin.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.admin.comment.dao.AdminCommentDAO;
import com.culture.admin.comment.vo.AdminCommentVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminCommentServiceImpl implements AdminCommentService {

	@Setter(onMethod_ = @Autowired)
	private AdminCommentDAO adminCommentDAO;

	// 한줄평 목록
	@Override
	public List<AdminCommentVO> adminCommentList(AdminCommentVO cvo) {
		List<AdminCommentVO> list = null;
		list = adminCommentDAO.adminCommentList(cvo);
		log.info("aaaa"+list);
		return list;
	}

	@Override
	public int adminCommentListCnt(AdminCommentVO cvo) {
		int total = adminCommentDAO.adminCommentListCnt(cvo);
		return total;
	}

	// 한줄평 상세보기
	@Override
	public AdminCommentVO adminCommentDetail(AdminCommentVO cvo) {
		AdminCommentVO detail = adminCommentDAO.adminCommentDetail(cvo);

		// 글내용 줄바꿈
		if (detail != null) {
			detail.setMvCoContent(detail.getMvCoContent().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	// 한줄평 삭제
	@Override
	public int adminCommentDelete(AdminCommentVO cvo) throws Exception {
		int result = 0;

		result = adminCommentDAO.adminCommentDelete(cvo.getMvCoNum());
		return result;
	}

}
