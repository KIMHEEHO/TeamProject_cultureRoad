<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/qna/qnaList";
		});
		

		
		$("#writeBtn").click(function() {
			if (!chkData("#question", "내용을")) return;
			else{
				$("#writeForm").attr({
					"method":"post",
					"action":"/qna/updateQna"
				});
				$("#writeForm").submit();
			}
		})
		
	})
</script>

<title>글 수정</title>
	</head>
	<body>
			<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
		<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="writeForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<input type="hidden" name="qna_id" value="${qvo.qna_id}" />
									<input type="text" class="form-control" id="user_id" name="user_id" value="${userLogin.userId}" readonly >
								</td>
							</tr>

							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="question" id="question" rows="8">${qvo.question}</textarea>
								</td>
							</tr>

						</tbody>
					</table>
					
					<div class="contentBtn text-right">
						<button type="button" id="writeBtn" name="writeBtn" class="btn btn-success">저장</button>
						<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-success">취소</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-success">목록</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>