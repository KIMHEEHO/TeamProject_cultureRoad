<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!-- 
<style>
	
	
	
	.main-panel{
		margin-top:100px !important;
		width:100%;
		margin:auto;
		background-color:white;	
	}

	.paging {
	  font-size:15px;
	  margin-right:15px;
	  color:black;
	}

  .a { 
   overflow-wrap: break-word; 
    margin-left: 30px; 
    margin-right: 100px; 
    height: 50px; /* 허용할 최대 높이 */ 
    overflow: hidden; /* 초과하는 내용을 숨김 */ 
    text-overflow: ellipsis; /* 텍스트 끝에 생략 부호 (...) 표시 */ 
    white-space: nowrap; 
 } 

	#q::before {
	   margin-left: 80px;
	   margin-right: 20px;
	   float: left;
	   content: "Q";
	   font-weight: bold;
	    color: rgb(180, 180, 250); 
	   font-size: 27px;
	}
	
	#a::before {
	   float: left;
	   content: "↳A";
	   font-weight: bold;
	    color: #575A7B; 
	   font-size: 27px;
	}
	
	tr.answer td {
	   max-width: 300px;
	   padding: 20px;
	   overflow-wrap: break-word;
	   height: 120px;
	}

/********************************************************************/


	#qformBtn{
		font-size:13px;
	}


	#delBtn,#upBtn{
		border:none;
/* 		background-color:#575A7B; */
		color:black;
		font-size:5px;
	} 
	
	table {
	width:1000px;
	background-color:white;
	border: 1px #212741 solid;
	font-size: 11px;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	text-align : center; 
	
	position: relative; 
	padding-bottom: 0;
	border: none;
	box-shadow: 0 0 10px rgba(0,0,0,.2);
  	}
	
	#thead {
	  font-weight: bold;
	  color: #fff;
	  background: #212741;
	}
	  
	 td, th {
	  padding: 1em .5em;
	  vertical-align: middle;
	}
	  
	 td {
		border-bottom:solid 1px lightgray;  
		
	}



