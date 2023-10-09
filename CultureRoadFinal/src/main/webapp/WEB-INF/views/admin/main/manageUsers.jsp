<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%> 

<script type="text/javascript">
$(function(){
   let word = "<c:out value='${userLoginVO.keyword}'/>"; 
   if(word!=""){
      $("#keyword").val('<c:out value='${userLoginVO.keyword}'/>');
      $("#keyword").focus();
      $("#search").val('<c:out value='${userLoginVO.search}'/>');
   }
   
   $("#keyword").bind("keydown", (e) => {
      if(e.keyCode ==13) {
         e.preventDefault();
      }
   })
   
       /* 검색 대상이 변경될 때마다 처리 이벤트 */
      $("#search").change(function() {
         if ($("#search").val() == "all") {
            $("#keyword").val("전체목록을 조회합니다.")
         } else if ($("#search").val() != "all") {
            $("#keyword").val("");
            $("#keyword").focus();
         }
      })
   
   $(".page-item a").click(function(e) {
      e.preventDefault();
      $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
      goPage();
   })
         /* 검색 버튼 클릭 시 처리 이벤트 */
   $("#searchData").click(function(){
	   if ($("#search").val() != "all") {
           if (!chkData("#keyword", "검색어를"))
              return;
        }
        $("#pageNum").val(1); //페이지 초기화
        goPage();
	})
	
	//탈퇴처리
	$(".hiddenBtn").click(function() {
	    let userNo = $(this).attr("data-num");
	    let userDelete = $(this).attr("data-hidden");
	    if (userDelete == 1) {
	        $("#userDelete").val(0);
	    } else {
	        $("#userDelete").val(1);
	    }
	    $("#userNo").val(userNo); // 추가
	    $("#hidden").attr({
	        method: "post",
	        action: "/admin/user/userStatusUpdate"
	    });
	    $("#hidden").submit();
	});
});

function goPage() {
      if ($("#search").val() == "all") {
         $("#keyword").val("");
      }

      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/user/manageUsers"
      });
      $("#f_search").submit();
   }

   </script>
<style>
#container {
	margin: 120px;
}
.pagination {
	margin-top:30px;
}

table {
	border: 1px #212741 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	text-align: center;
}

thead {
	font-weight: bold;
	color: #fff;
	background: #212741;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	color: #212741;
}

@media all and (max-width: 768px) {
	table, thead, tbody, th, td, tr {
		display: block;
	}
	th {
		text-align: right;
	}
	table {
		position: relative;
		padding-bottom: 0;
		border: none;
		box-shadow: 0 0 10px rgba(0, 0, 0, .2);
	}
	thead {
		float: left;
		white-space: nowrap;
	}
	tbody {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		white-space: nowrap;
	}
	.pagination .page-item a:hover:not(.active) {
		background-color: #ddd;
	}
	.goDetail {
		cursor: pointer;
	}
	.pagination {
		padding-top: 30px;
		margin-bottom: 50px;
	}
}
</style>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
	<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="d-xl-flex justify-content-between align-items-start">
				<h2 class="text-dark font-weight-bold mb-2">회원관리</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div
						class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
					</div>
					<div class="tab-content tab-transparent-content">

						<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->

						<div class="container">
							<div id="userSearch" class="d-flex justify-content-end">
								<form id="f_search" name="f_search" class="form-inline text-right">
									<%-- 페이징 처리를 위한 파라미터 --%>
									<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}"> 
									<input type="hidden" name="amount" id="amount" value="${paging.cvo.amount}">
									<div class="d-inline-flex text-end">
										<label></label> 
										<select id="search" name="search" class="form-control form-control-sm w-auto">
											<option value="all">전체</option>
											<option value="userId">아이디</option>
											<option value="userName">이름</option>
											<option value="userDelete">회원관리</option>
										</select> <input type="text" name="keyword" id="keyword"
											placeholder="검색어를 입력하세요"
											class="text-right form-control form-control-sm w-auto" />
										<button type="button" id="searchData" class="text-right btn btn-success btn-md">검색</button>
									</div>
								</form>
							</div>
							<br />
								
							<form id="hidden" name="hidden" action="/admin/user/userStatusUpdate" method="post">
							    <input type="hidden" id="userNo" name="userNo" /> <!-- 추가 -->
							    <input type="hidden" id="userDelete" name="userDelete" />
							    <input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}">
							</form>
							<div id="userList" class="table-height noticeboard">
								<table summary="게시판 리스트">
									<thead>
										<tr>
											<th data-value="userNo" class="order text-center col-md-1">회원번호</th>
											<th>회원아이디</th>
											<th>회원이름</th>
											<th>이메일</th>
											<th>핸드폰번호</th>
											<th>생년월일</th>
											<th>가입일</th>
											<!-- <th class="text-center col-md-1">회원상태</th> -->
											<th>회원관리</th>
										</tr>
									</thead>
									<tbody id="list">
										<c:choose>
											<c:when test="${not empty userList}">
												<c:forEach var="userList" items="${userList}"
													varStatus="status">
													<tr class="text-center" data-num="${userList.userNo}">
														<td>${userList.userNo}</td>
														<td>${userList.userId }</td>
														<td>${userList.userName }</td>
														<td>${userList.userEmail}</td>
														<td>${userList.userPhone}</td>
														<td>${userList.userBirth}</td>
														<td>${userList.userDate}</td>
															<td>
															<c:if test="${userList.userDelete == 0 }">
					                                        	<span data-num="${userList.userNo}" data-hidden="${userList.userDelete}"
					                                            class="hiddenBtn text-center"  style="color: red;">탈퇴</span></c:if> 
					                                            <c:if test="${userList.userDelete == 1}">
					                                            <span data-num="${userList.userNo }"
					                                            data-hidden="${userList.userDelete}"
					                                             class="hiddenBtn text-center"">회원복귀</span>
					                                       </c:if></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="5" class="tac text-center">등록된 회원이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
							</div>
							<%-- ================ 리스트 종료 ================ --%>
							<%-- ================ 페이징 출력 ================ --%>
							<div class="d-flex justify-content-center">
								<ul class="pagination ">
									<!-- 이전 바로가기 10개 존재 여부 확인 -->
									<c:if test="${paging.prev }">
										<li class="page-item"><a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }"
											href="${paging.initpage}">처음으로</a></li>
										<li class="page-item previous"><a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }"
											href="${paging.startPage -1}">이전</a></li>
									</c:if>

									            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
               </li>
            </c:forEach>

				<!-- 다음 바로가기 10개 존재 여부 확인 -->
									<c:if test="${paging.next }">
										<li class="page-item next"><a 
										class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }" href="${paging.endPage+1 }">다음</a></li>
									</c:if>
								</ul>
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