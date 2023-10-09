<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style>
.pagination {
	margin-top: 30px;
}

td.text-left div {
	white-space: normal; /* 텍스트 내부에서 줄 바꿈 활성화 */
}

.a {
	overflow-wrap: break-word;
	/*     margin-left: 30px;  */
	margin-right: 100px;
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
	margin-right: 10px;
}

tr.answer td {
	max-width: 300px;
	padding: 20px;
	overflow-wrap: break-word;
	height: 120px;
	/*    height: 120px; */
}

/********************************************************************/
.main-panel {
	float: right;
}

#delBtn, #anwBtn {
	border: none;
	background-color: #575A7B;
	color: white;
	margin-bottom: 5px;
	border-radius: 5px;
	font-size: 10px;
	padding: 7px;
}

table {
	background-color: white;
	border: 1px #212741 solid;
	font-size: .9em;
	box-shadow: 0 2px 5px rgba(0, 0, 0, .25);
	width: 100%;
	border-collapse: collapse;
	border-radius: 5px;
	overflow: hidden;
	text-align: center;
}

#thead {
	font-weight: bold;
	color: #fff;
	background: #212741;
}

td, th {
	padding: 1em .5em;
	vertical-align: middle;
	font-size: 12px !important;
}

td {
	border-bottom: 1px solid rgba(0, 0, 0, .1);
	background: #fff;
}

a {
	font-size: 15px;
	margin-right: 10px;
}

.pagination {
	float: right;
	margin-top: 50px;
	margin-right: 350px;
	margin-bottom: 30px;
}

@media all and (max-width: 768px) {
	/*   table, thead, tbody, th, td, tr { */
	/*     display: block; */
	/*   } */
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
}
</style>

<script type="text/javascript">
   $(function() {

      // 모든 답변 숨기기
      $("[id^=answer-]").hide();

      $(document).on(
            "click",
            ".text-center[data-target]",
            function() {
               var targetId = $(this).data("target");
               //            $("#" + targetId).toggle(); // 해당 답변 표시 또는 숨김

               var answerElement = $("#" + targetId);

               // 해당 답변이 null이 아닌 경우에만 토글
               if (answerElement.length > 0
                     && answerElement.text().trim() !== "") {
                  answerElement.toggle(); // 해당 답변 표시 또는 숨김
               }
            });

      //페이지 번호 버튼
      $(".paginate_button a").click(
            function(e) {
               e.preventDefault();
               $("#f_search").find("input[name='pageNum']").val(
                     $(this).attr("href"));
               goPage();
            })

   })
   function goPage() {
      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/qna/qnaAdmin"
      })
      $("#f_search").submit();
   }

   $(document).ready(function() {
      // 초기에는 체크박스가 선택되지 않았으므로 전체 글을 보여줍니다.

      // 체크박스 상태가 변경될 때마다 리스트 필터링 함수를 호출합니다.
      $("#answerchk").on("change", function() {
         filterList();
      });
   });

   function filterList() {
      var chkcnf = $("#answerchk").is(":checked"); // 체크박스가 선택되었는지 확인

      // 각 글의 답변 여부에 따라 필터링합니다.
      $(".goAnswer").each(function() {
         var $row = $(this); //goAnswer의 테이블 행
         var anschk = $row.find("td:eq(1)").find("span").length > 0;
         //두번째 열의 td요소의 span을 찾는다

         // 체크박스가 선택된 경우 + 글이 답변이 있는 경우 숨김
         if (chkcnf && anschk) {
            $row.hide();
         } else {
            $row.show();
         }
      });
   }
</script>

<title>게시판 리스트</title>

</head>
<body>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
<div class="main-panel">
   <div class="content-wrapper">
      <div class="d-xl-flex justify-content-between align-items-start">
         <h2 class="text-dark font-weight-bold mb-2">QnA 게시판</h2>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div
               class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
            </div>
            <div class="tab-content tab-transparent-content">

