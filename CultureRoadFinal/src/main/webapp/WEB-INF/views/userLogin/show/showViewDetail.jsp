<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<!-- <script type="text/javascript" src="/resources/js/lightbox.min.js"></script> -->
<script type="text/javascript">
function  template(title, type, period, eventPeriod, eventSite, charge, contactPoint, url, imageObject, description, viewCount){
    let $div = $("#detailData");
    
    let $element = $("#item-template").clone().removeAttr('id');

    $element.find('.item-title').html(title);
    $element.find('.item-description').html(description);
    
    $element.find('.item-type').html(type);
    $element.find('.item-period').html(period);
    $element.find('.item-eventPeriod').html(eventPeriod);
    $element.find('.item-eventSite').html(eventSite);
    $element.find('.item-charge').html(charge);
    $element.find('.item-contactPoint').html(contactPoint);
    $element.find('.item-url').html(url);
    $element.find('.item-viewCount').html(viewCount);
    
    for (let i = 0; i < imgObject.length; i++) {
    	   let img = $("<img />");
    	   img.attr("src", imgObject[i]);
    	   img.addClass("imageObject");
    	   $element.find('.item-imageObject').append(img);
    	}
    
    $div.append($element);
 } 
   
    //rest써서 수정
    $(function() {
        //$(".contentLayout .page-header h1").html("충남관광 - 관광명소 상세정보");
		// /data/chungnamDetail?mng_no=12345(rest 쓰기 전)
		// /data/chungnamDetail/12345(rest 쓰고 나서)
		let title = "<%= request.getParameter("title") %>";
		title = encodeURIComponent(title);
        
        $.ajax({
        	url: "/data/showDetail?title=" + encodeURIComponent(title),
        	type: "get",
          dataType: "xml",
          success: function(data) {
            let item = $(data).find("item");
            let title = item.find("title").text();
            let type = item.find("type").text();
            let period = item.find("period").text();
            let eventPeriod = item.find("eventPeriod").text();
            
            let eventSite = item.find("eventSite").text();
            let charge = item.find("charge").text();
            let contactPoint = item.find("contactPoint").text();
            let url = item.find("url").text();
            
            let imageObject = item.find("imageObject").text();
            let viewCount = item.find("viewCount").text();

            let imgObject = [];
            imageObject.push($(data).find("imageObject").text());
            imageObject.push($(data).find("imageObject").text());
            imageObject.push($(data).find("imageObject").text());
            
            template(title, type, period, eventPeriod, eventSite, charge, contactPoint, url, imageObject, description, viewCount);
          },
          error: function(xhr, textStatus, errorThrown) {
            alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
          }
        });
        
    $("#showViewList").click(function() {
       location.href = "/data/showView";
    })
  });
</script>
</head>
<body>
   <div class="contentContainer container">
      <div id="detailData">
         <div class="panel panel-default" id="item-template">
            <!-- Default panel contents -->
            <div class="panel-heading item-title"></div>
            <div class="panel-body">
               <p class="item-description"></p>
            </div>

            <!-- table -->
            <table class="table">
               <tbody class="detail-content">
                  <tr class="item">
                     <td class="detail-title col-md-2">기간</td>
                     <td class="item-type col-md-10"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">기간</td>
                     <td class="item-period"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">시간</td>
                     <td class="item-eventPeriod"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">장소</td>
                     <td class="item-eventSite"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">금액</td>
                     <td class="item-charge"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">문의안내</td>
                     <td class="item-contactPoint"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">URL</td>
                     <td class="item-url"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">조회수</td>
                     <td class="item-viewCount"></td>
                  </tr>
                  <tr class="item">
                     <td class="detail-title">이미지</td>
                     <td class="item-imageObject"></td>
                  </tr>

               </tbody>
            </table>
         </div>
      </div>
      <div class="text-right">
         <button type="button" class="btn btn-info" id="showViewList">목록</button>
      </div>
   </div>
</body>
</html>