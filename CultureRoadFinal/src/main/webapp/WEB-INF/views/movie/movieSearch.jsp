<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


 <script src="/resources/main/dist/js/ie-emulation-modes-warning.js"></script>


	<script type="text/javascript">
	$(function(){
		$(".movieDetail").click(function(){
			let id = $(this).parents("tr").attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "post",
				action : "/movieDetail/"+id
			})
			$("#detail").submit();
		})
		
	    $("#searchBtn").click(function(){
	         $("#search").attr({
	            method : "post",
	            action : "/movie/movieSearch"
	         })
	         $("#search").submit();
	      })
	          
		
		
		
	})
    </script>
    <style type="text/css">
    	.table {
		    color: white !important;
		    font-size:13px;
		    
		}
		
    
		 #searchBtn{
			color:white;
			background-color:#79C67F;
			border:solid 1px #79C67F;
			height:33px;
			width:50px;
			font-size:12px;
			border-radius:8px;
		
		}
    
     	
     	body{
     		background-color: rgb(32, 33, 49)!important;
     	}
     	
     	#main{
			padding-top:90px;     	
     	}
     	
     	a{
     		border-collapse: separate;
     	
     	}
     	
    </style>
  </head>

  <body>
	
<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
	

	<!-- Begin page content -->
    <div class="contentLayout container" id="main">
     	<!-- 메인  -->
			<form id="detail" name="detail" >
				<input type="hidden" id="id" name="id" />
			</form>
			
			<form id="search" name="search" style="margin-bottom:20px;">
				<input type="text" id="title1" name="title1" />
				<button type="button" class="btn" id="searchBtn" name="searchBtn">검색</button>
			</form>
		
		
		
		<table class="table">
		
 
<%--                               <c:forEach var="movie" items="${movies2}" end="10"> --%>
<!--                                 <div class="col-md-6" style="margin-top:50px;"> -->
<%-- 						 	<img src="http://image.tmdb.org/t/p/w300${movie.backdrop_path}" data-num="${movie.id}" class="movieDetail" --%>
<!-- 								class="img-fluid" style="width: 100%; margin-bottom:20px;"> -->
<%--                                 <h5 id="mvBtn" data-num="${movie.id}" style="text-align:center; margin-bottom:30px;">${movie.title}</h5> --%>
<!--                             </div> -->
<%--                             </c:forEach> --%>
                            
                            
                            
                            
			<c:choose>
			    <c:when test="${empty movies}">
			        <tr style="height:300px;">
			            <td colspan="2" style="text-align:center">검색 결과가 없습니다.</td>
			        </tr>
			    </c:when>
			    <c:otherwise>
			        <c:forEach var="movie" items="${movies}">
			            <tr data-num="${movie.id}">
			                <td rowspan="3"><img class="movieDetail" src="http://image.tmdb.org/t/p/w500${movie.backdrop_path}"></td>
			                
			                
			                <td class="overview">
			                     ${movie.title}
			                </td>
			            </tr>      
			            <tr>
			                <td class="overview">
			                   ${movie.release_date}
			                </td>    
			            </tr>
			            <tr>    
			                <td class="overview">
			                    개요: ${movie.overview}
			                </td>
			            </tr>
			        </c:forEach>
			    </c:otherwise>
			</c:choose>

		
		</table>
	</div>

   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="/resources/dist/js/bootstrap.min.js"></script>
    <%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>
  </body>
</html>
