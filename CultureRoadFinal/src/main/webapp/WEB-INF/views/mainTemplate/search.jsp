<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

<style>
#searchImg{
	height:30px;
}

 .contentContainer {
	display: flex;
	flex-direction: column;
	align-items: center;
	text-align: center;
	margin-top: 20px; /* 원하는 여백 설정 */
} 
</style>
<script>
	$(function(){
	})
</script>


<section class="contentContainer" id="search">
	<div class="container mt-3">
		<div class="row">
			<div class="text-right">
				<form id="search1" name="search" class="d-flex">
					<input type="text" class="form-control me-2"
						placeholder="관심있는 영화를 검색해 보세요." name="title1" id="title1">
					<button class="btn btn-outline-secondary" type="button"
						id="searchBtn" name="searchBtn">
						<img
							src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
							alt="Search" class="img-fluid" id="searchImg">
					</button>
				</form>
			</div>
		</div>
		<div class="calender">
			<%@ include file="/WEB-INF/views/mainTemplate/calender.jsp" %>
		</div>
	</div>
</section>


<!-- 
  <section class="partners">
    <div class="container">
      <div class="row">
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
           
          </div>
        </div>
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
            
          </div>
        </div>
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
          
          </div>
        </div>
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
           
          </div>
        </div>
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
        
          </div>
        </div>
        <div class="col-lg-2 col-sm-4 col-6">
          <div class="item">
          
          </div>
        </div>
      </div>
    </div>
  </section> -->