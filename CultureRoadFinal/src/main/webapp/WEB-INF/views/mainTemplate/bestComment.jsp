<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<section class="bestComment" id="bestComment">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-heading">
					<h6>MOVIE comment</h6>
					<h4>Best Comment</h4>
				</div>
			</div>
			<div class="col-lg-10 offset-lg-1">
				<div class="owl-testimonials owl-carousel"
					style="position: relative; z-index: 5;">
					<c:forEach var="best" items="${best}">
						<div class="container">
							<div class="row">
								<div class="col-md-12">
									<div class="item">
										<img style="width: 400px; float: left; margin-right: 20px;" src="http://image.tmdb.org/t/p/w500${best.poster_path}" />
										<div class="container">
										    <div class="row">
										        <div class="col-md-12">
										            <div class="box">
										                <div class="bestcomment p-6">
										                    <h2 class="mb-3">${best.title}</h2>
										                    <blockquote class="blockquote">                                         
										                        <h4 class="mb-0" style="font-weight: bold;">${best.mvCoContent}</h4>
										                    </blockquote>
										                    <h5 class="mb-0 text-muted">💁‍♂️${best.userName}</h5>
										                    <br>
										                    <h4 style="font-weight: bold;"> 좋아요 : ${best.likeCount}</h4>
										                    <div class="right-image"></div>
										                </div>
										            </div>
										        </div>
										    </div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</section>

