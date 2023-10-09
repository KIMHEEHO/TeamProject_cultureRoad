<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
$(function() {
	$(".replyUpdateInput").css("visibility", "hidden");
	$(".upBtn").css("visibility", "hidden");
	$("#replyInsertBtn").click(function(){
		if(!chkData("#mv_re_content", "내용을 ")) return;
		else {
			$("#replyForm").attr({
				"method":"post",
				"action":"/movie/replyInsert"
			})
			$("#replyForm").submit();
		}
	})
	$(".replyUpBtn").click(function() {
		let div = $(this).closest('.reviewList');
		let currentContent = div.find(".reContent").text();
	    let replyUpdate = div.find('.rereplyin');
	    replyUpdate.css({
	        'display': 'block' // 원하는 속성 및 값으로 변경
	    });
	   $(".mv_re_content").val(currentContent);
	});
	
	$(".replyUpdateBtn").click(function(){
		let div = $(this).closest('.reviewList');
		let mvReContent = div.find('.mv_re_content').val();
		if (mvReContent.trim() === '') {
	        alert('답글 내용을 입력하세요.');
	        $(this).closest('form').find('.mv_re_content').focus();
	        return;
	    }
		else {
			let mv_re_content = $(this).closest('form').find('.mv_re_content').val();
			let mv_re_num = $(this).attr("data-num");
			$("#mv_re_content").val(mv_re_content);
			$("#mv_re_num").val(mv_re_num);
			$("#mv_re_content").val(mv_re_content);
	 		$("#replyForm").attr({
	 			"method":"post",
	 			"action":"/movie/replyUpdate"
	 		})
	 		$("#replyForm").submit();
	 	}
	})	
	
	$(".replyDelBtn").click(function(){
		if(confirm("삭제 하시겠습니까?")){
		let mv_re_num = $(this).attr("data-num");
		$("#mv_re_num").val(mv_re_num);
		$("#replyForm").attr({
				"method":"post",
				"action":"/movie/replyDelete"
			})
			$("#replyForm").submit();
		}
	})
// 	$(".reReplyInsertBtn").click(function(){
// 		let rereply = $(this).attr("data-num");
// 		let div = $(this).closest('.reviewList');
// 		let currentContent = div.find(".mv_re_content").val();
// 		$("#modalReplyUpdateInput").val(currentContent);
// // 		$("#rereply").val(rereply);
		
// 		let mvReContent = div.find('.mv_rere_content').val();
// 		if (mvReContent.trim() === '') {
// 	        alert('답글 내용을 입력하세요.');
// 	        $(this).closest('form').find('.mv_rere_content').focus();
// 	        return;
// 	    }
// 		else {
// 			$("#replyUpdateForm").attr({
// 				"method":"post",
// 				"action":"/movie/replyInsert",
// 			})
// 			$("#replyUpdateForm").submit();
// 		}
// 	})
	
	$(document).on('click', '.reReplyBtn',function(){
		let div = $(this).closest('.reviewList');
	    let rereplyin = div.find('.rereplyin');
	    rereplyin.css({
	        'display': 'block' // 원하는 속성 및 값으로 변경
	    });
		
		
	    
	})
	
})
</script>
<style>

   
/* 제목 부분 */
.contentTit {
	padding: 15px;
	margin-bottom: 20px;
	border-bottom: 1px solid #ccc;
}

.contentTit h3 {
	color: #333;
}

/* 테이블 스타일링 */
.contentTB .table {
	border-collapse: collapse;
}

.contentTB .table th, .contentTB .table td {
	border: 1px solid #ccc;
	padding: 10px;
}


/* 테이블 행 높이 조절 */
.table-tr-height {
	height: 250px; /* 원하는 높이로 설정 */
}

/* Style the table */
.table {
  width: 100%;
  border-collapse: collapse;
  padding-bottom : 30px;
}


/* Style table headers and cells */
.table th,
.table td {
  padding: 12px 15px;
  text-align: center;
  border: 1px solid #ddd;
}


/* Center the text in cells */
.text-center {
  text-align: center;
}

#thead {
  font-weight: bold;
  color: #fff;
  background: #212741;
}

.page-header{
	color : #212741;
}

#title {
	margin-top:10px;
}


</style>

<!-- <div id="container"> -->
	<%-- 댓글 입력 화면 --%>
	<form id="replyForm" name="replyForm">
		<div class="panel panel-default">
			<c:if test="${not empty userLogin }">
			<table class="table">
				<tbody>
					<tr>
						<td id="thead" class="col-md-1">작성자</td>
						<td class="col-md-3 text-left">
							<span  class="form-control" >${userLogin.userName }</span>
							<input type="hidden" id="user_no" name="user_no" value="${userLogin.userNo}">
							<input type="hidden" id="mv_bo_num" name="mv_bo_num" value="${detail.mv_bo_num }" />
							<input type="hidden" name="mv_re_num" id="mv_re_num" value=0>
						</td>
						<td class="col-md-4 btnArea">
							<button type="button" id="replyInsertBtn" class="btn btn-success gap sendBtn">저장</button>
						</td>
					</tr>
					<tr>
						<td id="thead" class="col-md-1">댓글내용</td>
						<td colspan="4" class="col-md-11 text-left">
							<textarea class="form-control" rows="3" id="mv_re_content" name="mv_re_content"></textarea>
						</td>
					</tr>
				</tbody>
			</table>
			</c:if>
		</div>
	</form>
	<%-- 리스트 영역 --%>
<div class="replyUpdate">
	<c:forEach var="reply" items="${reply }">
		<c:if test="${reply.mv_re_hidden == 0 }">
		<div class="reviewList card">
			<div class="card-header">
				<h6 class="d-flex justify-content-between align-items-center">
					<span class="d-flex"> <span class="name me-2">${reply.user_name }</span>
						<span class="date">${reply.mv_re_write_date }</span>
					</span> <span class="btnGroup"> <c:if
							test="${userLogin.userNo == reply.user_no }">
							<input type="button" data-num="${reply.mv_re_num }" class="btn btn-light me-2 replyUpBtn" value="수정">
							<input type="button" data-num="${reply.mv_re_num }" class="btn btn-light replyDelBtn" value="삭제">
						</c:if> 
					</span>
				</h6>
			</div>
			<div class="card-body">
				<span class="reContent">${reply.mv_re_content }</span>
			</div>
		</div>
		</c:if>
		<c:if test="${reply.mv_re_hidden == 1 }">
			<div class="reviewList card">
			<div class="card-header">
				<h3 class="d-flex justify-content-between align-items-center">
					<span class="d-flex"> <span class="name me-2"></span>
						<span class="date">${reply.mv_re_write_date }</span>
					</span>
				</h3>
			</div>
			<div class="card-body">
				<span class="text-center" style="color: red;">🔓부적절한 내용으로 숨김처리 된 댓글입니다.</span>
			</div>
		</div>
		</c:if>
	</c:forEach>
</div>
