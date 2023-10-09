package com.culture.user.qna.service;

import java.util.List;  

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.culture.user.qna.dao.QnaDAO;
import com.culture.user.qna.vo.UserQnaVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {

	@Setter(onMethod_ = @Autowired)
	public QnaDAO qnaDAO;

	

	@Override
	public List<UserQnaVO> qnaList(UserQnaVO qvo) {
		List<UserQnaVO> list = qnaDAO.qnaList(qvo);
		return list;
	}

	@Override
	public int insertQna(UserQnaVO qvo) {
		int result = 0;
		result = qnaDAO.insertQna(qvo);
		return result;
	}
	
	
	@Override
	public int qnaListCnt(UserQnaVO qvo) {
		return qnaDAO.qnaListCnt(qvo);
	}
	/*********************답변 입력,삭제****************************/


	  @Override
	    public void updateAnswer(UserQnaVO qvo) {
	      log.info("쿼리문 가기직전");  
		  qnaDAO.updateAnswer(qvo);
		  log.info("쿼리문 다녀옴");
	    }

		@Override
		public int deleteQna(int qna_id) {
			return qnaDAO.deleteQna(qna_id);
		}

	
		/********************사용자 수정 ***************************/
		
		@Override
		public void updateQna(UserQnaVO qvo) {
			qnaDAO.updateQna(qvo);
		}

		@Override
		public UserQnaVO getQnaById(int qna_id) {
			return qnaDAO.getQnaById(qna_id);
		}


		






	  




	
	

	
	
}
