<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript">
	$(function() {
		$(".movieinfo").click(function() {
			let id = $(this).attr("data-num");
			console.log("id :", id);
			$("#id").val(id);
			$("#detail").attr({
				method : "post",
				action : "/movieDetail/" + id
			})
			$("#detail").submit();
		})
		
		$("#searchBtn").click(function(){
	         $("#search1").attr({
	            method : "post",
	            action : "/movie/movieSearch"
	         })
	         $("#search1").submit();
	      })

	})
	</script>
    <style type="text/css">
     	.movieDetail{ 
      		height: 540px; 
      		width : 380px; 
     	} 
    </style>
</head>
<body class="d-flex flex-column min-vh-100">
 	
 	<jsp:include page="mainTemplate/header.jsp"/>
 	<jsp:include page="mainTemplate/banner.jsp"/>
	<jsp:include page="mainTemplate/search.jsp"/>
 	<jsp:include page="mainTemplate/ranking.jsp"/>
	<jsp:include page="mainTemplate/bestComment.jsp"/>
 	<jsp:include page="mainTemplate/footer.jsp"/>
  </body>
</html>