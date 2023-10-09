<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<script type="text/javascript">
		$(function(){
			$("#findIdEmail").click(function(){
				location.href="/userLogin/findIdEmailForm";
			})
			
			$("#findIdPhone").click(function(){
				location.href="/userLogin/findIdPhoneForm";
			})
		})	
	</script>
	<style>
		.logo{
				margin : 50px auto;
				width: 20%;
			}
		
		form {
		    position: absolute;
		    top: 250px;
		    left: 50%; 
		    transform: translate(-50%, -50%); 
		}
		
		
	</style>
	</head>
<body>
	<div class="container">
		<div class="logo">
			<img src="/resources/main/image/cultureLogo.jpg">
		</div>
		<form>
			<h5 class="card-title">아이디 찾기 방법을 선택하세요.</h5>
			<button type="button" id="findIdEmail" class="btn btn-outline-secondary btn-fw" >이메일로 찾기</button>
			<button type="button" id="findIdPhone" class="btn btn-outline-secondary btn-fw">전화번호로 찾기</button>
		</form>
	</div>
</body>
</html>