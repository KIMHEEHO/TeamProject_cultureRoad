<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>
	<script type="text/javascript">
	let pwCheckPassed = false;
    let emailCheckPassed = false;
    let phoneCheckPassed = false;
    
	function isUserPwValid(userPw, userPwConfirm) {
		let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{9,20}$/;
		
		if (regex.test(userPw)) {
		// 유효성 검사 통과
			if(userPw == userPwConfirm){
				$("#msg1").text("적합한 비밀번호입니다.");
					pwCheckPassed = true;	
					console.log(pwCheckPassed.toString());
				} else {
					$("#msg1").text("입력된 비밀번호가 같지 않습니다.").css("color", "red");
					$("#userPw").val("");
					$("#userPwConfirm").val("");
					$("#userPw").focus();
				}     
		} else {
			$("#msg1").text("사용할 수 없는 비밀번호 입니다. 소문자, 대문자, 숫자, 특수문자를 조합하여 9~20자 내외로 입력하세요.").css("color", "red");
			$("#userPw").val(""); // 비밀번호 필드를 비웁니다.
			$("#userPwConfirm").val("");
			$("#userPw").focus();
		}
	}
	
	 function isUserEmailValid(userEmail) {
		 $.ajax({
			url: "/userLogin/sendRandomString",
			type: "post",
			dataType: "text",
			data: {
				userEmail: userEmail
			},success : function(randomString) {
				if(userEmail!=""){
					//서버로부터 받은 응답을 처리
					console.log(randomString);
					alert("인증번호가 발송되었습니다.");
					emailCheckPassed = false;
					$("#emailConfirm").click(function(){
						console.log($("#emailChkText").val());
						if($("#emailChkText").val() === randomString){
							alert("인증되었습니다.");
							emailCheckPassed = true;
						}else{
							alert("인증번호를 다시 입력해 주세요.");
						}
						console.log("randomString:" + randomString + "사용자 입력값 : " + $("#emailChkText").val());
					})
				}	
			}, error : function(){
				alert("이메일을 정확하게 입력해 주세요.");
			}
		})
	}
	 
	function phoneConfirm(to){
		$.ajax({
			url : "/sms/send",
			type : "post",
			data : {
				to : to 
			},success : function(response){
				console.log(response.statusName);
				if(response.statusName == "success"){
					$("#phoneConfirm").click(function(){
						console.log(response.createSmsKey);
						let phoneChkText = $("#phoneChkText").val();
						if(response.createSmsKey === phoneChkText) {
							phoneCheckPassed = true;
							alert("전화번호 인증 성공");
							phoneCheckPassed = true;
						}else {
							alert("인증번호가 틀렸습니다.");	
							$("#phoneChkText").val("");
						}
					})
				}
			}
		})
	}	
	
	$(function(){
		
	    $("#sendEmail").click(function(){
			let userEmail = $("#userEmail").val();	//사용자가 입력한 이메일 
	    	isUserEmailValid(userEmail);
	    });
	   
	    $("#phoneChk").click(function(){
	    	let to = $("#userPhone").val();
	    	phoneConfirm(to);
	    });
	    	
		$("#cancelBtn").click(function(){
			location.href="/userLogin/main";
		});
		
		$("#pwChk").click(function(){
			let userPw = $("#userPw").val();
		    let userPwConfirm = $("#userPwConfirm").val();
		    // 비밀번호 유효성 검사
		    if (userPw.length > 0) {
		    	isUserPwValid(userPw, userPwConfirm);
				if (!pwCheckPassed) {
					alert("비밀번호를 다시 확인해 주세요.");
					return; // 유효성 검사 실패 시 함수 종료
					}
		        }
		})
		
		$("#updateMyPageBtn").on("click", () => {
		        // 이메일 또는 핸드폰 인증이 완료되었는지 확인
			if (pwCheckPassed || emailCheckPassed || phoneCheckPassed) {
		            // 폼 제출
				$("#myPageForm").attr({
					"method": "post",
					"action": "/userLogin/updateMyPage"
				});
				$("#myPageForm").submit();
			} else {
				alert("비밀번호, 이메일 또는 핸드폰 인증이 완료되지 않았습니다.");
		        }
		    });
	});//$함수 종료
			

	</script>
	
	<style>
		 .row{
			display: flex;
			justify-content: center; /* 수평 가운데 정렬 */
		} 
		.logo{
			margin : 0px auto;
			width: 20%;
		}
		
		table {
			text-align : center;
		}
		
		button {

			justify-content: center; /* 수평 가운데 정렬 */
		}
		
		input {
		  width: 350px;
		  height: 32px;
		  font-size: 15px;
		  border: 0;
		  border-radius: 15px;
		  outline: none;
		  padding-left: 10px;
		  background-color: rgb(233, 233, 233);
		}

	</style>
	</head>
	<body>
		<div class="container">
			<div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
			</div>
			<c:if test="${empty userLogin}">
				<form class="form-signin" id="loginForm">
				<h1>로그인을 해주세용</h1>
				</form>
			</c:if>
			<c:if test = "${not empty userLogin}">
				<div class="row">
					<div class="col-lg-6 grid-margin stretch-card">
						<div class="card">
							<div class="card-body">
								<h1 class="card-title">My Page</h1>
									<br />
									<form id="myPageForm">
                    				<table class="table">
										<tr>
											<td>이름</td>
											<td>${userLogin.userName}<input type="hidden" id="userId" name="userId" value="${userLogin.userId}" /></td> 
											<td></td>
				                        </tr>
                        				<tr>
					                        <td>아이디</td>
					                        <td>${userLogin.userId}</td>
					                        <td></td>
				                     	</tr>
				                     	<tr>
											<td>비밀번호</td>
											<td><input type="password" id="userPw" name="userPw" maxlength="20" /></td> 
				                        	<td></td>
				                        </tr>
                        				<tr>
					                        <td>비밀번호 확인</td>
					                        <td><input type="password" id="userPwConfirm" name="userPwConfirm" maxlength="20" /></td>
					                       <td><button type="button" id="pwChk" name ="pwChk" class="btn btn-link">비밀번호 확인</button></td>
				                     	</tr>
				                     	<tr><td colspan="3" id="msg1"><!-- <input type="hidden" id="msg1"> --></td></tr>
				                     	<tr>
											<td>이메일</td>
											<td><input type="email" id="userEmail" name="userEmail"></td>
											<td><button type="button" id="sendEmail" name="semdEmail" class="btn btn-link">인증요청</button></td> 
				                        </tr>
                        				<tr>
					                        <td>인증코드 입력</td>
					                        <td><input type="text" id="emailChkText" name="emailChkText"></td>
					                        <td><button type="button" id="emailConfirm" name="emailConfirm" class="btn btn-link">인증확인</button>
				                     	</tr>
				                     	<tr>
				                     		<td>전화번호</td>
				                     		<td><input type="text" id="userPhone" name="userPhone"></td>
				                     		<td><button type="button" id="phoneChk" name="phoneChk" class="btn btn-link">인증요청</button></td>
				                     	</tr>
				                     	<tr>
				                     		<td>인증코드 입력</td>
				                     		<td><input type="text" id="phoneChkText" name="phoneChkText"></td>
				                     		<td><button type="button" id="phoneConfirm" name="phoneConfirm" class="btn btn-link">인증확인</button></td>
				                     	</tr>
				                     	<tr>
				                     		<td>생년월일</td>
				                     		<td>${userLogin.userBirth }</td>
				                     		<td></td>
				                     	</tr>
				                     	<tr>
				                     		<td>가입일</td>
				                     		<td>${userLogin.userDate }</td>
				                     		<td></td>
				                     	</tr>
				                     	<tr>
				                     	<td colspan="3">
				                     	<button type="button" id="updateMyPageBtn" name="updateMyPageBtn" class="btn btn-success">수정 완료</button>
				                     	<button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-link">메인페이지로</button>
				                     	</td>
										</tr>
										
									</table>
									</form>
								</div>
							</div>
						</div>
					</div>
				
			</c:if> 
		</div>	
</html>