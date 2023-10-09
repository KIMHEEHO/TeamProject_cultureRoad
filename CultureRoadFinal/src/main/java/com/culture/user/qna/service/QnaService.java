package com.culture.user.qna.service;




import java.util.List;

import com.culture.user.qna.vo.UserQnaVO;

public interface QnaService {
	
	public List<UserQnaVO> qnaList(UserQnaVO qvo); //글 목록
	
	public int deleteQna(int qna_id);//글 삭제
	
	public int insertQna(UserQnaVO qvo); //질문글 입력

	public int qnaListCnt(UserQnaVO qvo); //페이징
	
	public void updateAnswer(UserQnaVO qvo); //관리자 답변
	
	
	public UserQnaVO getQnaById(int qna_id);

	
	public void updateQna(UserQnaVO qvo);  //사용자 수정


	












}
