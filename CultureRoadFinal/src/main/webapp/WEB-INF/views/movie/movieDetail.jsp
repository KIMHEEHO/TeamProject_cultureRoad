<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Orbit&display=swap"
	rel="stylesheet">
<title>Movie culture</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="/resources/movieDetail/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/plyr.css"
	type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/style.css"
	type="text/css">

<script type="text/javascript">
	$(document).ready(function() {
		const movieDetailBtn = $("#movieDetail");
		const oneLineReviewBtn = $("#oneLineReview");

		const movieDetailContent = $(".moreInformation");
		const oneLineReviewContent = $("#review1");

		movieDetailBtn.click(function() {
			movieDetailContent.show();
			oneLineReviewContent.hide();
		});

		oneLineReviewBtn.click(function() {
			movieDetailContent.hide();
			oneLineReviewContent.show();
		});
	});

	$(function() {
		/*  $("#reservationBtn").click(function() {
			let id= $(this).attr("data-num");
			console.log("id :", id);
			//console.log("title :", title); 
			$("#detail1").attr({
				method : "post",
				action : "/SelectReservationDate/" + id 
			});
			$("#detail1").submit(); 
		}); */
		$("#reservationBtn").click(function(){
			let id=$(this).attr("data-num");
			console.log("id : ",id);
			let userId = "<c:out value='${userLogin.userId}'/>";
			if(userId==""){
				alert("로그인 후 이용가능합니다.");
				location.href="/userLogin/loginUser";
			}else{
				$("#detail1").attr({
					method : "post",
					action : "/SelectReservationDate/" + id 
				});
				$("#detail1").submit();
			}
		})
	});
</script>

</head>

<body style="background-color: #0b0c2a; margin-top: -50px;">
	<!-- Page Preloder -->

	<!-- Header Section Begin -->
	<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>

	<!-- Header End -->
	<form id="detail1" name="detail">
		<input type="hidden" id="id" name="id" value="${movie.id}" /> 
		<input type="hidden" id="title" name="title" value="${movie.title}" />

		<!-- Anime Section Begin -->
		<section class="anime-details spad" style="background-color: #0b0c2a">
			<div class="container">
				<div class="anime__details__content">
					<div class="row">
						<div class="col-lg-3">
							<div class="anime__details__pic set-bg"
								data-setbg="http://image.tmdb.org/t/p/w500${movie.poster_path}">
								<div class="comment">
									<i class="fa fa-comments"></i>${commentCnt.commentCnt}
								</div>
								<div class="view">
									<i class="fa fa-eye"></i> ${movie.vote_count}
								</div>
							</div>
							<br>
						</div>
						<div class="col-lg-9">
							<div class="anime__details__text">
								<div class="anime__details__title">
									<h3>${movie.title}</h3>
								</div>
								<div class="anime__details__rating">
									<div class="rating">
										<c:choose>
											<c:when test="${movie.vote_average <= 2.0}">
												<i class="fa fa-star"></i>
											</c:when>
											<c:when test="${movie.vote_average <= 4.0}">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</c:when>
											<c:when test="${movie.vote_average <= 6.0}">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</c:when>
											<c:when test="${movie.vote_average <= 8.0}">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</c:when>
											<c:when test="${movie.vote_average <= 10.0}">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</c:when>
										</c:choose>
									</div>
								</div>
								<p>${movie.overview}</p>
								<div class="anime__details__widget">
									<div class="row">
										<div class="col-lg-6 col-md-6">
											<ul>
												<li><span>Type :</span> MOVIE</li>
												<li><span>release_date:</span>${movie.release_date}</li>
												<li><span>Status:</span> Now showing</li>
												<li><span>Genre:</span> <c:forEach
														items="${movie.genres}" var="genre">
													${genre.name}
												</c:forEach></li>
											</ul>
										</div>
										<div class="col-lg-6 col-md-6">
											<ul>
												<li><span>Scores:</span>${movie.vote_average} / 10</li>
												<li><span>Duration:</span>${movie.runtime}분</li>
												<li><span>Quality:</span> HD</li>
												<li><span>Views:</span>${movie.vote_count}</li>
											</ul>
										</div>
									</div>
								</div>
								<button type="button" id="reservationBtn" name="reservationBtn" data-num="${movie.id}">예매하기</button>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="anime__details__review">
							<jsp:include page="movieDetailComent.jsp" />
						</div>
					<%-- 	<div class="col-lg-4 col-md-4">
							<div class="anime__details__sidebar">
								<article class="accordion">
									<div class="accordion-head"
										style="background-color: white; border-radius: 7px;">
										<h1 style="text-align: center;">영화날짜 선택</h1>
										<jsp:include page="SelectReservationDate.jsp" />
									</div>
								</article>
								<article class="accordion"
									style="background-color: white; text-align: center; margin-top: -25px; padding-bottom: 10px; border-radius: 7px;">
									<div>
										<button type="button" name="choiceBtn" id="choiceBtn"
											class="btn btn-primary" data-num="${movie.id}">좌석 및
											인원 선택</button>
									</div>
								</article>
							</div>
						</div> --%>
					</div>
					
				</div>
			</div>
		</section>
	</form>
	<!-- Anime Section End -->

	<!-- Footer Section Begin -->
	<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%>

	<!-- Footer Section End -->


	<!-- Js Plugins -->
	<script src="/resources/movieDetail/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/movieDetail/js/bootstrap.min.js"></script>
	<script src="/resources/movieDetail/js/player.js"></script>
	<script src="/resources/movieDetail/js/jquery.nice-select.min.js"></script>
	<script src="/resources/movieDetail/js/mixitup.min.js"></script>
	<script src="/resources/movieDetail/js/jquery.slicknav.js"></script>
	<script src="/resources/movieDetail/js/owl.carousel.min.js"></script>
	<script src="/resources/movieDetail/js/main.js"></script>

</body>

</html>