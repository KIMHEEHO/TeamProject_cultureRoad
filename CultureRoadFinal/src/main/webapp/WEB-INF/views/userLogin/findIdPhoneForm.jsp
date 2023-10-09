<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf" %>
	<script type="text/javascript">
	
	function phoneConfirm(to){
		$.ajax({
			url : "/sms/send",
			type : "post",
			data : {
				to : to 
					},
			success : function(response){
				console.log(response.statusName);
				if(response.statusName == "success"){
					$("#phoneConfirm").unbind("click").bind("click", function(){
						console.log(response.createSmsKey);
						let phoneChkText = $("#phoneChkText").val();
						phoneCheckPassed = false;
						if(response.createSmsKey === phoneChkText) {
							alert("전화번호 인증 성공");
							phoneCheckPassed = true;
							$("#findIdPhoneForm").attr({
	        					"method" : "post",
	        					"action" : "/userLogin/userIdInfoPhone"
	        				})
	        				$("#findIdPhoneForm").submit();
						}else {
							alert("인증번호가 틀렸습니다.");
						}
					});
				}
			}
		})
	}
	
	$(function(){
		$("#phoneConfirmForm").hide();
			
		$("#findIdPnBtn").click(function(){
			if(!chkData("#userName","이름을")) return;
            else if(!chkData("#userPhone","전화번호를")) return;
            else if(!chkData("#userBirth","생년월일을")) return;
			else{
				let userName = $("#userName").val();
				let userBirth = $("#userBirth").val();
				let userPhone = $("#userPhone").val();	
				$.ajax({
					url : "/userLogin/personalInfoPhone",
					type : "post",
					dataType : "text",
					data : {
						userName : userName, userBirth : userBirth, userPhone : userPhone
					},
					success : function(result) {
						if(result === "같다") {
							alert("회원정보가 일치합니다. 인증요청 버튼을 눌러주세요.");
							$("#phoneConfirmForm").show();
						} else {
							alert("회원정보가 일치하지 않습니다.");
						}
					}, error : function() {
						alert("서버 오류");
					}
				});	//ajax 끝
			}
		});	//findIdEmBtn 눌렀을 때
		
		$("#cancelBtn").click(function(){
			location.href="/userLogin/loginUser";
		});	//취소버튼 누르면 다시 로그인창으로 갈 수 있게
		
		$("#sendPhone").click(function(){		//인증확인 ㅂ
	    	let to = $("#userPhone").val();	//사용자가 입력한 이메일 
	    	phoneConfirm(to);
	    });
	}) //$(function(){})함수 끝
	
	</script>

	<style>
		.logo{
				margin : 0% 20%;
				width: 20%;
			}
		button {
			display: flex;
		  align-items: center;
		}
		
	</style>
	</head>
	<body>
		<div class="container-scroller">
      		<div class="container-fluid page-body-wrapper full-page-wrapper">
		        <div class="content-wrapper d-flex align-items-center auth">
		          <div class="row flex-grow">
		            <div class="col-lg-4 mx-auto">
		              <div class="auth-form-light text-left p-5">
					<div class="logo">
						<img src="/resources/main/image/cultureLogo.jpg">
					</div>
		                <form class="pt-3" id="findIdPhoneForm">
		                  <div class="form-group">
		                  	<label>이름</label>
		                    <input type="text" class="form-control form-control-lg" id="userName" name="userName" >
		                  </div>
		                  <div class="form-group">
		                  	<label>생년월일</label>
		                    <input type="text" class="form-control form-control-lg" id="userBirth" name="userBirth">
		                  </div>
		                  <div class="form-group">
		                  	<label>핸드폰번호</label>
		                    <input type="text" class="form-control form-control-lg" id="userPhone" name="userPhone" placeholder="가입시 등록한 핸드폰번호를 입력하세요">
		                  </div>
		                  <button type="button" id="findIdPnBtn" name="findIdPnBtn" class="btn btn-success">확인</button>
						  <button type="button" id="cancelBtn" name="cancelBtn" class="btn btn-light">취소</button>
						  </form>
						  <form id="phoneConfirmForm">
						  	<br />
							<button type="button" id="sendPhone" name="sendPhone" class="btn btn-success">인증 요청</button>
							<label>인증코드 입력</label>
							<br />
							<input type="text" id="phoneChkText" name = "phoneChkText" />
							<button type="button" id="phoneConfirm" name ="phoneConfirm" class="btn btn-success">인증 확인</button>
						  </form>       
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div> 
	</body>
</html>