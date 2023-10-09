package com.culture.user.commentLike.vo;

import lombok.Data;

@Data
public class CommentLikeVO {
    private int mvCoNum;
    private int userNo;
    private int likes = 0;
    private int likeStatus = 0;
    private int likeCount = 0; // 추가: 좋아요 개수를 나타내는 필드
}
