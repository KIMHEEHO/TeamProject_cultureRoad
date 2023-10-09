<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/mainTemplate/header.jsp"%>

<script type = "text/javascript" src = "/resources/lightbox/js/lightbox.min.js"></script> 

<script type="text/javascript">
function template(title, type, url){
   let $ul = $("#list");
   let $element = $("#item-template").clone().removeAttr('id');
   $element.attr("title", title);
   $element.attr("url", url);
   
   $element.find('.item-title').html(title);
   $element.find('.item-url').html(url);
   $element.find('.item-sub').html(type);
   
   $ul.append($element);
   
}

$(function(){
  
   $.ajax({
      url: "/data/showList",
      type: "get",
      dataType: "xml",
      success : data => {
      $(data).find('item').each(function(){
   
         let title = $(this).find("title").text();
         let type = $(this).find("type").text();
         let url = $(this).find("url").text();
         
         
         template(title, type, url);
         }); // end of each
         
      // "detailBtn" 버튼 클릭 이벤트 리스너 추가
      $(document).on('click', '.detailBtn', function() {
         var url = $(this).closest('.item').attr("url");
         window.location.href = url;
      });
         
      }, error : (xhr, textStatus, errorThrown) => {
         alert(textStatus + " (HTTP-   " + xhr.status + " / " + errorThrown + ")");   
      }
   }); //end of ajax   
 

});

</script>
<style type="text/css">
body{
background-color:rgb(32,33,49);
}


#item-template {
   display: none;
}

</style>
</head>
<body>
   <div class="card" style="padding-left:100px; padding-top:110px; padding-bottom:100px; background-color:rgb(32,33,49);">
      <div class="row" id="list">
         <div id="item-template" class="card-header col-sm-6 col-md-4 item" >
            <div class="thumbnail" style="background-color:white; height:320px; width:300px;">
               <div class="caption card-body" ">
                  <img class="item-sub" src="/resources/showView/showview.png" style="margin-bottom:10px; width:220px;">
                  <h3 class="item-title" style="height:60px; font-size:22px; color:black"></h3>
                  <p class="item-btn card-footer" style="margin-top:30px; background-color:white;">
                     <a class="btn btn-success detailBtn" role="button" style="margin-left:60px;">상세정보</a>
                  </p>
               </div>
            </div>
         </div>
      </div>
   </div>
   
   <jsp:include page="/WEB-INF/views/mainTemplate/footer.jsp"/>

</body>
</html>