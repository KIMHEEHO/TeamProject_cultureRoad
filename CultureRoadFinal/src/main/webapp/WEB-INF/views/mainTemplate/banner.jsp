<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
     <script>
     
     var swiper = new Swiper('.swiper-container',{
          pagination: {
              el: '.swiper-pagination',
          },
          navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
          },
          autoplay: {
              delay: 5000,
          },
      });
     
     <script>
     var IMP = window.IMP; 
     IMP.init("imp15631721"); 
   
     var today = new Date();   
     var hours = today.getHours(); // 시
     var minutes = today.getMinutes();  // 분
     var seconds = today.getSeconds();  // 초
     var milliseconds = today.getMilliseconds();
     var makeMerchantUid = hours +  minutes + seconds + milliseconds;
     

     function requestPay() {
         IMP.request_pay({
             pg : 'kakaopay',
             pay_method : 'card',
             merchant_uid: "IMP"+makeMerchantUid, 
             name : '문화빛길',
             amount : 100,
             buyer_email : 'Iamport@chai.finance',
             buyer_name : '문화빛길',
             buyer_tel : '010-1234-5678',
             buyer_addr : '서울특별시 강남구 삼성동',
             buyer_postcode : '123-456'
         }, function (rsp) { // callback
             if (rsp.success) {
                 console.log(rsp);
             } else {
                 console.log(rsp);
             }
         });
     }
 </script>
 
 <script type="text/javascript">
 	$(function(){
 		$("#home").attr({class : "active"});
 	})
 </script>

 
 
 <!-- ***** Main Banner Area Start ***** -->
<!-- ***** Main Banner Area Start ***** -->
  <div class="swiper-container" id="top">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <div class="slide-inner" style="background-image:url(/resources/main/image/sleep.jpg)">
          <div class="container">
            <div class="row">
              <div class="col-lg-8">
                <div class="header-text">
                  <h2>우리의 <em>잠 </em> 속으로<br>누군가<em>들어왔다.</em></h2>
                  <div class="div-dec"></div>
                  <p><strong>행복한 신혼부부 ‘현수’(이선균)와 ‘수진’(정유미). 어느 날, 옆에 잠든 남편 ‘현수’가 이상한 말을 중얼거린다. “누가 들어왔어” 그날 이후, 잠들면 마치 다른 사람처럼 변하는 ‘현수’. 깨어나면 아무것도 기억하지 못하는 ‘현수’는 잠들면 가족들을 해칠까 두려움을 느끼고 ‘수진’은 매일 잠드는 순간 시작되는 끔찍한 공포 때문에 잠들지 못한다. 치료도 받아보지만 ‘현수’의 수면 중 이상 행동은 점점 더 위험해져가고 ‘수진’은 곧 태어날 아이까지 위험에 빠질지도 모른다는 생각에 갖은 노력을 다해보는데…</strong></p>
                  <div class="buttons">
                    <div class="green-button">
                      <!-- <a href="#">영화 상세보기</a> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="slide-inner" style="background-image:url(/resources/main/image/elemental.jpg)">
          <div class="container">
            <div class="row">
              <div class="col-lg-8">
                <div class="header-text">
                  <h2><em style="color:yellow;">엘리멘트 시티로</em> 여러분을<br>초대합니다!</h2>
                  <div class="div-dec"></div>
                  <p style="color:white;"><strong>불, 물, 공기, 흙 4개의 원소들이 살고 있는 ‘엘리멘트 시티’ 재치 있고 불처럼 열정 넘치는 ‘앰버'는 어느 날 우연히 유쾌하고 감성적이며 물 흐르듯 사는 '웨이드'를 만나 특별한 우정을 쌓으며, <br />지금껏 믿어온 모든 것들이 흔들리는 새로운 경험을 하게 되는데... 웰컴 투 ‘엘리멘트 시티’!</strong></p>
                  <div class="buttons">
                 <div class="green-button">
                      <!-- <a href="#">영화 상세보기</a> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="swiper-slide">
        <div class="slide-inner" style="background-image:url(/resources/main/image/oppenheimer.jpg)">
          <div class="container">
            <div class="row">
              <div class="col-lg-8">
                <div class="header-text">
                  <h2><em style = "color : blue">크리스토퍼 놀란</em>감독 작품</h2>
                  <div class="div-dec"></div>
                  <p><strong>“나는 이제 죽음이요, 세상의 파괴자가 되었다.” 세상을 구하기 위해 세상을 파괴할 지도 모르는 선택을 해야 하는 천재 과학자의 핵개발 프로젝트.</strong></p>
                  <div class="buttons">
                 <div class="green-button">
                      <!-- <a href="#">영화 상세보기</a> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="swiper-button-next swiper-button-white"></div>
    <div class="swiper-button-prev swiper-button-white"></div>
  </div>
 
  <!-- ***** Main Banner Area End ***** -->