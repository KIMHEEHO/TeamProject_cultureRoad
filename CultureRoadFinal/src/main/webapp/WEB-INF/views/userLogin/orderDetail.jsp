<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="/resources/main/css/payment.css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
<script>
    // 이미지 저장
    function takeScreenshot() {
    	//히든
        document.querySelector(".modern-button").classList.add("hidden");

        html2canvas(document.querySelector(".container-wrap")).then(function(canvas) {
            // Canvas 이미지를 데이터 URL로 변환
            var screenshot = canvas.toDataURL("image/png");
            
            // 이미지 다운로드
            var link = document.createElement("a");
            link.href = screenshot;
            link.download = "ticket.png";
            link.click();
            //저장후 히든해제
            document.querySelector(".modern-button").classList.remove("hidden");

        });
    }
</script>


<style>
</style>
</head>

<body>
	<c:if test="${empty userLogin}">
		<script type="text/javascript">
			$(document).ready(function() {
				let userNo = ${userLogin.userNo};
				alert("로그인 후에 결제 내역을 확인할 수 있습니다.");
				window.location.href = "/user/loginUser"; // 로그인 페이지 URL로 변경
				console.log(userNo);
			})
		</script>
	</c:if>
	<!-- 배경색 그라데이션:bg01 / 배경색 연회색:bg02 bg3컬러변경 bg4 -->
<div class="container-wrap">
		<div class="hide-on-screenshot">
			숨길 내용
		</div>

		<div class="container">
			<div class="top-area text-end">
			
		<button  class="btn btn-outline-info btn-fw" onclick="takeScreenshot()">티켓 저장</button> 
<!-- 				<p class="">
					<i class="fas fa-receipt"></i> <span>예매내역</span>
				</p> -->
			</div>
			<form method="post" id="frm">
				<input type="hidden" id="id" name="id" value="${movie.id}" />

				<%--  <input type="hidden" id="title" name="title" value="${movie.title}" /> --%>
				<c:forEach items="${orderDetails}" var="orderDetails">
					<div class="card">
						<div class="card-header">
							<img src="/resources/main/image/cultureLogo.jpg" alt="logo"
								class="centered-image">
							<p class="title">예매정보</p>
							<!-- 포스터 이미지 추가 -->
							<div class="poster">
								<!--             <img src="/resources/main/image/Moving.jpg" alt="movie"> -->
							</div>
							<p class="text">${orderDetails.mvTitle }</p>
							<input type="hidden" id="mvPaymentId" name="mvPaymentId"
								value=${orderDetails.mvPaymentId}>
						</div>

						<div class="card-body">


							<table class="table">
								<tbody>
									<!-- 라인 추가 -->
									<tr class="line"></tr>
									<tr>
										<th scope="row">주문ID</th>
										<td>000000${orderDetails.mvOrderId}</td>
									</tr>
									<tr>
										<th scope="row">회원아이디</th>
										<td>${userLogin.userId}</td>
									</tr>
									<tr>
										<th scope="row">인원수</th>
										<td>${orderDetails.mvHeadcnt}명</td>
									</tr>
									<tr class="line"></tr>

									<tr>
										<th scope="row">금액</th>
										<fmt:parseNumber value="${orderDetails.mvHeadcnt}"
											var="mvHeadCnt" />
										<fmt:parseNumber value="${orderDetails.mvPrice}" var="mvPrice" />
										<td>${mvPrice * mvHeadCnt}원</td>
									</tr>

									<tr>
										<th scope="row">상영날짜</th>
										<td>${orderDetails.selectedDate}</td>
									</tr>
									<tr>
										<th scope="row">결제날짜</th>
										<td>${orderDetails.mvOrderDate}</td>
									</tr>

									<tr>
										<th scope="row">상태</th>
										<td class="bold"><c:choose>
												<c:when test="${orderDetails.mvPayStatus eq 1}">결제 완료</c:when>
												<c:when test="${orderDetails.mvPayStatus eq 2}">
													<span style="color: red;">결제 취소</span>
												</c:when>
											</c:choose></td>
									</tr>

									<tr class="line"></tr>
								</tbody>
							</table>


							<p class="info text-center">Thank you</p>


							<c:if test="${orderDetails.mvPayStatus eq 1}">
								<div class="text-center mt-4 mb-4">
									<button id="cancelPaymentBtn_${orderDetails.mvPaymentId}"
										class="btn btn-danger" type="button"
										onclick="fn_cancel('${orderDetails.mvPaymentId}')">
										<i class="fas fa-times-circle"></i> 결제 취소
									</button>
								</div>
							</c:if>


						</div>
						<!-- card-body END -->
					</div>
					<!-- card END -->
				</c:forEach>
			</form>
		</div>
		<!-- container END -->
	</div>
	<!-- container-wrap END -->


<!-- 	<script>
		// 취소
		function fn_cancel(id) {
			if (confirm("취소하시겠습니까?")) {
				$("#cancelPaymentBtn_" + id).val(id);
				$("#frm").attr("action", "/payment/cancel");
				$("#frm").submit();
			}
		}
		
	</script> -->
	
	<script>
    // 취소
    function fn_cancel(id) {
        if (confirm("취소하시겠습니까?")) {
            $("#mvPaymentId").val(id);
            $("#frm").attr("action", "/payment/cancel");
            $("#frm").submit();
        }
    }

    function toggleSelected(rowElement) {
        rowElement.classList.toggle('selected');
    }
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
</body>
</html>
