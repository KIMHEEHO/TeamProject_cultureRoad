package com.culture.user.comment.vo;



import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserCommentVO {
	private int 		mvCoNum = 0; 				//한줄평 번호
	private String 		id = ""; 					//영화 아이디(코드)
	private String 		mvCoContent = ""; 		// 댓글 내용
	private String 		mvCoWriteDate = ""; 	    // 댓글 작성일
	private int 		mvCoRatings = 0; 			// 댓글 점수
	private int			mvCoHidden = 0; 			// 댓글 숨김
	private int 		mvCoRed = 0; 				// 댓글 신고
	private int 		userNo = 0; 				// 사용자 번호
	private String		userId = "";
	private String 		userName = "";				// 사용자명
	private String 		title = "";					// 영화 제목
	private String poster_path;
    // 추가: 좋아요 상태 (1: 좋아요, 0: 좋아요 취소)
    private int likeStatus;
    
    private String commentCnt = "";

    // 추가: 좋아요 개수를 나타내는 필드
    private int likeCount;
}