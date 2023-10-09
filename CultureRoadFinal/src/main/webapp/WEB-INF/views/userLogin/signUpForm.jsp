<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>

	<style>
	.contain {
		display: flex;
		justify-content: center; /* 수평 가운데 정렬 */
	}
	
	.logo {
		margin: 20px auto 0px auto;
	}
	
	button {
		margin-top : 5px;
		justify-content: center; /* 수평 가운데 정렬 */
	}	
	</style>
	<script type="text/javascript">
	  let idCheckPassed = false;
      let pwCheckPassed = false;
      let emailCheckPassed = false;
      let phoneCheckPassed = false;
		
      function isUserIdValid(userId) {
		    let regex = /^[a-z0-9]{6,15}$/;
		    
		    if (regex.test(userId)) {
		        // 유효성 검사 통과
		        $.ajax({
		            url: "/userLogin/idChk",
		            type: "post",
		            dataType: "text",
		            data: {
		                userId: userId
		            },
		            success: function(result) {
		                if (result === "사용가능") { // === 연산자 사용
		                    alert("사용할 수 있는 아이디 입니다.");
		                	idCheckPassed = true;
		                } else {
		                    alert("이미 존재하는 아이디입니다. 영어 소문자, 숫자를 조합하여 6~15자 내외로 입력하세요.");
		                    $("#userId").val("");
			                $("#userId").focus();
		                }
		            },
		            error: function(xhr, textStatus, errorThrown) {
		                alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
		            }
		        });
		    } else {
		        alert("영어 소문자와 숫자를 조합하여 6~15자리 사이로 입력하세요.");
		    }
		}
	 
	function isUserPwValid(userPw, userPwConfirm) {
		let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!])[A-Za-z\d@#$%^&+=!]{9,20}$/;
		     
		if (regex.test(userPw)) {
		// 유효성 검사 통과
			if(userPw == userPwConfirm){
				$("#msg1").text("적합한 비밀번호입니다.");
				pwCheckPassed = true;	
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
					},
			success : function(response){
				console.log(response.statusName);
				if(response.statusName == "success"){
					$("#phoneConfirm").unbind("click").bind("click", function(){
						console.log(response.createSmsKey);
						let phoneChkText = $("#phoneChkText").val();
						phoneCheckPassed = false;
						$("#phoneChkText").val("");
						if(response.createSmsKey === phoneChkText) {
							alert("전화번호 인증 성공");
							phoneCheckPassed = true;
						}else {
							alert("인증번호가 틀렸습니다.");
						}
					});
				}
			}
		})
	}
	 
		$(function() {
		    $("#idChk").click(function() {
		        let userId = $("#userId").val();
		        isUserIdValid(userId); 
		    });
		    
		    $("#pwChk").click(function(){
	             let userPw = $("#userPw").val();
	             let userPwConfirm = $("#userPwConfirm").val();
	             isUserPwValid(userPw, userPwConfirm);
	          });
		    
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
			
			$("#confirmBtn").click(function(){
				if(!chkData("#userName","이름을")) return;
	            else if(!chkData("#userId","아이디를")) return;
	            else if(!chkData("#userPw","비밀번호를")) return;
	            else if(!chkData("#userPwConfirm","비밀번호 확인을")) return;
	            else if(!chkData("#userEmail","이메일을")) return;
	            else if(!chkData("#userPhone","핸드폰번호를")) return;
	            else if(!chkData("#userBirth","생년월일을")) return;
				else{
					if(idCheckPassed && pwCheckPassed && emailCheckPassed && phoneCheckPassed) {
						$("#signUpForm").attr({
							"method" : "post",
							"action" : "/userLogin/signUp"
						});
						$("#signUpForm").submit();
							randomString ="";
							phoneChkText ="";
					} else {
						alert("중복체크가 완료되지 않았습니다.");
					}	
				}
			});
		}); 
		
	</script>
	</head>
	<body>
		<div class="contain">
			<div class="col-md-6 grid-margin stretch-card">
               <div class="card">
                <div class="logo">
				<img src="/resources/main/image/cultureLogo.jpg">
				</div>
                  <div class="card-body">
                    <h1 class="card-title">회원가입</h1>
                    <form class="forms-sample">
                    	<input type="hidden" id="to" name="to" />
                      <div class="form-group row">
                        <label for="exampleInputUsername2" class="col-sm-3 col-form-label">이름</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="userName" name="userName">
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">아이디</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="userId" name="userId" />
                        </div>
                        <div class="col-sm-3">
                        <button type="button" id="idChk" name="idChk" class="btn btn-outline-success btn-fw">중복확인</button>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">비밀번호</label>
                        <div class="col-sm-6">
                          <input type="password" class="form-control" id="userPw" name="userPw" maxlength="20"/>
                        </div>
                        <div class="col-sm-3">
                        </div>
                       <!-- </div>
                       <div class="form-group row"> -->
                        <label for="exampleInputPassword2" class="col-sm-3 col-form-label">비밀번호 확인</label>
                        <div class="col-sm-6">
                          <input type="password" class="form-control" id="userPwConfirm" name="userPwConfirm" maxlength="20"/>
                        </div>  
                        <div class="col-sm-3">
                         <button type="button" id="pwChk" name="pwChk" class="btn btn-outline-success btn-fw">비밀번호 확인</button>
                        </div>
                        	<span id="msg1"></span>
                      </div>
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">이메일</label>
                        <div class="col-sm-6">
                          <input type="email" class="form-control" id="userEmail" name="userEmail" />
                        </div>
                        <div class="col-sm-3">
                          <button type="button" id="sendEmail" name="sendEmail" class="btn btn-outline-success btn-fw">인증요청</button>
                        </div>
                	 
                        <label for="exampleInputEmail2"class="col-sm-3 col-form-label">인증코드 입력</label>
                        <div class="col-sm-6">
                          <input type="email" class="form-control" id="emailChkText" name="emailChkText" />
                        </div>
                        <div class="col-sm-3">
                        <button type="button" id="emailConfirm" name="emailConfirm" class="btn btn-outline-success btn-fw">인증확인</button>
                        </div>
                      </div>
                     
                      <div class="form-group row">
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">전화번호</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="userPhone" name="userPhone"/>
                        </div>
                        <div class="col-sm-3">
                          <button type="button" id="phoneChk" name="phoneChk" class="btn btn-outline-success btn-fw">인증요청</button>
                        </div>
                        <label for="exampleInputMobile" class="col-sm-3 col-form-label">인증코드 입력</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="phoneChkText" name="phoneChkText"/>
                        </div>
                        <div class="col-sm-3">
                          <button type="button" id="phoneConfirm" name="phoneConfirm" class="btn btn-outline-success btn-fw">인증확인</button>
                        </div>
                      </div>
                      <div class="form-group row">
                        <label for="exampleInputEmail2" class="col-sm-3 col-form-label">생년월일</label>
                        <div class="col-sm-6">
                          <input type="text" class="form-control" id="userBirth" name="userBirth" placeholder="000101 형식으로 입력하세요" maxlength="6" />
                        </div>
                      </div>                  
                      <button type="button" class="btn btn-inverse-primary btn-fw" id="confirmBtn" name="confirmBtn">회원가입</button>
                      <button type="button" class="btn btn-inverse-light btn-fw" id="cancelBtn" name="cancelBtn">취소</button>
                    </form>
                  </div>
                </div>
              </div>
		</div>
	</body>
</html>

			