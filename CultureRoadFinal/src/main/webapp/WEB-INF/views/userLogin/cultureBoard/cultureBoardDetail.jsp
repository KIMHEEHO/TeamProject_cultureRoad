<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%> 
<script type="text/javascript">
	$(function(){
		$("#replyBtn").click(function(){
			$("#replyForm").attr({
				"method":"post",
				"action":"/culture/replyInsert"
			})
			$("#replyForm").submit();
		})
		
		$(".updateReplyBtn").click(function(){
			const trElement = $(this).closest("tr");
		      
		    const hiddenInput = trElement.find(".replyUpdate");
		    const hiddenInputBtn = trElement.find(".replyUpdateBtn");
		    hiddenInput.attr("type", "text");
		    hiddenInputBtn.attr("type", "btn");
		})
		
		$("#deleteBtn").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				$("#ctBoardModify").attr({
					"method":"post",
					"action":"/culture/boardDelete"				
				})
				$("#ctBoardModify").submit();
			}
		})
		
		$("#updateBtn").click(function(){
			if(confirm("수정 하시겠습니까?")){
				$("#ctBoardModify").attr({
					"method":"post",
					"action":"/culture/boardUpdateForm"				
				})
				$("#ctBoardModify").submit();
			}
		})
		
	
	})
	
	
</script>
<style>
#container {
      margin: 120px;
   }
   
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
</head>
<body class="d-flex flex-column min-vh-100">
<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
<div id="container">
	<div class="contentTit page-header">
		<h3 class="text-center">${detail.ctBoTitle }</h3>
	</div>

	<div class="contentTB text-center">
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td id="thead"  class="col-md-3">작성자</td>
					<td class="col-md-3 text-start">${detail.userName }(조회수: ${detail.ctBoReadcnt})</td>
					<td id="thead" class="col-md-3">작성일</td>
					<td class="col-md-3 text-start">${detail.ctBoWriteDate}</td>
				</tr>
				<!-- 이 부분에 추가한 CSS 클래스 적용 -->
				<tr class="table-tr-height">
					<td id="thead" class="col-md-3">내용</td>
					<td colspan="3" class="col-md-8 text-start">${detail.ctBoContent}</td>
				</tr>
			</tbody>
		</table>
		<div class="text-end">
			<c:if test="${detail.userNo == userLogin.userNo}">
				<form id="ctBoardModify">
					<input type="hidden" id="ctBoNum" name="ctBoNum" value="${detail.ctBoNum}">
					<input type="button" class="btn" id="updateBtn" value="수정">
					<input type="button" class="btn" id="deleteBtn" name="deleteBtn" value="삭제">
					<a class="btn" href="/culture/board">목록</a>
				</form>
			</c:if>
			<c:if test="${detail.userNo != userLogin.userNo}">
				<form id="ctBoardModify">
<!-- 						<a class="btn" href="/movie/mvBoard">신고</a> -->
					<a class="btn" href="/culture/board">목록</a>
				</form>
			</c:if>
		</div>
	</div>
	<%@ include file="cultureReply.jsp"%>
</div>

		<!-- 댓글 목록 -->
		<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>
</body>
</html>