/* .pagination{ */
/* 	float:right; */
/* 	margin-top:50px; */
/* 	text-align:center; */
/* 	margin-right:200px; */
/* 	margin-bottom:30px; */
	
	
/* } */
  
 @media all and (max-width: 768px) {
    
   table, thead, tbody, th, td, tr { 
     display: block; 
   } 
  
  th {
    text-align: right;
  }
  
  
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
 
</style> -->

<style>
#container {
      margin: 120px;
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

<script type="text/javascript">
	$(function(){
		
		let word = "<c:out value='${UserQnaVO.keyword}'/>"; 
		if(word!=""){
			$("#keyword").val('<c:out value='${UserQnaVO.keyword}'/>');
			$("#keyword").focus();
			$("#search").val('<c:out value='${UserQnaVO.search}'/>');
			
			if($("#search").val()!='question'){
				//:contais() 는 특정 텍스트를 포함한 요소 반환
				if($("#search").val()=='question') value = "#list tr td.goDetail";
				console.log($(value+":contains('"+word+"')").html());
				$(value+":contains('"+word+"')").each(function (){
					let regex = new RegExp(word, 'gi');
					$(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
				})
			}
		}
		
		$("#searchData").click(function() {
			if(!chkData("#keyword", "검색어를")) return;
			else {
				$("#pageNum").val(1); //페이지 초기화
				goPage(); 
			}
		})

		$("#keyword").bind("keydown", (e) => {
			if(e.keyCode ==13) {
				e.preventDefault();
			}
		})
		$("#search").change(() => {
			$("#keyword").focus();
		})
		
		
// 		검색기능
		
		
		$("#insertBtn").click(function(){
			let userId = "<c:out value='${userLogin.userId}'/>";
			if(userId==""){
				alert("로그인 후 이용가능합니다.");
				location.href="/userLogin/loginUser";
			}else{
				location.href="/qna/questionForm";
			}
		})
		
		
	    // 모든 답변 숨기기
	    $("[id^=answer-]").hide();
	
		$(document).on("click", ".text-center[data-target]", function() {
	        var targetId = $(this).data("target");
	        
	        var answerElement = $("#" + targetId);
	        
	        // 해당 답변이 null이 아닌 경우에만 토글
	        if (answerElement.length > 0 && answerElement.text().trim() !== "") {
	            answerElement.toggle(); // 해당 답변 표시 또는 숨김
	        }
	       });
		

		//페이지 번호 버튼
		$(".paginate_button a").click(function(e){
			e.preventDefault();
			$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
			goPage();
		})
		

	})
		function goPage(){
			$("#f_search").attr({
				"method":"get",
				"action":"/qna/qnaClient"
			})
				$("#f_search").submit();
		}
		
</script>


<title>게시판 리스트</title>

</head>
<body>
		<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>

<div id="container">
   <div>
      <h2>QnA 게시판</h2>
   </div>
   <div id="boardSearch" class="d-flex justify-content-end">
      <div class="d-flex justify-content-end">
         <input type="button" id="insertBtn" name="insertBtn"
            class="btn btn-success" value="글작성" />
      </div>
            <form id="f_search" name="f_search" class="form-inline">
         <%-- 페이징 처리를 위한 파라미터 --%>
		<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> 
		<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
         <div class="d-inline-flex text-end">
								 <select id="search" name="search"  class="form-control form-control-sm w-auto">
											<option value="question">질문</option>
											<option value="answer">답변</option>
								</select>
								<input type="text" name="keyword" id="keyword"  placeholder="검색어를 입력하세요" class="form-control form-control-sm w-auto" />
            <button type="button" id="searchData" class="btn btn-primary">검색</button>
         </div>
      </form>
   </div>
   <br />
                       <input type="hidden" id="user_id" name="user_id" value="${userLogin.userId}" >
			
			<div id="qnaList" > <!-- 	class="table-height"-->

 			<table summary="게시판 리스트"  ><!--class="table" -->
 			
				<thead id="thead">
					<tr>
						<th data-value="qna_id" class="order text-center" >글번호</th>
						<th class="text-center">답변여부</th>
						<th class="text-center col-md-6" >답변</th>
						<th >작성자</th>
						<th data-value="answer_date" class="text-center">작성일</th>
						<th></th>
					</tr>
				</thead>
 				<tbody id="list" > <!--class="table-striped"  -->
					<c:choose>
						<c:when test="${not empty qnaList}" >
							<c:forEach var="qna" items="${qnaList}" varStatus="status"> 
								<tr class="text-center goAnswer">
 									<td>${qna.qna_id}</td>
 									<td>
										<c:if test="${qna.answer ne null}"><span style="color:gray">답변완료</span></c:if>
									</td>
									
									<c:if test="${qna.category eq 1}">
										<c:choose>
											<c:when test="${qna.user_id eq userLogin.userId}">	
											<td class="text-center a" data-target="answer-${qna.qna_id}" data-num="${qna.qna_id}">
											    <c:out value="${qna.question}" />
											</td>
											</c:when>
											<c:otherwise><td style="height:30px;">🔓︎작성자와 관리자만 볼 수 있는 게시글입니다</td></c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${qna.category ne 1}" >
							            <td class="text-center a" data-target="answer-${qna.qna_id}" data-num="${qna.qna_id}">
											    <c:out value="${qna.question}" />
										</td>
							        </c:if>
									
									<td class="name">${qna.user_id}</td>
									<td> ${qna.question_date}<br/>
									
									<c:if test="${qna.user_id eq userLogin.userId}">
									<td >
										<form action="/qna/deleteClientQna" method="post">
							            <input type="hidden" name="qna_id" value="${qna.qna_id}">
							            <button  type="submit" id="delBtn" class="btn">삭제</button>
							        </form>
									 <form action="/qna/qnaUpdateForm" method="get">
							            <input type="hidden" name="qna_id" value="${qna.qna_id}">
							            <button type="submit" id="upBtn" class="btn">수정</button>
							        </form>
									</td>
									</c:if>
									
									</td>
								</tr>
								<tr class="text-left answer" id="answer-${qna.qna_id}"  style=" background-color: rgb(250, 250, 255);">
									<td colspan=6>
										<div>
											<span id="q" style="margin-left:90px;">${qna.question}</span><br/><br/>
											<span id="a" style="margin-left:100px;">${qna.answer}<span style="float: right; margin-right:20px;">${qna.answer_date}</span></span>
										</div>
									</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td colspan="5" class="tac text-center">등록된 게시글이 없음</td></tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		
		  <%-- ================ 페이징 출력 시작 ================ --%>
                          <div class="d-flex justify-content-center">
								<ul class="pagination ">

                                 <!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
                                 <c:if test="${pageMaker.prev}">
                                    <li class="paginate_button previous btn-outline-secondary"><a
                                       href="${pageMaker.startPage - 1 }">pre</a></li>
                                 </c:if>

                                 <!-- 바로가기 번호 출력 -->
                                 <c:forEach var="num" begin="${pageMaker.startPage}"
                                    end="${pageMaker.endPage}">
                                    <li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }">
                                       <a href="${num}" class="btn btn-outline-secondary">${num}</a>
                                    </li>
                                 </c:forEach>
                                 

                                 <!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
                                 <c:if test="${pageMaker.next}">
                                    <li class="paginate_button next btn-outline-secondary"><a
                                       href="${pageMaker.endPage + 1 }" class="paging">next</a></li>
                                 </c:if>

                              </ul>
                           </div>

                        </div>
</div>

			<jsp:include page="/WEB-INF/views/mainTemplate/footer.jsp"/>

       
		
</body>
</html>