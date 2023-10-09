<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>
	<script type="text/javascript">
		function resetData(){
			$("#managerId").val("");
			$("#managerPw").val("");
			$("#managerId").focus();
		}
	
		$(function(){
			$("#loginBtn").click(function(){
				let managerId = $("#managerId").val();
				let managerPw = $("#managerPw").val();
					$.ajax({
						type : "post",
						url : "/admin/login",
						data : {managerId : managerId, managerPw : managerPw},
						success : function(result) {
							if(result === "1") {
								$("#loginForm").attr({
									method : "post",
									action : "/admin/loginProcess"
								})
								$("#loginForm").submit();
								} else {
								alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
								resetData();
							}
						}, error : function(){
							alert("서버오류");
						}
					});
				})
		})
	</script>
	<style>
		.logo {
			display: flex;
			justify-content: center; /* 수평 가운데 정렬 */
		}
		
		.button {
			text-align: center;
		}
</style>
	</head>
	<body>
	<div>
		<c:if test="${empty adminLogin}">
			<div class="container-scroller">
				<div class="container-fluid page-body-wrapper full-page-wrapper">
					<div class="content-wrapper d-flex align-items-center auth">
						<div class="row flex-grow">
							<div class="col-lg-4 mx-auto">
								<div class="auth-form-light text-left p-5">
									<!--  <h4>Hello! let's get started</h4>
								                <h6 class="font-weight-light">Sign in to continue.</h6> -->
									<div class="logo">
										<img src="/resources/main/image/cultureLogo.jpg"
											style="width: 50%;">
									</div>
									<form id="loginForm" class="pt-6">
										<h1>관리자 로그인</h1>
										<div class="form-group">
											<label>아이디</label> 
											<input type="text" name="managerId" id="managerId" class="form-control form-control-lg"
												placeholder="아이디">
										</div>
										<div class="form-group">
											<label>비밀번호</label> 
											<input type="password" name="managerPw"
												id="managerPw" class="form-control form-control-lg"
												placeholder="비밀번호">
										</div>
										<div class="mt-3">
											<button type="button" class="btn btn-primary me-2"
												id="loginBtn" name="loginBtn">로그인</button>
											<button type="button" class="btn btn-light" id="cancelBtn"
												name="cancelBtn">취소</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${not empty adminLogin}">
			<a href="/admin/main" class="btn-success">관리자 페이지</a>
		</c:if>
	</div>
	</body>
</html>