<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="../main/main.jsp" />
<div class="main-panel">
   <div class="content-wrapper">
      <div class="d-xl-flex justify-content-between align-items-start">
         <h2 class="text-dark font-weight-bold mb-2">문화빛길 실시간 현황</h2>
      </div>
      <div class="row">
         <div class="col-md-12">
            <div
               class="d-sm-flex justify-content-between align-items-center transaparent-tab-border {">
            </div>
            <div class="tab-content tab-transparent-content">
               <div class="tab-pane fade show active" id="business-1"
                  role="tabpanel" aria-labelledby="business-tab">
                  <div class="row">
                     <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body text-center">
                              <h5 class="mb-2 text-dark font-weight-normal">회원가입자수</h5>
                              <h2 class="mb-4 text-dark font-weight-bold">${userCnt }</h2>
                              <!--                             <div class="dashboard-progress dashboard-progress-1 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-lightbulb icon-md absolute-center text-dark"></i></div> -->
                              <!--                             <p class="mt-4 mb-0">도와주세요</p> -->
                              <!--                             <h3 class="mb-0 font-weight-bold mt-2 text-dark">ㅠㅠ</h3> -->
                           </div>
                        </div>
                     </div>

                     <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body text-center">
                              <h5 class="mb-2 text-dark font-weight-normal">게시판 게시물</h5>
                              <h2 class="mb-4 text-dark font-weight-bold">${BoardCount}</h2>
                              <!--                             <div class="dashboard-progress dashboard-progress-2 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-account-circle icon-md absolute-center text-dark"></i></div> -->
                              <!--                             <p class="mt-4 mb-0">Increased since yesterday</p> -->
                              <!--                             <h3 class="mb-0 font-weight-bold mt-2 text-dark">50%</h3> -->
                           </div>
                        </div>
                     </div>

                     <div class="col-xl-3  col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body text-center">
                              <h5 class="mb-2 text-dark font-weight-normal">게시판댓글</h5>
                              <h2 class="mb-4 text-dark font-weight-bold">${replyCnt}</h2>
                              <!--                             <div class="dashboard-progress dashboard-progress-3 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-eye icon-md absolute-center text-dark"></i></div> -->
                              <!--                              <p class="mt-4 mb-0">Increased since yesterday</p> -->
                              <!--                             <h3 class="mb-0 font-weight-bold mt-2 text-dark">35%</h3>  -->
                           </div>
                        </div>
                     </div>

                     <div class="col-xl-3 col-lg-6 col-sm-6 grid-margin stretch-card">
                        <div class="card">
                           <div class="card-body text-center">
                              <h5 class="mb-2 text-dark font-weight-normal">영화한줄평</h5>
                              <h2 class="mb-4 text-dark font-weight-bold">${commentCnt }</h2>
                              <!--                             <div class="dashboard-progress dashboard-progress-4 d-flex align-items-center justify-content-center item-parent"><i class="mdi mdi-cube icon-md absolute-center text-dark"></i></div> -->
                              <!--                             <p class="mt-4 mb-0">Decreased since yesterday</p> -->
                              <!--                             <h3 class="mb-0 font-weight-bold mt-2 text-dark">25%</h3> -->
                           </div>
                        </div>
                     </div>
                  </div>


               </div>
            </div>
         </div>
      </div>
   </div>
   <jsp:include page="footer.jsp" />
</div>
             