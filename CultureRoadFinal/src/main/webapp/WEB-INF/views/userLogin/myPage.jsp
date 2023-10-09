<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

	<script type="text/javascript">
		$(function(){
			$("#updateMyPageBtn").click(function(){
				location.href="/userLogin/enterPw";
			})
			$("#deleteAccountBtn").click(function(){
				location.href="/userLogin/enterPw2";
			})
			$("#mainPageBtn").click(function(){
				location.href="/userLogin/main";
			})
			$("#myOrderListBtn").click(function(){
				location.href="/userLogin/myOrderList";
			})
		})
	</script>
	
	<style>
		 .row{
			display: flex;
			justify-content: center; /* 수평 가운데 정렬 */
		} 
		.logo{
			margin : 50px auto;
			width: 20%;
		}
		
		table {
			text-align : center;
		}
		
		button {
			margin : 10px;
		}

	</style>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg" >
			</div>
			<div>
			<c:if test = "${not empty userLogin}"> 
			<div class="row" id="myPage" >
              <div class="col-lg-6 grid-margin stretch-card" >
                <div class="card">
                  <div class="card-body">
                    <h1 class="card-title">My Page</h1>
                    <br />
                    <table class="table">
                        <tr>
                          <td>이름</td>
                          <td>${userLogin.userName}</td>
                        </tr>
                        <tr>
                          <td>아이디</td>
                          <td>${userLogin.userId}</td>
                        </tr>
                        <tr>
                          <td>이메일</td>
                          <td>${userLogin.userEmail}</td>
                        </tr>
                        <tr>
                          <td>전화번호</td>
                          <td>${userLogin.userPhone}</td>
                        </tr>
                        <tr>
                          <td>생년월일</td>
                          <td>${userLogin.userBirth }</td>
                        </tr>
                         <tr>
                          <td>가입일</td>
                          <td>${userLogin.userDate}</td>
                        </tr>
                    </table>
						
	                    <button type="button" id="updateMyPageBtn" name="updateMyPageBtn" class="btn btn-success">정보 수정</button>
						<button type="button" id="myOrderListBtn" name="myOrderListBtn" class="btn btn-success">나의 예매내역</button>
						<button type="button" id="mainPageBtn" name="mainPageBtn" class="btn btn-success">메인페이지로</button>		
						<button type="button" id="deleteAccountBtn" name="deleteAccountBtn" class="btn btn-dark">회원탈퇴</button>
                  </div>
                </div>
              </div>
             </div>
					
			</c:if>
			</div>	
		</div>		
	</body>
</html>