<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
			<div class="container">
				<div id="boardSearch" class="d-flex justify-content-end">
					<form id="f_search" name="f_search">
								페이징 처리를 위한 파라미터
					<input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum }">
					<input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount }">
						<div class="d-inline-flex text-end">
							<select id="search" name="search" class="form-control form-control-sm w-auto">
								<option value="question">질문</option>
								<option value="answer">답변</option>
							</select>
							<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요"
									class="form-control form-control-sm w-auto" />
							<button type="button" id="searchData" class="btn btn-success" >검색</button>
						</div>
					</form>
				</div>
				<div id="qnaList" class="table-height">
					<table summary="게시판 리스트" class="table">
						<thead id="thead">
							<tr>
								<th data-value="qna_id" class="order text-center">글번호</th>
								<th class="text-center">답변상태</th>
								<th class="text-center col-md-6">답변</th>
								<th>작성자</th>
								<th data-value="answer_date" class="text-center">작성일</th>
								<th colspan="2">
									<input type="checkbox" id="answerchk" name="answerchk" value="1">답변여부
								</th>
							</tr>
						</thead>
						<tbody id="list" class="table-striped">
							<c:choose>
								<c:when test="${not empty qnaList}">
									<c:forEach var="qna" items="${qnaList}" varStatus="status">
										<tr class="text-center goAnswer">
											<td>${qna.qna_id}</td>
											<td><c:if test="${qna.answer ne null}">
												<span style="color: #575A7B;">답변완료</span>
											</c:if></td>
											<td class="text-center a" data-target="answer-${qna.qna_id}"
											data-num="${qna.qna_id}" style="max-width: 300px">
											${qna.question}</td>
											<td class="name">${qna.user_id}</td>
											<td>${qna.question_date}</td>
											<td>
												<form action="/admin/qna/deleteQna" method="post">
													<input type="hidden" name="qna_id" value="${qna.qna_id}">
													<button type="submit" id="delBtn">삭제</button>
												</form>
												<form action="/admin/qna/answerForm" method="get">
													<input type="hidden" name="qna_id" value="${qna.qna_id}">
													<button type="submit" id="anwBtn" class="answerBtn"
													data-num="${qna.qna_id}">답변</button>
												</form>
											</td>
										</tr>
										<tr class="text-left answer" id="answer-${qna.qna_id}"
										style="background-color: rgb(250, 250, 255);">
											<td colspan=6 class="text-left">
												<div class="enable-line-breaks">
													<span id="q">${qna.question}</span><br /> <br />
													<span id="a" style="margin-right: 10px;">${qna.answer}
													<br />
													<span style="float: right; margin-right: 20px;">${qna.answer_date}</span>
													</span>
												</div>
											</td>
										</tr>
									</c:forEach>
								</c:when>
							<c:otherwise>
								<tr>
								<td colspan="5" class="tac text-center">등록된 게시글이 없음</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
      ================ 페이징 출력 ================
      <div class="d-flex justify-content-center">
         <ul class="pagination">
            <!-- 이전 바로가기 10개 존재 여부 확인 -->
            <c:if test="${pageMaker.prev }">
               <li class="page-item">
                  <a class="page-link" href="${pageMaker.initpage}">처음으로</a>
               </li>
               <li class="page-item previous">
                  <a class="page-link" href="${pageMaker.startPage -1}">이전</a>
               </li>
            </c:if>
            
									            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${pageMaker.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
               </li>
            </c:forEach>
		
									<!-- 다음 바로가기 10개 존재 여부 확인 -->
									<c:if test="${pageMaker.next }">
										<li class="page-item next"><a 
										class="btn btn-outline-secondary" href="${pageMaker.endPage+1 }">다음</a></li>
									</c:if>
					</ul>

</div>
 <!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
            </div>
         </div>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/admin/main/footer.jsp" %>
</div>
</c:if> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>

<style>
   td.text-left div {
       white-space: normal; /* 텍스트 내부에서 줄 바꿈 활성화 */
   }

  .a { 
   overflow-wrap: break-word; 
/*     margin-left: 30px;  */
    margin-right: 100px; 
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
   margin-right:10px;
}

tr.answer td {
   max-width: 300px;
   padding: 20px;
   overflow-wrap: break-word;
    height: 120px;
/*    height: 120px; */
}

/********************************************************************/





.main-panel{
   float:right;
}

#delBtn,#anwBtn{
   border:none;
   background-color:#575A7B;
   color:white;
   margin-bottom:5px;
   border-radius: 5px;
   font-size:10px;
   padding:7px; 
} 

