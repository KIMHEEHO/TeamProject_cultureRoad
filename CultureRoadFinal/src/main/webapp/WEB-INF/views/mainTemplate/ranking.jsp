<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
.movie {
margin-left:0;
}
</style>
<!-- 
 <section class="simple-cta">
    <div class="container">
      <div class="row">
        <div class="col-lg-5">
          <h4>Business <em>Solutions</em> and <strong>Crypto</strong> Investments</h4>
        </div>
        <div class="col-lg-7">
          <div class="buttons">
            <div class="green-button">
              <a href="#">Discover More</a>
            </div>
            <div class="orange-button">
              <a href="#">Contact Us</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> -->

<form id="detail" name="detail">
	<input type="hidden" id="id" name="id" />
</form>

<!-- //검색바 끝 -->
<div id="chartColor">
	<section id="movie">
		<div class="container">
			<div class="row">
				<div class="movie">
					<div class="movie_chart">
						<div class="swiper-container2">
							<div class="chart_cont1 swiper-wrapper">
								<c:forEach var="moviepop" items="${popular}">
									<div class="swiper-slide">
										<div class="poster">
											<figure>
												<img src="<c:out value='http://image.tmdb.org/t/p/w400${moviepop.poster_path}'/>" srcset="<c:out value='http://image.tmdb.org/t/p/w400${moviepop.poster_path} 2x'/>" alt="<c:out value='${moviepop.title}'/>">
											</figure>
											<div class="rank">
												<strong><c:out value='${moviepop.rank}' /></strong>
											</div>
										</div>
										<div class="infor">
											<h3>
												<!-- 					                            <span class="icon all ir_pm">전체관람가</span>  -->
												<strong><c:out value='${moviepop.title}' /></strong>
											</h3>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- //chart_cont1-->
						<div class="swiper-container2">
							<div class="chart_cont2 swiper-wrapper">
								<c:forEach var="movie" items="${movies}">
									<div class="swiper-slide">
										<div class="poster">
											<figure>
												<img src="<c:out value='http://image.tmdb.org/t/p/w400${movie.poster_path}'/>" srcset="<c:out value='http://image.tmdb.org/t/p/w400${movie.poster_path} 2x'/>" alt="<c:out value='${movie.title}'/>">
											</figure>
											<%-- 					                        <div class="rank"><strong><c:out value='${movie.rank}' /></strong></div> --%>
											<div class="mx">
												<span class="icon m ir_pm">MX</span> <span class="icon b ir_pm">Boutique</span>
												<!-- 필요한 정보를 여기에 추가하세요 -->
											</div>
										</div>
										<div class="infor">
											<h3>
												<!-- 					                            <span class="icon all ir_pm">전체관람가</span>  -->
												<strong><c:out value='${movie.title}' /></strong>
											</h3>
								
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- //chart_cont2-->

						<div class="swiper-container2">
							<div class="chart_cont3 swiper-wrapper">
								<c:forEach var="movieup" items="${upcoming}">
									<div class="swiper-slide">
										<div class="poster">
											<figure>
												<img src="<c:out value='http://image.tmdb.org/t/p/w400${movieup.poster_path}'/>" srcset="<c:out value='http://image.tmdb.org/t/p/w400${movieup.poster_path} 2x'/>" alt="<c:out value='${movieup.title}'/>">
											</figure>
											<%-- 					                        <div class="rank"><strong><c:out value='${loop.index + 1}' /></strong></div> --%>
											<div class="mx">
												<span class="icon m ir_pm">MX</span> <span class="icon b ir_pm">Boutique</span>
												<!-- 필요한 정보를 여기에 추가하세요 -->
											</div>
										</div>
										<div class="infor">
											<h3>
												<!-- 					                            <span class="icon all ir_pm">전체관람가</span>  -->
												<strong><c:out value='${movieup.title}' /></strong>
											</h3>
											<div class="infor_btn">

												<a href="#">상세정보</a> <a href="#">예매하기</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- //chart_cont3-->

						<div class="swiper-container2">
							<div class="chart_cont4 swiper-wrapper">
								<c:forEach var="movie" items="${movies}">
									<div class="swiper-slide">
										<div class="poster">
											<figure>
												<img src="<c:out value='http://image.tmdb.org/t/p/w400${movie.poster_path}'/>" srcset="<c:out value='http://image.tmdb.org/t/p/w400${movie.poster_path} 2x'/>" alt="<c:out value='${movie.title}'/>">
											</figure>
											<%-- 					                        <div class="rank"><strong><c:out value='${movie.rank}' /></strong></div> --%>
											<div class="mx">
												<span class="icon m ir_pm">MX</span> <span class="icon b ir_pm">Boutique</span>
												<!-- 필요한 정보를 여기에 추가하세요 -->
											</div>
										</div>
										<div class="infor" movie-data="">
											<h3>
												<span class="icon all ir_pm">전체관람가</span> <strong><c:out value='${movie.title}' /></strong>
											</h3>
											<div class="infor_btn">

												<a href="#" class="aa">상세정보</a> <a href="#">예매하기</a>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<!-- //chart_cont4-->

						<!-- //chart_cont4 end-->
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

<script>
   //영화차트 이미지 슬라이드
   var swiper = new Swiper('.swiper-container2',{
       slidesPerView: 4,
       spaceBetween: 24,
       mousewheel: {
           invert: true,
       },
       keyboard: {
           enabled: true,
           onlyInViewport: false,
       },
       autoplay: {
           delay: 4000,
       },
       breakpoints: {
           600: {
               slidesPerView: 1.4,
               spaceBetween: 24
           },
           768: {
               slidesPerView: 2,
               spaceBetween: 24
           },
           960: {
               slidesPerView: 3,
               spaceBetween: 24
           }
       }
   });
   
   //영화차트 탭 메뉴
   var movBtn = $(".movie_title > ul > li");    
   var movCont = $(".movie_chart > div");  

   movCont.hide().eq(0).show();

   movBtn.click(function(e){
       e.preventDefault();
       var target = $(this);         
       var index = target.index();  
       movBtn.removeClass("active");   
       target.addClass("active");    
       movCont.css("display","none");
       movCont.eq(index).css("display","block");
   });
</script>