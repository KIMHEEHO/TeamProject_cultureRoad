<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%> 
<style>
#thead {
  font-weight: bold;
  color: #fff;
  background: #212741;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#listBtn").click(function(){
			location.href="/admin/notice/board";
		});
		
		$("#insertBtn").click(function() {
			if(!chkData("#noc_title", "제목을")) return;
			else if(!chkData("#noc_content", "내용을")) return;
			
			else{
// 				if($("#file").val()!="") {
// 					if(!chkFile($("#file"))) return;
// 				}
// 				enctype 속성의 기본 값은 "application/x-www-form-urlcencoded". POST방식 폼 전송에 기본 값으로 사용
				$("#insertForm").attr({
					"method":"post",
// 					"enctype":"multipart/form-data", 
					"action":"/admin/notice/noticeInsert"
				});
				$("#insertForm").submit();
			}
		});
		
	})
</script>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
		
<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
<div class="main-panel">
   <div class="content-wrapper">
      <div class="d-xl-flex justify-content-between align-items-start">
         <h2 class="text-dark font-weight-bold mb-2">공지게시판</h2>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div
               class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
            </div>
            <div class="tab-content tab-transparent-content">

<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->

		
	<div class="container">
			
			<div class="text-center">
				<form class="form-horizontal" id="insertForm" name="insertForm">
					<table class="table table-bordered">
						<colgroup><col width="20%" /><col width="80%" /></colgroup>
						<tbody>
							<tr>
								<td id="thead">글제목</td>
								<td class="text-left">
									<input type="hidden" id="manager_no" name="manager_no" value="${adminLogin.managerNo }" />
									<input type="text" class="form-control" id="noc_title" name="noc_title">
								</td>
							</tr>
							<tr>
								<td id="thead">글내용</td>
								<td class="text-left">
									<textarea rows="30" cols="10" class="form-control" style="resize: none" name="noc_content" id="noc_content" rows="8"></textarea>
								</td>
							</tr>
<!-- 							<tr> -->
<!-- 								<td>파일첨부</td> -->
<!-- 								<td class="text-left"> -->
<!-- 									<input type="file" id="file" name="file"> -->
<!-- 								</td> -->
<!-- 							</tr> -->
						</tbody>
					</table>

									<div class="text-end">
										<a class="btn" id="insertBtn">게시글작성</a> <a class="btn"
											href="/admin/notice/board">목록으로</a>
									</div>

								</form>
			</div>
		</div>
<!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
            </div>
         </div>
      </div>

   </div>
   <%@ include file="/WEB-INF/views/admin/main/footer.jsp" %>
</div>
</c:if>