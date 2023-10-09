<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

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

<script>
   $(function() {
      /* 검색 후 검색 대상과 검색 단어 출력 */
      let word = "<c:out value='${AdminCommentVO.keyword}'/>";
      if (word != "") {
         $("#keyword").val('<c:out value='${AdminCommentVO.keyword}'/>');
         $("#keyword").focus();
         $("#search").val('<c:out value='${AdminCommentVO.search}'/>');

         if ($("#search").val() != 'question') {
            //:contais() 는 특정 텍스트를 포함한 요소 반환
            if ($("#search").val() == 'question')
               value = "#list tr td.goDetail";
            console.log($(value + ":contains('" + word + "')").html());
            $(value + ":contains('" + word + "')").each(
                  function() {
                     let regex = new RegExp(word, 'gi');
                     $(this).html(
                           $(this).html().replace(
                                 regex,
                                 "<span class='required'>" + word
                                       + "</span>"));
                  })
         }
      }

      /* 입력 양시 enter 제거 */
      $("#keyword").bind("keydown", function(event) {
         if (event.keyCode == 13) {
            event.preventDefault();
         }
      });

      /* 검색 대상이 변경될 때마다 처리 이벤트 */
      $("#search").change(function() {
         if ($("#search").val() == "all") {
            $("#keyword").val("전체 목록 조회합니다.");
         } else if ($("#search").val() != "all") {
            $("#keyword").val("");
            $("#keyword").focus();
         }
      })

      /* 검색 버튼 클릭 시 처리 이벤트 */
      $("#searchData").click(function() {
         if (!chkData("#keyword", "검색어를"))
            return;
         else {
            $("#pageNum").val(1); //페이지 초기화
            goPage();
         }
      })

      $(".paginate_button a").click(
            function(e) {
               e.preventDefault();
               $("#f_search").find("input[name='pageNum']").val(
                     $(this).attr("href"));
               goPage();
            })

      $(".commentDeleteBtn").click(function() {
         let mv_co_num = $(this).parents("tr").attr("data-num");
         //alert(mv_co_num);
         // 삭제 요청 보내기
         //deleteComment(mv_co_num);
         if(confirm("정말 삭제하시겠습니까?")){
            location.href = "/admin/admincommentDelete?mvCoNum=" + mv_co_num;
         }
      });

   })

   function goPage() {
      $("#f_search").attr({
         "method" : "get",
         "action" : "/admin/admincommentList"
      })
      $("#f_search").submit();
   }

   // 한줄평 삭제 요청 함수
   function deleteComment(mv_co_num) {
      $.ajax({
         type : "POST",
         url : "/admin/admincommentDelete", // 삭제를 처리할 URL
         data : {
            mv_co_num : mv_co_num
         }, // 삭제할 한줄평 번호 전달
         success : function(data) {
            // 삭제 성공 시 목록 페이지로 이동
            alert("삭제를 성공했습니다.")
            location.reload();
         },
         error : function(xhr, status, error) {
            console.error("Error deleting comment:", error);
            // 실패 시 적절한 에러 처리를 여기에 추가
         }
      });
   }
</script>

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
            <h2 class="text-dark font-weight-bold mb-2">한줄평</h2>
         </div>
         <div class="row">
            <div class="col-md-12">
               <div class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {"></div>
               <div class="tab-content tab-transparent-content">

                  <!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
                  <div class="container">
                     <div id="qnaSearch" class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {"></div>
                     <form id="f_search" name="f_search" class="form-inline">
                        <%-- 페이징 처리를 위한 파라미터 --%>
                        <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}"> <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">

                        <div class="column">

                           <div class="d-inline-flex text-end">
                              <select id="search" name="search" class="form-control form-control-sm w-auto">
                                 <option value="all">전체</option>
                                 <option value="title">영화제목</option>
                                 <option value="mvCoComment">한줄평 내용</option>
                                 <option value="userName">작성자</option>

                              </select> <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control form-control-sm w-auto" />
                              <button type="button" id="searchData" class="btn btn-success" style="font-size: 13px;">검색</button>
                           </div>

                        </div>
                     </form>
                     <div id="comment">
                        <table summary="게시판 리스트">
                           <thead id="thead">
                              <tr>
                                 <th class="text-center col-md-1">글번호</th>
                                 <th class="text-center col-md-2">영화 제목</th>
                                 <th class="text-center col-md-2">한줄평 내용</th>
                                 <th class="text-center col-md-2">작성자</th>
                                 <th class="text-center col-md-2">작성일</th>
                                 <th class="text-center col-md-2">글삭제</th>
                              </tr>
                           </thead>
                           <tbody id="list">
                              <!-- 데이터 출력 -->
                              <c:choose>
                                 <c:when test="${not empty adminCommentList}">
                                    <c:forEach var="comment" items="${adminCommentList}" varStatus="status">
                                       <tr class="text-center" data-num="${comment.mvCoNum}">
                                          <td>${comment.mvCoNum}</td>
                                          <td class="goDetail text-left">${comment.title}</td>
                                          <td class="text-left">${comment.mvCoContent}</td>
                                          <td class="name">${comment.userName}</td>
                                          <td class="text-left">${comment.mvCoWriteDate}</td>
                                          <td><input type="button" value="글삭제" class="btn btn-success commentDeleteBtn" /></td>
                                       </tr>
                                    </c:forEach>
                                 </c:when>
                                 <c:otherwise>
                                    <tr>
                                       <td colspan="6" class="text-center">등록된 게시글이 존재하지 않습니다.</td>
                                    </tr>
                                 </c:otherwise>
                              </c:choose>
                           </tbody>
                        </table>


                        <%-- ================ 페이징 출력 시작 ================ --%>
                        <div class="text-center">
                           <ul class="pagination">

                              <!-- 이전 바로가기 10개 존재 여부를 prev 필드의 값으로 확인 -->
                              <c:if test="${pageMaker.prev}">
                                 <li class="paginate_button previous"><a href="${pageMaker.startPage - 1 }" class="paging"></a></li>
                              </c:if>

                              <!-- 바로가기 번호 출력 -->
                              <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                                 <li class="paginate_button ${pageMaker.cvo.pageNum == num ? 'active':'' }"><a href="${num}" class="paging">${num}</a></li>
                              </c:forEach>


                              <!-- 다음 바로가기 10개 존재 여부를 next 필드의 값으로 확인 -->
                              <c:if test="${pageMaker.next}">
                                 <li class="paginate_button next"><a href="${pageMaker.endPage + 1 }" class="paging">>></a></li>
                              </c:if>

                           </ul>
                        </div>

                     </div>
                  </div>
                  <!--  여기도 꼭 넣어주세요!!!!!!!!!!!!! -->
               </div>
            </div>
         </div>

      </div>
      <jsp:include page="../main/footer.jsp" />
   </div>

</c:if>
</body>

</html>