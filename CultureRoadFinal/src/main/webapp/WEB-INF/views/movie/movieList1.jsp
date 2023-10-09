<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>

<!DOCTYPE html>
<html lang="zxx">

<script type="text/javascript">
   $(function(){
      
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
            action : "/movie/movieSearch"
         })
         $("#search").submit();
      })
      
      
       $(".dropdown-item").click(function() {
         const selectedValue = $(this).data("value");
       })
       
      
   })
   
 
   
    </script>
<style type="text/css">


.mvimg{
   position: relative;
}

.mvimg:hover + .overview{
  display: block;
}

.mvimg:hover img {
   filter: brightness(0.2) ;
   
}


.overview{
   position: absolute;
   font-size: 17px;
   padding-left:10px ;
   margin-top:-280px;
   color:white ;
    text-align:center;
     display: none; 
    height:150px;
    width:220px;
    overflow: hidden; /* 넘치는 텍스트를 숨깁니다. */
    text-overflow: ellipsis !important;
     
}


body{
   
   background-color:rgb(32,33,49) !important;

}

.movieDetail {
/*    width: 300px; */
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


.navbar{
   margin-left:40px;
}
#mvBtn{

   color:white;

}

</style>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>

<body>

   
   <form id="detail" name="detail">
      <input type="hidden" id="id" name="id" />
   </form>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Header Section Begin -->
    <jsp:include page="../common/nav.jsp" />
    <!-- Header End -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <a href="./categories.html">Categories</a>
                        <span>Romance</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Section Begin -->
    <section class="product-page spad">
        <div class="container">
        
              
              
            <div class="row">
                <div class="col-lg-8">
                
                      
                    <div class="product__page__content">
                        <div class="product__page__title">
                           
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-6">
                                    <div class="section-title">
                                        <h4>Movies</h4>
                                    </div>
                                </div>
              
<!--                                     <div class="product__page__filter"> -->
<!--                                         <p>Order by:</p> -->
<!--                                         <select > -->
<!--                                             <option class="dropdown-item" data-value="0">상영 중 영화</option> -->
<!--                                             <option class="dropdown-item" data-value="1">인기 영화</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
                      <div class="col-lg-4 col-md-4 col-sm-6"> 
                              <form id="search" name="search" style="white-space: nowrap" >
                           <input type="text" id="title1" name="title1" />
                        <button type="button" class="btn" id="searchBtn" name="searchBtn" >검색</button>
                           </form>
                                </div>
                            </div>
                        </div>
                        
             <div class="row">
                        
               <c:forEach var="movie" items="${movies}">
                            <div class="col-lg-4 col-md-6 col-sm-6" >
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" style="margin-bottom:20px;">
                                   <span class="mvimg"> <img class="movieDetail" data-num="${movie.id}"
                                 src="http://image.tmdb.org/t/p/w500${movie.poster_path }" style="height:360px;">
                              </span>   
                                 
                                 <div class="overview">${movie.overview}</div>
                                 
                                 
                                        <div class="ep">NEW</div>
                                        <div class="comment"><i class="fa fa-comments"></i> 11</div>
<!--                                         <div class="view" id="readCnt"><i class="fa fa-eye"></i>0</div> -->
                                    </div>
                                    
                                    <div class="product__item__text">
<!--                                         <ul  > -->
<!--                                             <li>Active</li> -->
<!--                                             <li>Movie</li> -->
<!--                                         </ul> -->
                                        <h5 style="margin-top:10px;"><a class="movieDetail" data-num="${movie.id}" >${movie.title}</a></h5>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
    
                            
                        </div>
                        
                    </div>
<!--                     <div class="product__pagination"> -->
<!--                         <a href="#" class="current-page">1</a> -->
<!--                         <a href="#">2</a> -->
<!--                         <a href="#">3</a> -->
<!--                         <a href="#">4</a> -->
<!--                         <a href="#">5</a> -->
<!--                         <a href="#"><i class="fa fa-angle-double-right"></i></a> -->
<!--                     </div> -->
                </div>
