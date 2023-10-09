package com.culture.user.qna.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.culture.user.qna.vo.UserQnaVO;

@Mapper
public interface QnaDAO {

	public List<UserQnaVO> qnaList(UserQnaVO qvo);   //목록
	public int insertQna(UserQnaVO qvo); //글쓰기
	public int deleteQna(int qna_id); //삭제
	
	public int qnaListCnt(UserQnaVO qvo); //페이징
	public void updateAnswer(UserQnaVO qvo); //관리자답변

	public UserQnaVO getQnaById(int qna_id);
	
	public void updateQna(UserQnaVO qvo); //수정
	
	/*******아직 안한 거************/
	
	

}
