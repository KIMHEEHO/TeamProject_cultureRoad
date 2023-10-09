<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<style>
	.text-center{
		margin-top:200px;
		margin-bottom:50px;	
	
	
	}
</style>

<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/qna/qnaClient";
		});
	
	
// 		$("#writeBtn").click(function() {
// 			if (!chkData("#question", "내용을")) return;
// 			else{
// 				$("#writeForm").attr({
// 					"method":"post",
// 					"action":"/qna/insertQna"
// 				});
// 				$("#writeForm").submit();
// 			}
// 		})

		
		$("#writeBtn").click(function() {
		    if (!chkData("#question", "내용을")) return;
		    else{
		    	
		    	if (!$("#category").is(":checked")){
				    $("#category").val(0);
				   }
		    	
				    $("#writeForm").attr({
				        "method": "post",
				        "action": "/qna/insertQna"
				    });
				    $("#writeForm").submit();
		    
		    }
		});
	})
</script>

<title>글 작성</title>
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
									<input type="text" class="form-control" id="user_id" name="user_id" value="${userLogin.userId}" readonly >
								</td>
							</tr>

							<tr>
								<td>글내용</td>
								<td class="text-left">
									<textarea rows="10" cols="10" class="form-control" style="resize: none" name="question" id="question" rows="8"></textarea>
										
						<input type="checkbox" name="category" id="category" value=1 class="checkbox" /><span>비공개로 표시합니다</span><br/><br/>
					
								</td>
							</tr>
								
						</tbody>
					</table>
					
					<div class="contentBtn text-center">
					<button type="button" id="writeBtn" name="writeBtn" class="btn btn-secondary">저장</button>
						<button type="reset" id="cancelBtn" name="cancelBtn" class="btn btn-secondary">취소</button>
						<button type="button" id="listBtn" name="listBtn" class="btn btn-secondary">목록</button>
					</div>
				</form>
			</div>
		</div>
	</body>
</html>