table {
background-color:white;
  border: 1px #212741 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
  text-align : center; 
}

#thead {
  font-weight: bold;
  color: #fff;
  background: #212741;
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
  font-size:12px !important; 
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  font-size:15px;
  margin-right:10px;
  
}

.pagination{
   float:right;
   margin-top:50px;
   margin-right:350px;
   margin-bottom:30px;
   
}
  
 @media all and (max-width: 768px) {
    
/*   table, thead, tbody, th, td, tr { */
/*     display: block; */
/*   } */
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
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
  



</style>

<script type="text/javascript">
   $(function() {

      
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
      
      
      
      // 모든 답변 숨기기
      $("[id^=answer-]").hide();

      $(document).on(
            "click",
            ".text-center[data-target]",
            function() {
               var targetId = $(this).data("target");
               //            $("#" + targetId).toggle(); // 해당 답변 표시 또는 숨김

               var answerElement = $("#" + targetId);

               // 해당 답변이 null이 아닌 경우에만 토글
               if (answerElement.length > 0
                     && answerElement.text().trim() !== "") {
                  answerElement.toggle(); // 해당 답변 표시 또는 숨김
               }
            });

      //페이지 번호 버튼
      $(".paginate_button a").click(
            function(e) {
               e.preventDefault();
               $("#f_search").find("input[name='pageNum']").val(
                     $(this).attr("href"));
               goPage();
            })

   })
   function goPage() {
      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/qna/qnaAdmin"
      })
      $("#f_search").submit();
   }

   $(document).ready(function() {
      // 초기에는 체크박스가 선택되지 않았으므로 전체 글을 보여줍니다.

      // 체크박스 상태가 변경될 때마다 리스트 필터링 함수를 호출합니다.
      $("#answerchk").on("change", function() {
         filterList();
      });
   });

   function filterList() {
      var chkcnf = $("#answerchk").is(":checked"); // 체크박스가 선택되었는지 확인

      // 각 글의 답변 여부에 따라 필터링합니다.
      $(".goAnswer").each(function() {
         var $row = $(this); //goAnswer의 테이블 행
         var anschk = $row.find("td:eq(1)").find("span").length > 0;
         //두번째 열의 td요소의 span을 찾는다

         // 체크박스가 선택된 경우 + 글이 답변이 있는 경우 숨김
         if (chkcnf && anschk) {
            $row.hide();
         } else {
            $row.show();
         }
      });
   }
</script>

<title>게시판 리스트</title>

