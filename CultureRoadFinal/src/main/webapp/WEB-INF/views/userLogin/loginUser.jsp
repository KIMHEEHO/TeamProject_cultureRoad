<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>
<script type="text/javascript">
	
	function resetData(){
		$("#userId").val("");
		$("#userPw").val("");
		$("#userId").focus();
	}
	
	$(function(){
		$("#loginBtn").click(function(){
			let userPw = $("#userPw").val();
			let userId = $("#userId").val();
				$.ajax({
					type : "post",
					url : "/userLogin/login",
					data : {userPw : userPw, userId : userId},
					success : function(result) {
						if(result === "3") {
							$("#loginForm").attr({
								method : "post",
								action : "/userLogin/loginProcess"
							})
							$("#loginForm").submit();
							}else if(result === "2") {
							alert("탈퇴한 회원입니다. 새로운 계정으로 로그인 해주세요.");
							resetData();
						} else {
							alert("아이디 또는 비밀번호를 잘못 입력하셨습니다.");
							resetData();
						}
					}, error : function(){
						alert("서버오류");
					}
				});
			})
				
		/* $("#signUpBtn").click(function(){
			location.href="/userLogin/signUpForm"
		}); */
		
		$("#findIdBtn").click(function(){
			location.href="/userLogin/findIdSelect"
		});
		
		$("#cancelBtn").click(function(){
			location.href="/userLogin/main"
		});
		
		
		$("#findPwdBtn").click(function(){
			location.href="/userLogin/findPwSelect"
		})
		
		$("#logoutBtn").click(function(){
			location.href = "/userLogin/logout"
		});
		$("#myPageBtn").click(function(){
			location.href = "/userLogin/myPage"
		});
		
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
<%-- <jsp:include page="../common/nav.jsp"/> --%>
	<div>
		<c:if test="${empty userLogin}">
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
										<div class="form-group">
											<label>아이디</label> <input type="text" name="userId"
												id="userId" class="form-control form-control-lg"
												placeholder="아이디">
										</div>
										<div class="form-group">
											<label>비밀번호</label> <input type="password" name="userPw"
												id="userPw" class="form-control form-control-lg"
												placeholder="비밀번호">
										</div>
										<div class="mt-3">
											<button type="button" class="btn btn-success me-2"
												id="loginBtn" name="loginBtn">로그인</button>
											<button type="button" class="btn btn-light" id="cancelBtn"
												name="cancelBtn">취소</button>
										</div>
										<div class="text-center mt-4 font-weight-light"> 계정이 없으신가요? 
											<a href="/userLogin/signUpForm" class="text-primary">회원가입</a>
										</div>
										<div class="button">
											<button type="button" class="btn btn-outline-info btn-fw"
												id="findIdBtn" name="findIdBtn">아이디 찾기</button>
											<button type="button" class="btn btn-outline-info btn-fw"
												id="findPwdBtn" name="findPwdBtn">비밀번호 찾기</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
	<jsp:include page="../mainTemplate/footer.jsp" />
	<!-- content-wrapper ends -->
	</div>
	<!-- page-body-wrapper ends -->
	</div>
	<!-- container-scroller -->
	<!-- plugins:js -->
	<script
		src="resources/adminMain/assets/vendors/js/vendor.bundle.base.js"></script>
	<!-- endinject -->
	<!-- Plugin js for this page -->
	<!-- End plugin js for this page -->
	<!-- inject:js -->
	<script src="resources/adminMain/assets/js/off-canvas.js"></script>
	<script src="resources/adminMain/assets/js/hoverable-collapse.js"></script>
	<script src="resources/adminMain/assets/js/misc.js"></script>
	<!-- endinject -->
</body>
</html>