package com.culture.user.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
//import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.culture.user.comment.service.CommentService;
import com.culture.user.comment.vo.UserCommentVO;
import com.culture.user.commentLike.service.CommentLikeService;
import com.culture.user.commentLike.vo.CommentLikeVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping(value="/comment")
@Slf4j
public class CommentController {
	
	@Setter(onMethod_= @Autowired)
	private CommentService commentService;
	
	@Setter(onMethod_ = @Autowired)
	private CommentLikeService commentLikeService;
	
	/***************************************************************************************
	 * 댓글 글목록 구현하기
	 * @return List<ReplyVO>
	 * 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
	 * 응답 문서 타입을 xml이나 json으로 반환할 때는 produces 속성을 사용한다.
	 * produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE }
	 * 현재 요청 URL : http://localhost:8080/replies/all/게시판글번호(b_num)
	 * 예전 요청 URL : http://localhost:8080/replies/replyList?b_num=게시판글번호
	 * ResponseEntity는 개발자가 직접 결과 데이터와 HTTP 상태 코드(200, 404, 500..)를 직접 제어할 수 있는 클래스.
	 *************************************************************************************
	@GetMapping(value= "/all/{b_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num, ReplyVO rvo) {
		log.info("list 호출 성공");
		rvo.serB_num(b_num);
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResposeEntity<>(repltService.replyList(rvo). HttpStatus.OK);
		return entity;
	}
	*/
	
	@GetMapping(value = "/all/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<UserCommentVO> commentList(@PathVariable("id") String id, UserCommentVO cvo) {
	    log.info("List 호출 성공");
	    
	    List<UserCommentVO> entity = null;
	    cvo.setId(id);
	    entity = commentService.commentList(cvo);
	    return entity;
	}

	
	
	/**************************************************************
	 * 댓글 글쓰기 구현하기
	 * @return String
	 * 참고 : @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value} 
	 * 		consumes 속성을 이용하면 사용자가 Request Body에 담는 타입을 제한할 수 있으며 
	 * 		만약 요청 데이터가 JSON이라면 요청시 헤더에 반드시 application/json이 존재해야 한다.
	 * 
	 * 		produces 속성을 추가하고 dataType을 지정하면 해당 데이터타입으로만 
	 * 		사용자에게 응답하겠다는 의미로 해석하면 된다.
	 * 현재 요청 URL : http://localhost:8080/replies/replyInsert
	 **************************************************************/
	@PostMapping(value = "/commentInsert", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String commentInsert(@RequestBody UserCommentVO cvo) {
		log.info("commentInsert 호출 성공");
		log.info("commentInsert: "+ cvo);
		int result = 0;
		
		result = commentService.commentInsert(cvo);
		return (result==1) ? "SUCCESS":"FAILURE";
	}
	
	/**
	 * 댓글 수정 구현하기
	 * @return
	 * 참고 : REST 방식에서 UPDATE 자업은 PUT,PATCH 방식을 이용해서 처리.
	 * 		전체 데이터를 수정하는 경우에는 PUT을 이용하고,
	 * 		일부의 데이터를 수정하는 경우에는 PATCH를 이용..
	 * 현재 요청 URL : http://localhost:8080/replies/댓글번호
	 * **/
	@PutMapping(value = "/{mv_co_num}", consumes = "application/json", produces = MediaType.TEXT_PLAIN_VALUE)
	public String commentUpdate(@PathVariable("mv_co_num") int mv_co_num, @RequestBody UserCommentVO cvo) {
		log.info("commentUpdate 호출 성공");
		log.info("수정할 번호 :" + mv_co_num);
	
		cvo.setMvCoNum(mv_co_num);
		int result = commentService.commentUpdate(cvo);
		return (result==1)?"SUCCESS":"FAILURE";
	}
	
	/************************************************************
	 * 댓글 삭제 구현하기
	 * @return
	 * 참고 : REST방식에서 삭제 작업은 DELETE 방식을 이용해서 처리
	 * 현재 요청 URL : http://localhost:8080/replies/댓글번호
	 ************************************************************/
	@DeleteMapping(value = "/{mv_co_num}", produces = MediaType.TEXT_PLAIN_VALUE)
	public String commentDelete(@PathVariable("mv_co_num") int mv_co_num) {
		log.info("commentDelete 호출 성공");
		log.info("mv_co_num = " + mv_co_num);
		
		int result = commentService.commentDelete(mv_co_num);
		return (result==1) ? "SUCCESS":"FAILURE";
	}
	
    // 좋아요 기능 추가
    @PostMapping(value = "/like")
    public ResponseEntity<String> likeComment(@RequestBody CommentLikeVO likeVO) {
        int result = commentLikeService.insertLike(likeVO);
        return (result == 1) ? ResponseEntity.ok("Liked") : ResponseEntity.ok("Unliked");
    }

    // 좋아요 취소 기능 추가
    @DeleteMapping(value = "/like")
    public ResponseEntity<String> unlikeComment(@RequestBody CommentLikeVO likeVO) {
        int result = commentLikeService.deleteLike(likeVO);
        return (result == 1) ? ResponseEntity.ok("Unliked") : ResponseEntity.ok("Like status not changed");
    }

    @GetMapping(value = "/likeCount/{mv_co_num}", produces = MediaType.APPLICATION_JSON_VALUE)
    public int getLikeCount(@PathVariable("mv_co_num") int mv_co_num) {
        return commentLikeService.getLikeCount(mv_co_num);
    }
}
