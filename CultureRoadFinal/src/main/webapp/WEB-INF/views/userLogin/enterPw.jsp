<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
	$(function(){
		$("#enterPwBtn").click(function(){
			let userPw = $("#userPw").val();
			let userId = $("#userId").val();
				$.ajax({
					type : "post",
					url : "/userLogin/pwChk",
					data : {userPw : userPw, userId : userId},
					success : function(result) {
						if(result === "같다") {
							$("#pwEnterForm").attr({
								method : "post",
								action : "/userLogin/updateMyPageForm"
							})
							$("#pwEnterForm").submit();
							}else {
							alert("비밀번호를 다시 입력하세요.")
							$("#userPw").val("");
							$("#userPw").focus();
						}
					}, error : function(){
						alert("서버오류");
					}
				});
		});
		
		$("#cancelBtn").click(function(){
			location.href="/userLogin/myPage"
			});
	})
		
	</script>
	
	<style>
		.container {
		   /*  position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%); */
		    margin: 150px 40%;
		}
		.logo{
		width : 20%;
		}
		input {
		  width: 250px;
		  height: 32px;
		  font-size: 15px;
		  border: 0;
		  border-radius: 15px;
		  outline: none;
		  padding-left: 10px; 
		  background-color: rgb(233, 233, 233);
		}
		button {
			margin : 20px 30px;
		}
		
	</style>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<form id="pwEnterForm">
				<input type="hidden" id="userId" name="userId" value="${userLogin.userId}">
				<input type="password" id="userPw" name="userPw" placeholder="비밀번호를 입력하세요">
				<br />
				<button type="button" id="enterPwBtn" name="enterPwBtn" class="btn btn-outline-warning btn-fw">확인</button>
				<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-light" class="btn btn-outline-dark btn-fw">취소</button>
			</form>

		</div>		
	</body>
</html>