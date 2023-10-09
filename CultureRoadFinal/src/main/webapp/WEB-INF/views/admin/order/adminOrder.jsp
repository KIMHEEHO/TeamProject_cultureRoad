<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>

<script type="text/javascript">
$(function(){
	let word = "<c:out value='${MvOrderDetailVO.keyword}'/>"; 
	if(word!=""){
		$("#keyword").val('<c:out value='${MvOrderDetailVO.keyword}'/>');
		$("#keyword").focus();
		$("#search").val('<c:out value='${MvOrderDetailVO.search}'/>');
	}
   
	$("#keyword").bind("keydown", (e) => {
		if(e.keyCode ==13) {
        e.preventDefault();
      }
   })
   
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
	
/* 	//결제취소처리
	$(".hiddenBtn").click(function() {
		let mvPaymentId = $(this).attr("data-num");
		let mvPayStatus = $(this).attr("data-hidden");
		if (mvPayStatus == 1) {
			$("#mvPayStatus").val(2);
		}
		$("#hidden").attr({
			method: "post",
			action: "/admin/paymentCancel"
		});
		$("#hidden").submit();
	}); */
});

function goPage() {
    if ($("#search").val() == "all") {
       $("#keyword").val("");
    }

    $("#f_search").attr({
       "method" : "get",
       "action" : "/admin/paymentList"
    });
    $("#f_search").submit();
 }

   </script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

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
<!--   <script>
        // URL에서 메시지 파라미터를 가져와서 알림창으로 표시합니다.
        var message = decodeURIComponent(getParameterByName('message'));
        alert(message);

        // URL에서 파라미터 값을 가져오는 함수
        function getParameterByName(name) {
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(window.location.search);
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }
    </script> -->

<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
	<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
	<div class="main-panel">
		<div class="content-wrapper">
			<div class="d-xl-flex justify-content-between align-items-start">
				<h2 class="text-dark font-weight-bold mb-2">결제관리</h2>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
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
											<option value="userName">이름</option>
											<option value="mvPayStatus">결제관리</option>
										</select> <input type="text" name="keyword" id="keyword"
											placeholder="검색어를 입력하세요"
											class="text-right form-control form-control-sm w-auto" />
										<button type="button" id="searchData" class="text-right btn btn-success btn-md">검색</button>
									</div>
								</form>
							</div>
							<br />
							
							<form id="frm" method="post">
								<input type="hidden" id="mvPaymentId" name="mvPaymentId"/>
							
							<div id="paymentList">
								<table summary="결제 리스트">
									<thead>
										<tr>
											<th>주문번호</th>
											<th data-value="mvPaymentId" class="order text-center col-md-1">결제번호</th>
											<th>회원번호</th>
											<th>회원이름</th>
											<th>영화제목</th>
											<th>상영날짜</th>
											<th>인원수</th>
											<th>결제금액</th>
											<th>결제날짜</th>
											<th>결제상태</th>
											<th>결제관리</th>
										</tr>
									</thead>
									<tbody id="list">
										<c:choose>
											<c:when test="${not empty order}">
												<c:forEach var="order" items="${order}" varStatus="status">
							<%-- <form id="hidden" name="hidden" action="/admin/paymentCancel" method="post">
								<input type="hidden" id="mvPaymentId" name="mvPaymentId" value="${order.mvPaymentId}"/>
								<input type="hidden" id="mvPayStatus" name="mvPayStatus" value="${order.mvPayStatus}"/> 
								<input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum}">
							</form> --%>
													<tr class="text-center" data-num="${order.mvPaymentId}">
														<td>${order.mvOrderId}</td>
														<td>${order.mvPaymentId }</td>
														<td>${order.userNo}</td>
														<td>${order.userName}</td>
														<td>${order.mvTitle}</td>
														<td>${order.selectedDate}</td>
														<td>${order.mvHeadcnt}</td>
														<td>${order.mvPrice}</td>
														<td>${order.mvOrderDate}</td>
													<%-- 	<td><c:if test="${order.mvPayStatus == 1}">결제완료
														</c:if><c:if test="${order.mvPayStatus == 2}">취소</c:if></td>
														<td><c:if test="${order.mvPayStatus == 1 }">
															<span data-num="${order.mvPaymentId}"
																data-hidden="${order.mvPayStatus}"
																class="hiddenBtn text-center" style="color: red;">결제취소</span>
															</c:if></td> --%>
														<td>
                                            <c:choose>
                                                <c:when test="${order.mvPayStatus eq 1}">
                                                    결제 완료
                                                </c:when>
                                                <c:when test="${order.mvPayStatus eq 2}">
                                                <span class="cancelled-payment">결제 취소</span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.mvPayStatus eq 1}">
                                                	<span class="hiddenBtn text-center" style="color: red;" onclick="fn_cancel('${order.mvPaymentId}')">결제취소</span>
                                                </c:when>
                                                <c:when test="${order.mvPayStatus eq 2}">
                                                </c:when>
                                            </c:choose>
                                        </td>
														
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="10" class="tac text-center">결제내역이 없습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
								</div>
								</form>
						
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
<script>
    // 취소
    function fn_cancel(id) {
        if (confirm("취소하시겠습니까?")) {
            $("#mvPaymentId").val(id);
            $("#frm").attr("action", "/admin/paymentCancel");
            $("#frm").submit();
        }
    }

    function toggleSelected(rowElement) {
        rowElement.classList.toggle('selected');
    }
</script>
