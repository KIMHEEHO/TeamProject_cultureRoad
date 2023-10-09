<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%> 
<style>
.button {
	padding:0px !important;
}
table {
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
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
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
  
  .pagination {
	margin-top:30px;
}
  
</style>

<script type="text/javascript">
$(function(){
   let word = "<c:out value='${noticeVO.keyword}'/>"; 
   if(word!=""){
      $("#keyword").val('<c:out value='${noticeVO.keyword}'/>');
      $("#keyword").focus();
      $("#search").val('<c:out value='${noticeVO.search}'/>');
      
      if($("#search").val()!='noc_content'){
         //:contais() 는 특정 텍스트를 포함한 요소 반환
         if($("#search").val()=='noc_title') value = "#list tr td.goDetail";
         console.log($(value+":contains('"+word+"')").html());
         $(value+":contains('"+word+"')").each(function (){
            let regex = new RegExp(word, 'gi');
            $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
         })
      }
   }
   
   
   $(".goDetail").click(function(){
      let noc_num = $(this).parents("tr").attr("data-num");
      console.log("noc_num :", noc_num);
      $("#noc_num").val(noc_num);
      $("#detail").attr({
         method : "post",
         action : "/admin/notice/noticeDetail"
      })
      $("#detail").submit();
   })
   
   $(".deleteBtn").click(function(){
      let noc_num = $(this).attr("data-num");
      if(confirm("삭제 하시겠습니까?")){
      $("#noc_num").val(noc_num);
      $("#detail").attr({
         method : "post",
         action : "/admin/notice/noticeDelete"
      })
      $("#detail").submit();
      }
   })
   
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
   
   $(".page-item a").click(function(e) {
      e.preventDefault();
      $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
      goPage();
   })
   
   $("#insertForm").click(function(){
      location.href="/admin/notice/noticeInserForm"
   })
})
function goPage(){
   $("#f_search").attr({
      "method":"get",
      "action":"/admin/notice/board"
   })
      $("#f_search").submit();
}
   </script>
<c:if test="${empty adminLogin}">
	<%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
</c:if>
<c:if test="${not empty adminLogin}">
<!-- 여기는 꼭 들어가야하는 부분 밑에 주석까지!!! 그리고 맨 밑에 푸터 참고해주세요. -->
<%@ include file="/WEB-INF/views/admin/main/main.jsp" %>
<div class="main-panel">
   <div class="content-wrapper">
      <div class="d-xl-flex justify-content-between align-items-start">
         <h2 class="text-dark font-weight-bold mb-2">공지게시판</h2>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div
               class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
            </div>
            <div class="tab-content tab-transparent-content">

<!--  위에서부터 여기까지는 꼭 넣어주세요!!!! -->
   
    <div class="container">
    <div id="button">
            <input type="button" class="btn btn-outline-secondary btn-fw" id="insertForm" name="inserForm" value="공지작성">
       </div>
      <div id="boardSearch" class="d-flex justify-content-end"> 
      <form id="f_search" name="f_search" >
         <%-- 페이징 처리를 위한 파라미터 --%>
         <input type="hidden" name="pageNum" id="pageNum" value="${paging.cvo.pageNum }">
         <input type="hidden" name="amount" id="amount" value="${paging.cvo.amount }">
        
         <div class="d-inline-flex text-end">
             <select id="search" name="search" class="form-control form-control-sm w-auto" >
                     <option value="noc_title">제목</option>
                     <option value="noc_content">내용</option>
            </select>
            <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="text-right form-control form-control-sm w-auto"/><!-- class="form-control form-control-sm w-auto"  -->
            <button type="button" id="searchData" class="btn btn-success btn-md">검색</button>
         </div>
      </form>
      </div>
      <br />
      
      <form id="detail" name="detail">
         <input type="hidden" id="noc_num" name="noc_num" />
      </form>

      <div id="boardList">
         <table summary="게시판 리스트" >
            <thead id="thead">
               <tr>
                  <th data-value="b_num" >글번호</th>
                  <th>글제목</th>
<!--                   <th class="text-center col-md-2">작성자</th> -->
                  <th data-value="b_date">작성일</th>
                  <th>조회수</th>
                  <th>관리자</th>
               </tr>
            </thead>
            <tbody id="list">
               <c:choose>
                  <c:when test="${not empty notice}" >
                     <c:forEach var="notice" items="${notice}" varStatus="status"> 
                        <tr class="text-center" data-num="${notice.noc_num}">
                            <td>${notice.noc_num}</td>
                           <td class="goDetail text-start"> ${notice.noc_title} </td>
<!--                            <td class="name">관리자</td> -->
                           <td > ${notice.noc_write_date}</td>
                           <td >${notice.readcnt}</td>
                           <td >
                              <input data-num="${notice.noc_num }" type="button" class="deleteBtn btn" value="삭제">
                           </td>
                        </tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <tr><td colspan="5">등록된 게시글이 없습니다.</td></tr>
                  </c:otherwise>
               </c:choose>
            </tbody>
         </table>
      </div>
        </div>
      <%-- ================ 리스트 종료 ================ --%>
      <%-- ================ 페이징 출력 ================ --%>
      <div class="d-flex justify-content-center">
         <ul class="pagination">
            <!-- 이전 바로가기 10개 존재 여부 확인 -->
            <c:if test="${paging.prev }">
               <li class="page-item">
                  <a class="page-link" href="${paging.initpage}">처음으로</a>
               </li>
               <li class="page-item previous">
                  <a class="page-link" href="${paging.startPage -1}">이전</a>
               </li>
            </c:if>
            
									            <!-- 바로가기 번호 출력 -->
            <c:forEach var="num" begin="${paging.startPage }" end="${paging.endPage }">
               <li class="page-item ">
                  <a class="btn btn-outline-secondary ${paging.cvo.pageNum == num ? 'active':'' }" href="${num}">${num }</a>
               </li>
            </c:forEach>
		
									<!-- 다음 바로가기 10개 존재 여부 확인 -->
									<c:if test="${paging.next }">
										<li class="page-item next"><a 
										class="btn btn-outline-secondary" href="${paging.endPage+1 }">다음</a></li>
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
</c:if>