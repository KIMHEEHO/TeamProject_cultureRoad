<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
@charset "UTF-8";

#thead {
  font-weight: bold;
  color: #fff;
  background: #212741;
}

#item-template {
	display: none;
}

.answerform {
	margin: auto;
	width: 800px;
	/* background-color: lightgray; */
}

/* table {
	margin-top: 50px;
} */

#question {
	overflow-wrap: break-word;
	width: 600px;
	height: 200px;
}
/* 	#btn{ */
/* 		text-align:center;	 */
/* 	} */
td {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {

		$("#cancelBtn").click(function() {
			$("#reviewList").each(function() {
				this.reset();
			});
		})

		$("#answerBtn").click(function() {
			if (!chkData("#answer", "내용을"))
				return;
			else {
				$("#reviewList").attr({
					"method" : "post",
					"action" : "/admin/qna/updateAnswer"
				});
				$("#reviewList").submit();
			}
		})

	})
</script>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">

	<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
	<%@ include file="/WEB-INF/views/admin/main/main.jsp"%>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="d-xl-flex justify-content-between align-items-start">
				<h2 class="text-dark font-weight-bold mb-2">QnA게시판</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div
						class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
					</div>
					<div class="tab-content tab-transparent-content">

						<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->


						<div class="container contentContainer">
							<div class="contentTB text-center">
							<div class="answerform">
								<form class="form-horizontal" name="comment-form"
									id="reviewList">
									<input type="hidden" name="qna_id" value="${qvo.qna_id}" /> <input
										type="hidden" name="managerId" value="${adminLogin.managerId}">
									<input type="hidden" name="answer_date"
										value="${qvo.answer_date}" />
									<table class="table table-bordered">
										<colgroup>
											<col width="20%" />
											<col width="80%" />
										</colgroup>
										<tbody>
											<tr>
												<td id="thead">작성자</td>
												<td class="text-left"><input type="text"
													class="form-control" name="user_id" value="${qvo.user_id}"
													readonly /></td>
											</tr>
											<tr>
												<td id="thead">질문</td>
												<td class="text-left"><textarea name="question"
														class="form-control" id="question" readonly>${qvo.question}</textarea>
												</td>
											</tr>
											<tr>
												<td id="thead">답변</td>
												<td class="text-left"><textarea name="answer" id="answer"
														class="form-control" rows="3" placeholder="관리자 답변을 입력하세요">${qvo.answer}</textarea>
												</td>
											</tr>
						
										</tbody>
									</table>
									<div class="text-end">
										<a class="btn" id="answerBtn">게시글작성</a> 
										<a class="btn" type="reset">취소</a>
									</div>
								</form>



							</div>
						</div>
						</div>
						<!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
					</div>
				</div>
			</div>
		<%@ include file="/WEB-INF/views/admin/main/footer.jsp"%>
	</div>
</c:if>



