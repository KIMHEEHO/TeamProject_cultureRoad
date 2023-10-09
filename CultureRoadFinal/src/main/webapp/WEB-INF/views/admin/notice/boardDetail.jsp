<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#updateBtn").click(function(){
			$("#updateFrom").attr({
				"method":"post",
				"action":"/admin/notice/noticeUpdateForm"
			});
			$("#updateFrom").submit();
		})
	})
	</script>
	<style type="text/css">
/* 전체 컨테이너 스타일링 */
.contentContainer {
	background-color: #f9f9f9;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	height: 430px;

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
	

<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>

</c:if>
<c:if test="${not empty adminLogin}">
		
<!--     <div class="container board-container"> -->
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
  
	<div class="container contentContainer">

		<div class="contentTit page-header">
			<h3 id="title" class="text-center" >${detail.noc_title }</h3>
		</div>

		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td id="thead" class="col-md-3">작성자</td>
						<td class="col-md-3 text-start">관리자 (조회수: ${detail.readcnt})</td>
						<td id="thead" class="col-md-3">작성일</td>
						<td class="col-md-3 text-start">${detail.noc_write_date}</td>
					</tr>
					<!-- 이 부분에 추가한 CSS 클래스 적용 -->
					<tr class="table-tr-height">
						<td  id="thead" >내용</td>
						<td colspan="3" class="col-md-8 text-start">${detail.noc_content}</td>
					</tr>
				</tbody>
			</table>
			<div class="text-end">
				<a class="btn" id="updateBtn" >수정</a>
				<a class="btn" href="/admin/notice/board">목록으로</a>
			</div>
			<form id="updateFrom">
				<input type="hidden" id="noc_num" name="noc_num" value="${detail.noc_num }" />
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