</head>
<body>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
      <div class="main-panel">
         <div class="content-wrapper">
            <div class="d-xl-flex justify-content-between align-items-start">
               <h2 class="text-dark font-weight-bold mb-2">QnA</h2>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div
                     class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
                  </div>
                  <div class="tab-content tab-transparent-content">

                     <!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
                     <div class="container">
               <div id="qnaSearch" class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
                     </div>   
                         <form id="f_search" name="f_search" class="form-inline">
                           <%-- 페이징 처리를 위한 파라미터 --%>
                           <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> 
                            <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
                       
                             <div class="column">
                     
                     <div class="d-inline-flex text-end">
                         <select id="search" name="search"  class="form-control form-control-sm w-auto">
                                 <option value="question">질문</option>
                                 <option value="answer">답변</option>
                        </select>
                        <input type="text" name="keyword" id="keyword"  placeholder="검색어를 입력하세요" class="form-control form-control-sm w-auto" />
                        <button type="button" id="searchData" class="btn btn-success" style="font-size:13px;">검색</button>
                     </div>
                     
                     </div>
                        </form>
                        <div id="qnaList" class="table-height">
                           <table summary="게시판 리스트" class="table">
                              <thead id="thead">
                                 <tr>
                                    <th data-value="qna_id" class="order text-center">글번호</th>
                                    <th class="text-center">답변여부</th>
                                    <th class="text-center col-md-6">답변</th>
                                    <th>작성자</th>
                                    <th data-value="answer_date" class="text-center">작성일</th>

                                    <th colspan="2"><input type="checkbox" id="answerchk"
                                       name="answerchk" value="1"></th>
                                 </tr>
                              </thead>
                              <tbody id="list" class="table-striped">
                                 <c:choose>
                                    <c:when test="${not empty qnaList}">
                                       <c:forEach var="qna" items="${qnaList}" varStatus="status">
                                          <tr class="text-center goAnswer">
                                             <td>${qna.qna_id}</td>
                                             <td><c:if test="${qna.answer ne null}">
                                                   <span style="color: #575A7B;">답변완료</span>
                                                </c:if></td>
                                             <td class="text-center a"
                                                data-target="answer-${qna.qna_id}"
                                                data-num="${qna.qna_id}" style="max-width: 300px">
                                                ${qna.question}</td>
                                             <td class="name">${qna.user_id}</td>
                                             <td>${qna.question_date}</td>

                                             <td>
                                                <form action="/admin/qna/deleteQna"
                                                   method="post">
                                                   <input type="hidden" name="qna_id"
                                                      value="${qna.qna_id}">
                                                   <button type="submit" id="delBtn">삭제</button>
                                                </form>
                                     
                                    
                                                <form action="/admin/qna/answerForm" method="get">
                                                   <input type="hidden" name="qna_id"
                                                      value="${qna.qna_id}">
                                                   <button type="submit" id="anwBtn" class="answerBtn"
                                                      data-num="${qna.qna_id}">답변</button>
                                                </form></td>
                                          </tr>
                                          <tr class="text-left answer" id="answer-${qna.qna_id}"
                                             style="background-color: rgb(250, 250, 255);">
                                             <td colspan=6 class="text-left">
                                                <div class="enable-line-breaks">
                                                   <span id="q">${qna.question}</span><br />
                                                   <br /><span id="a" style="margin-right:10px;">${qna.answer} <br/><span style="float: right; margin-right: 20px;">${qna.answer_date}</span></span>
                                                </div>
                                             </td>
                                          </tr>
                                       </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                       <tr>
                                          <td colspan="5" class="tac text-center">등록된 게시글이 없음</td>
                                       </tr>
                                    </c:otherwise>
                                 </c:choose>
                              </tbody>
                           </table>

<%-- ================ 리스트 종료 ================ --%>
							<%-- ================ 페이징 출력 ================ --%>
							<div class="d-flex justify-content-center">
								<ul class="pagination ">
									<!-- 이전 바로가기 10개 존재 여부 확인 -->
									<c:if test="${pageMaker.prev }">
										<li class="page-item"><a class="page-link"
											href="${pageMaker.initpage}">처음으로</a></li>
										<li class="page-item previous"><a class="page-link"
											href="${pageMaker.startPage -1}">이전</a></li>
									</c:if>

									            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${pageMaker.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
               </li>
            </c:forEach>

				<!-- 다음 바로가기 10개 존재 여부 확인 -->
									<c:if test="${pageMaker.next }">
										<li class="page-item next"><a 
										class="btn btn-outline-secondary" href="${pageMaker.endPage+1 }">다음</a></li>
									</c:if>
								</ul>
							</div>

						</div>
						<!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
                  </div>
               </div>
            </div>

         </div>
		<%@ include file="/WEB-INF/views/admin/main/footer.jsp"%>
      </div>
       
   </c:if>
      
</body>
</html>