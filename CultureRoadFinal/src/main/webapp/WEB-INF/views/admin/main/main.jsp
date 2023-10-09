<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/userLogin.jspf"%>

<script type="text/javascript">
   $(function(){
      $("#adminLogout").click(function(){
         location.href = "/admin/logout"
      })
   })
      
   </script>

	<style>
	  .contentContainer {
       background-color: #f9f9f9;
       border-radius: 8px;
       box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
       height: auto; /* 이 부분을 자동으로 높이 조정되도록 변경 */
       overflow-y: auto; /* 내용이 컨테이너를 벗어날 경우 스크롤바 표시 */
   }
	.logo {
		margin-left:20px;
		display: flex;
		justify-content: center; /* 수평 가운데 정렬 */
		}
	</style>

</head>
<body>
   <c:if test="${empty adminLogin}">
      <%@ include file="/WEB-INF/views/admin/login/adminLogin.jsp"%>
   </c:if>
   <c:if test="${not empty adminLogin}">
      <!-- partial:partials/_navbar.html -->
      <nav
         class="navbar default-layout-navbar col-lg-12 col-12 p-0 d-flex flex-row">
         <div
            class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">

            <!--           <a class="navbar-brand brand-logo" href="/admin/main"><img src="/resources/main/image/logo.png" alt="logo"/></a> -->
            <!--           <a class="navbar-brand brand-logo-mini" href="index.html"><img src="assets/images/logo-mini.svg" alt="logo" /></a> -->
         </div>
         <div class="navbar-menu-wrapper d-flex align-items-stretch">
          <%--   ${adminLogin.managerId} --%>
            <!--           <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize"> -->
            <!--             <span class="mdi mdi-menu"></span> -->
            <!--           </button> -->
            <div class="search-field d-none d-xl-block">
               <!--  검색창 -->
               <!--             <form class="d-flex align-items-center h-100" action="#"> -->
               <!--               <div class="input-group"> -->
               <!--                 <div class="input-group-prepend bg-transparent"> -->
               <!--                   <i class="input-group-text border-0 mdi mdi-magnify"></i> -->
               <!--                 </div> -->
               <!--                 <input type="text" class="form-control bg-transparent border-0" placeholder="Search products"> -->
               <!--               </div> -->
               <!--             </form> -->
            </div>
            <button
               class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
               type="button" data-toggle="offcanvas">
               <span class="mdi mdi-menu"></span>
            </button>
         </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
         <!-- partial:partials/_sidebar.html -->
         <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <a class="logo"  href="/admin/main">
               <img src="/resources/main/image/logo.png" id="logo" alt="logo" style="display: flex;
			justify-content: center;"/></a>
            <ul class="nav">
               <!--             <li class="nav-item nav-category">Main</li> -->
               <li class="nav-item"><a class="nav-link" href="/admin/main">
                     <span class="icon-bg"><i class="mdi mdi-cube menu-icon"></i></span>
                     <span class="menu-title">Dashboard</span>
               </a></li>
               <li class="nav-item"><a class="nav-link" href="/admin/user/manageUsers"> 
                  <span class="icon-bg"><i class="mdi mdi-account menu-icon"></i></span> 
                  <span class="menu-title">사용자 관리</span>
               </a></li>
               <li class="nav-item"><a class="nav-link" href="/admin/notice/board"> 
                  <span class="icon-bg"><i class="mdi mdi-book-open-page-variant menu-icon"></i></span> 
                  <span class="menu-title">공지게시판 관리</span>
               </a></li>
               <li class="nav-item"><a class="nav-link" href="/admin/qna/qnaAdmin"> 
                  <span class="icon-bg"><i class="mdi mdi-book-multiple-variant menu-icon"></i></span> 
                  <span class="menu-title">Q&A게시판 관리</span>
               </a>
               <li class="nav-item"><a class="nav-link"
                  href="/admin/movie/mvBoard/"> <span class="icon-bg"><i
                        class="mdi mdi-book-plus menu-icon"></i></span> <span
                     class="menu-title">영화게시판 관리</span>
               </a></li>
                  <li class="nav-item"><a class="nav-link"
                  href="/admin/reply/all"> <span class="icon-bg"><i
                        class="mdi mdi-book-minus menu-icon"></i></span> <span
                     class="menu-title">영화 게시판 댓글 관리</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/admin/culture/board"> <span class="icon-bg"><i
                        class="mdi mdi-book-plus menu-icon"></i></span> <span
                     class="menu-title">문화예술 게시판 관리</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/admin/culture/all"> <span class="icon-bg"><i
                        class="mdi mdi-book-minus menu-icon"></i></span> <span
                     class="menu-title">문화예술 게시판 댓글 관리</span>
               </a></li>
                <li class="nav-item"><a class="nav-link"
                  href="/admin/admincommentList"> <span class="icon-bg"><i
                        class="mdi mdi-bookmark-check menu-icon"></i></span> <span
                     class="menu-title">한줄평 관리</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/admin/paymentList"> <span class="icon-bg"><i
                        class="mdi mdi-coin menu-icon"></i></span> <span
                     class="menu-title">결제 관리</span>
               </a></li>
              
               <!--            <li class="nav-item documentation-link"> -->
               <!--               <a class="nav-link" href="http://www.bootstrapdash.com/demo/connect-plus-free/jquery/documentation/documentation.html" target="_blank"> -->
               <!--                 <span class="icon-bg"> -->
               <!--                   <i class="mdi mdi-file-document-box menu-icon"></i> -->
               <!--                 </span> -->
               <!--                 <span class="menu-title">Documentation</span> -->
               <!--               </a> -->
               <!--             </li> -->


               <li class="nav-item sidebar-user-actions">
                  <div class="sidebar-user-menu">
                     <a href="/admin/logout" class="nav-link">
                     <i class="mdi mdi-logout menu-icon"></i> 
                     <span class="menu-title">LogOut</span></a>
                  </div>
               </li>
            </ul>
         </nav>

         <!-- partial -->
         <%-- <div class="main-panel">
            <div class="content-wrapper">
               <div class="d-xl-flex justify-content-between align-items-start">

                <jsp:include page="adminDashboard.jsp" />
            </div>

            <!-- content-wrapper ends -->
            <!-- partial:partials/_footer.html -->
            <jsp:include page="footer.jsp" />
            <!-- partial -->
         </div>
      </div> --%>
   </c:if>
   <!-- main-panel ends -->
   <!-- page-body-wrapper ends -->
   <!-- container-scroller -->
   <!-- plugins:js -->
   <script
      src="/resources/adminMain/assets/vendors/js/vendor.bundle.base.js"></script>
   <!-- endinject -->
   <!-- Plugin js for this page -->
   <script src="/resources/adminMain/assets/vendors/chart.js/Chart.min.js"></script>
   <script
      src="/resources/adminMain/assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
   <script src="/resources/adminMain/assets/js/jquery.cookie.js"
      type="text/javascript"></script>
   <!-- End plugin js for this page -->
   <!-- inject:js -->
   <script src="/resources/adminMain/assets/js/off-canvas.js"></script>
   <script src="/resources/adminMain/assets/js/hoverable-collapse.js"></script>
   <script src="/resources/adminMain/assets/js/misc.js"></script>
   <!-- endinject -->
   <!-- Custom js for this page -->
   <script src="/resources/adminMain/assets/js/dashboard.js"></script>
   <!-- End custom js for this page -->
</body>
</html>