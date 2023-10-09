<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script type="text/javascript">

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
<div id="container">
	<div class="contentTit page-header">
		<h3 class="text-center">${detail.noc_title }</h3>
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
					<td id="thead" class="col-md-3">내용</td>
					<td colspan="3" class="col-md-8 text-start">${detail.noc_content}</td>
				</tr>
			</tbody>
		</table>
		<div class="text-end">
			<a class="btn" href="/notice/list">목록</a>
		</div>
	</div>
</div>