<!--          사이드바 시작 -->
             
                <div class="col-lg-4 col-md-6 col-sm-8">
                    <div class="product__sidebar" >
                        <div class="product__sidebar__view" >
                            <div class="section-title">
                                <h5>popular movies</h5>
                            </div>
<!--                             <ul class="filter__controls"> -->
<!--                                 <li class="active" data-filter="*">Day</li> -->
<!--                                 <li data-filter=".week">Week</li> -->
<!--                                 <li data-filter=".month">Month</li> -->
<!--                                 <li data-filter=".years">Years</li> -->
<!--                             </ul> -->
                            <div class="filter__gallery" id="MixItUp1C1191" style="width:400px;">
                              
                               <c:forEach var="movie" items="${movies2}" end="10">
                                <div style="margin-top:50px;">
                   <div data-setbg="http://image.tmdb.org/t/p/w300${movie.backdrop_path}" class="product__sidebar__view__item set-bg mix month week" data-num="${movie.id}" class="movieDetail"
                        style="margin-bottom:20px;">
                                <h5 id="mvBtn" data-num="${movie.id}" style="text-align:center; font-weight:bolder;">${movie.title}</h5>
                            </div>
                            </div>
                            </c:forEach>

                       </div>
                    
                </div>
<!--                 <div class="product__sidebar__comment"> -->
<!--                     <div class="section-title"> -->
<!--                         <h5>New Comment</h5> -->
<!--                     </div> -->
<!--                     <div class="product__sidebar__comment__item"> -->
<!--                         <div class="product__sidebar__comment__item__pic"> -->
<!--                             <img src="img/sidebar/comment-1.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="product__sidebar__comment__item__text"> -->
<!--                             <ul> -->
<!--                                 <li>Active</li> -->
<!--                                 <li>Movie</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5> -->
<!--                             <span><i class="fa fa-eye"></i> 19.141 Viewes</span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="product__sidebar__comment__item"> -->
<!--                         <div class="product__sidebar__comment__item__pic"> -->
<!--                             <img src="img/sidebar/comment-2.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="product__sidebar__comment__item__text"> -->
<!--                             <ul> -->
<!--                                 <li>Active</li> -->
<!--                                 <li>Movie</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5> -->
<!--                             <span><i class="fa fa-eye"></i> 19.141 Viewes</span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="product__sidebar__comment__item"> -->
<!--                         <div class="product__sidebar__comment__item__pic"> -->
<!--                             <img src="img/sidebar/comment-3.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="product__sidebar__comment__item__text"> -->
<!--                             <ul> -->
<!--                                 <li>Active</li> -->
<!--                                 <li>Movie</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5> -->
<!--                             <span><i class="fa fa-eye"></i> 19.141 Viewes</span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="product__sidebar__comment__item"> -->
<!--                         <div class="product__sidebar__comment__item__pic"> -->
<!--                             <img src="img/sidebar/comment-4.jpg" alt=""> -->
<!--                         </div> -->
<!--                         <div class="product__sidebar__comment__item__text"> -->
<!--                             <ul> -->
<!--                                 <li>Active</li> -->
<!--                                 <li>Movie</li> -->
<!--                             </ul> -->
<!--                             <h5><a href="#">Monogatari Series: Second Season</a></h5> -->
<!--                             <span><i class="fa fa-eye"></i> 19.141 Viewes</span> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
                
                
            </div>
            </div>
             
<!--       사이드바 끝        -->
</div>
</div>
</section>
<!-- Product Section End -->

<!-- Footer Section Begin -->
<footer class="footer" style="background-color:rgb(24,29,48)">
    <div class="page-up">
        <a href="#" id="scrollToTopButton" style="font-size:16px; background-color:#79C67F;">top</a>     
    </div>
    <jsp:include page="/WEB-INF/views/mainTemplate/footer.jsp"/>
  </footer>
  <!-- Footer Section End -->

  <!-- Search model Begin -->
  <div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/player.js"></script>
<script src="/resources/js/jquery.nice-select.min.js"></script>
<script src="/resources/js/mixitup.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>

</body>

</html>