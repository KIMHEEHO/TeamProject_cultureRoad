<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<title>Movie culture</title>

<style>
.page-heading {
	background-image:
		url("http://image.tmdb.org/t/p/w500${movie.backdrop_path}");
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
	padding: 215px 0px 170px 0px;
	text-align: center;
	position: relative;
}

.page-heading::before {
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(33, 37, 41, 0.8); /* 어두운 색상 설정 (rgba로 투명도 설정) */
}

.page-heading h2 {
	font-size: 56px;
	color: #fff; /* 흰색 글자색 유지 */
	font-weight: 700;
	position: relative; /* 부모 요소에 대해 상대적으로 설정 */
	z-index: 1; /* 텍스트가 가상 요소 위에 나타나도록 설정 */
}

.page-heading .div-dec {
	width: 80px;
	height: 6px;
	border-radius: 3px;
	background-color: #fff;
	margin: 20px auto 0 auto;
	position: relative; /* 부모 요소에 대해 상대적으로 설정 */
	z-index: 1; /* 요소가 가상 요소 위에 나타나도록 설정 */
}
</style>


</head>

<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav class="main-nav">
						<!-- ***** Logo Start ***** -->
						<a href="../../index.jsp" class="logo"> <img src="/resources/main/image/logo.png" alt="">
						</a>
						<!-- ***** Logo End ***** -->
						<!-- ***** Menu Start ***** -->
						<ul class="nav">
							<li class="scroll-to-section"><a href="#top" class="active">Main</a></li>
							<li class="scroll-to-section"><a href="#search">Search</a></li>
							<li class="scroll-to-section"><a href="#movie">Ranking</a></li>
							<li class="has-sub"><a href="javascript:void(0)">Movie</a>
								<ul class="sub-menu">
									<li><a href="about-us.jsp">Movie List</a></li>
									<li><a href="our-services.jsp">Movie Board</a></li>
									<li><a href="contact-us.jsp">Reservation</a></li>
								</ul></li>
							<li class="scroll-to-section"><a href="#bestComment">BestComment</a></li>
							<li><a href="">Notice</a> <c:choose>
									<c:when test="${empty userLogin}">
										<li><a href="/userLogin/signUpForm">회원가입</a></li>
										<li><a href="/userLogin/loginUser">로그인</a></li>
									</c:when>
									<c:when test="${not empty userLogin}">
										<li><a href="/userLogin/myPage">마이페이지</a></li>
										<li><a href="/userLogin/logout">로그아웃</a></li>
									</c:when>
								</c:choose>
						</ul>
						<a class='menu-trigger'> <span>Menu</span>
						</a>
						<!-- ***** Menu End ***** -->
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- ***** Header Area End ***** -->

	<div class="page-heading">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="header-text">
						<h2>${movie.title}</h2>
						<div class="div-dec"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- ***** Main Banner Area End ***** -->

	<section class="top-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="left-image">
						<img src="http://image.tmdb.org/t/p/w500${movie.backdrop_path}" alt="${movie.title}" class="img-fluid">
					</div>
				</div>
				<div class="col-lg-6 align-self-center">
					<div class="accordions is-first-expanded">
						<article class="accordion">
							<div class="accordion-head">
								<span>${movie.overview}</span>
							</div>
						</article>
						<article class="accordion">
							<div class="accordion-head">
								<div>
									<button type="button" name="choiceBtn" id="choiceBtn" class="btn btn-primary" data-num="${movie.id}">좌석 및 인원 선택</button>
								</div>
							</div>
						</article>
						<article class="accordion">
							<div class="accordion-head">
								<jsp:include page="Test.jsp" />
							</div>
						</article>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="simple-cta">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<h4>
						Business <em>Solutions</em> and <strong>Crypto</strong> Investments
					</h4>
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
	</section>

	<section class="what-we-do">
		<div class="container">
			<div class="row">
				<div class="col-lg-5">
					<div class="left-content">
						<h4>Please tell us about your idea and how you want it to be</h4>
						<p>
							If you need more HTML templates, you can try visiting TooCSS blog and Tooplate websites. You can get many good templates on those websites.<br> <br>Nulla non placerat neque, a gravida elit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Morbi sed dolor condimentum tellus commodo volutpat non malesuada turpis.
						</p>
						<div class="green-button">
							<a href="contact-us.html">Discover More</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="right-items">
						<div class="row">
							<div class="col-lg-6">
								<div class="item">
									<em>01</em>
									<h4>First Step</h4>
									<p>Pellentesque ipsum elit, congue a sapien laoreet, pellentesque ultricies risus.</p>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item">
									<em>02</em>
									<h4>Second Step</h4>
									<p>Pellentesque ipsum elit, congue a sapien laoreet, pellentesque ultricies risus.</p>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item">
									<em>03</em>
									<h4>Third Step</h4>
									<p>Pellentesque ipsum elit, congue a sapien laoreet, pellentesque ultricies risus.</p>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="item">
									<em>04</em>
									<h4>Fourth Step</h4>
									<p>Pellentesque ipsum elit, congue a sapien laoreet, pellentesque ultricies risus.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="partners">
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
				<div class="col-lg-2 col-sm-4 col-6">
					<div class="item">
						<img src="/resources/main/assets/images/client-01.png" alt="">
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<p>
						Copyright © 2022 Mexant Co., Ltd. All Rights Reserved. <br>Designed by <a title="CSS Templates" rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a> Distributed By <a title="CSS Templates" rel="sponsored" href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<!-- Bootstrap core JavaScript -->
	<script src="/resources/main/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/resources/main/assets/js/isotope.min.js"></script>
	<script src="/resources/main/assets/js/owl-carousel.js"></script>

	<script src="/resources/main/assets/js/tabs.js"></script>
	<script src="/resources/main/assets/js/swiper.js"></script>
	<script src="/resources/main/assets/js/custom.js"></script>
	<script>
		var interleaveOffset = 0.5;

		var swiperOptions = {
			loop : true,
			speed : 1000,
			grabCursor : true,
			watchSlidesProgress : true,
			mousewheelControl : true,
			keyboardControl : true,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			},
			on : {
				progress : function() {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						var slideProgress = swiper.slides[i].progress;
						var innerOffset = swiper.width * interleaveOffset;
						var innerTranslate = slideProgress * innerOffset;
						swiper.slides[i].querySelector(".slide-inner").style.transform = "translate3d("
								+ innerTranslate + "px, 0, 0)";
					}
				},
				touchStart : function() {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						swiper.slides[i].style.transition = "";
					}
				},
				setTransition : function(speed) {
					var swiper = this;
					for (var i = 0; i < swiper.slides.length; i++) {
						swiper.slides[i].style.transition = speed + "ms";
						swiper.slides[i].querySelector(".slide-inner").style.transition = speed
								+ "ms";
					}
				}
			}
		};

		var swiper = new Swiper(".swiper-container", swiperOptions);
	</script>

</body>
</html>