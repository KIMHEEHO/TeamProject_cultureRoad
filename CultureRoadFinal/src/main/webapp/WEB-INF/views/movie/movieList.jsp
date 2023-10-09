<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>


<script src="/resources/main/dist/js/ie-emulation-modes-warning.js"></script>



<script type="text/javascript">
   $(function(){
      $('.dropdown-toggle').dropdown();
      
      $(".movieDetail,#mvBtn").click(function(){
         let id = $(this).attr("data-num");
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
            action : "/movieSearch"
         })
         $("#search").submit();
      })
          
      
      //*************드롭다운************
           let selectedValue = 0;
            $(".dropdown-item").click(function() {
                 const selectedValue = $(this).data("value");

                 switch (selectedValue) {
                   case 0:
                      $("#nowmv").show();
                      $("#popmv").hide();
                     break;

                   case 1:
                      $("#nowmv").hide();
                      $("#popmv").show();
                     break;

                   default:
                     break;
                 }
               });
   })
   
   	$(document).ready(function() {
		  $("#nowmv").show();
		  $("#popmv").hide();
		});
   
   
    </script>
<style type="text/css">
.movieDetail {
	height: 350px;
	width: 260px;
}

 #nowmv, #popmv { 
 	width: 1250px; 
 } 

#container {
	margin-top: 100px;
}
.dropdown{
	float:right;
	background-color:#71D579;
	color:white;
	border-radius:10px;
}


#title1{	
	
	height:35px;
	border-radius:10px;
	border:solid 1px #79C67F;

}
#searchBtn{
	color:white;
	background-color:#79C67F;
	border:solid 1px #79C67F;
	height:35px;
	width:50px;
	font-size:12px;
	border-radius:10px;

}

.card{
	text-align:center;
	margin-bottom:30px;
	height:400px;
}
.navbar{
	margin-left:40px;
}
#mvBtn{

	float:left;
	border:white;
	color:white;
	background-color:#5D9685;
	border-radius:10px;
	font-size:13px;
	height:30px;
	width:110px;

}
.card-image-top.mvimg:hover img {
	filter: brightness(0.2);
	
}

.card-image-top.mvimg:hover + #overview {
  display: block;
}


.mvimg{
	position: relative;
}
#overview{
	position: absolute;
	font-size: 16px;
	margin-left:20px;
	margin-top:20px;
	color:white;
    text-align:center;
    display: none;
    height:120px;
    width:220px;
    overflow: hidden; /* 넘치는 텍스트를 숨깁니다. */
  	text-overflow: ellipsis;
}



</style>
</head>

<body>

	<jsp:include page="../common/nav.jsp" />

	<form id="detail" name="detail">
		<input type="hidden" id="id" name="id" />
	</form>


	<div id="container">
		<nav class="navbar navbar-default navbar-fixed-top" style="margin-bottom:20px;">
			<form id="search" name="search">
				<input type="text" id="title1" name="title1" />
				<button type="button" class="btn" id="searchBtn" name="searchBtn">검색</button>
			</form>
			
				<div class="dropdown" style="margin-right:50px;">
				<button class="btn dropdown-toggle" type="button"
					id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false" style="color:white">현재 상영 영화</button>
				<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					<a class="dropdown-item" href="#" data-value="0">현재 상영 영화</a><br />
					<a class="dropdown-item" href="#" data-value="1">인기 영화</a>
				</div>
			</div>
		</nav>


		<!-- Begin page content -->


			<div id="nowmv">
			  <div class="contentLayout container" id="main">
	        <div class="row">
				<c:forEach var="movie" items="${movies}">
				 <div class="card col-md-3  col-sm-4"> 
				    <div class="card-image-top mvimg">	
				    	<img src="http://image.tmdb.org/t/p/w400${movie.poster_path }"></div>  				
						<div id="overview">${movie.overview}</div>											
				    <div class="card-footer" ><button type="button" id="mvBtn" data-num="${movie.id}">상세정보</button>
				    
				    </div> 
				  </div> 
				</c:forEach>
				</div>
				</div>
			</div>

	
			<div id="popmv">
			 <div class="contentLayout container" id="main">
		        <div class="row">
					<c:forEach var="movie" items="${movies2}">
					<div class="card col-md-3  col-sm-4"> 
					    <div class="card-image-top mvimg">	
					    	<img class="movieDetail" data-num="${movie.id}"
												src="http://image.tmdb.org/t/p/w500${movie.poster_path }"></div>  
					    <div class="card-footer">${movie.title}</div> 
					  </div> 
					</c:forEach>
					</div>
					</div>
		</div>
		
	</div>
	
	<jsp:include page="../mainTemplate/footer.jsp" />
</body>
	
</html>

