<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
#item-template {
   display: none;
}

#mvCoContent {
   width: 780px;
   font-size: 15px;
   color: #b7b7b7;
   padding-left: 20px;
   padding-top: 12px;
   height: 110px;
   border: none;
   border-radius: 5px;
   resize: none;
   margin-bottom: 24px;
}

#mvCoContent {
   color: black;
   font-size: large;
   font-weight: bold;
}

#comment {
   color: white;
   font-size: 20px;
   font-weight: bold;
}

.likenumber {
   color: white;
}
</style>
<script type="text/javascript">
   $(function() {
      
      /** 기본 덧글 목록 불러오기 */
      let id = ${movie.id};
      let title = "${movie.title}";
      listAll(id);
      let postPath ="${movie.poster_path}";
      let commentUserName = "${userLogin.userName}";
      
      /** 글입력을 위한 Ajax 연동 처리 */
      $(document).on("click",   "#commentInsertBtn",function() {
               //alert("버튼 클릭 이벤튼 시작");  // 추가: 버튼이 클릭되었는지 확인
               let insertUrl = "/comment/commentInsert";

               // Check if user is logged in
               if (!"${userLogin.userName}") {
                  alert("로그인을 하고 이용해주시기 바랍니다.");
                  window.location.href = "/userLogin/loginUser";
                  return;
               }

               let value = JSON.stringify({
                  id : id,
                  title : title,
                  userName : "${userLogin.userName}",
                  mvCoContent : $("#mvCoContent").val(),
                  userNo :  "${userLogin.userNo}",
                  poster_path: postPath
               });
               $.ajax({
                  url : insertUrl,
                  type : "post", // 전송 시 method 방식
                  headers : {
                     "Content-Type" : "application/json"
                  },
                  dataType : "text",
                  data : value,
                  error : function(xhr, textStatus, errorThrown) { // 실행시 오류가 발생하였을 경우
                     alert(textStatus + " (HTTP-" + xhr.status + " / "+ errorThrown + ")");
                     //alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.");   
                  },
                  beforeSend : function() { // 전송 전 유효성 체크
                     if (!checkForm("#mvCoContent", "한줄평을")) return false;
                  },
                  success : function(result) { // 서버로부터 응답코드 200으로 정상 처리가 되었을 경우
                     if (result == "SUCCESS") {
                        alert("댓글 등록이 완료 되었습니다.");
                        dataReset(); // 입력폼 초기화
                        listAll(id);
                     }
                  }
               });
            });

      /* 비밀번호 확인없이 수정버튼 제어 */
      $(document).on("click", "button[data-btn='upBtn']", function() {
         let panel = $(this).parents("div.panel");
         let mvCoNum = panel.attr("data-num");

          // Check if the comment belongs to the current user
          let commentUserName = panel.find('.anime__review__item__text .name').html();
          if (commentUserName !== "${userLogin.userName}") {
              alert("다른 사용자가 작성한 댓글입니다.");
              return;
          }

          updateForm(mvCoNum, panel);
      });

      //수정중 취소버튼 event
      $(document).on("click", "button[class='btn btn-success resetBtn']",
            function() {
               $("#mvCoContent, #userName").val("");
               dataReset();
            });

      /** 수정을 위한 Ajax 연동 처리 */
      $(document).on("click", "#commentUpdateBtn", function() {
               let mvCoNum = $(this).attr("data-mv_co_num");
               $.ajax({
                  url : '/comment/' + mvCoNum,
                  type : 'put',
                  headers : {
                     "Content-Type" : "application/json",
                     "X-HTTP-Method-Override" : "PUT"
                  },
                  data : JSON.stringify({
                     mvCoContent : $("#mvCoContent").val()
                  }),
                  dataType : 'text',
                  error : function(xhr, textStatus, errorThrown) {
                     alert(textStatus + "(HTTP-" + xhr.status + " / "
                           + errorThrown + ")");
                  },
                  beforeSend : function() {
                     if (!checkForm("#mvCoContent", "한줄평을"))
                        return false;
                  },
                  success : function(result) {
                     console.log("result:" + result);
                     if (result == "SUCCESS") {
                        alert("댓글 수정이 완료되었습니다.");
                        dataReset();
                        listAll(id);
                     }
                  }
               });
            });

      /* 비밀번호 확인없이 삭제버튼 제어 */
      $(document).on("click", "button[data-btn='delBtn']", function() {
          let panel = $(this).parents("div.panel");
          let mvCoNum = panel.attr("data-num");

          // Check if the comment belongs to the current user
          let commentUserName = panel.find('.anime__review__item__text .name').html();
          if (commentUserName !== "${userLogin.userName}") {
              alert("다른 사용자가 작성한 댓글입니다.");
              return;
          }

          deleteBtn(id, mvCoNum);
      });
   }); // 최상위 $ 종료

   function dataReset() {
      $("#commentForm").each(function() {
         this.reset();
      });

      $("#userName").prop("readonly", false);
      $("#commentForm button[type='button']").removeAttr("data-mv_co_num");
      $("#commentForm button[type='button']").attr("id", "commentInsertBtn");
      $("#commentForm button[type='button'].sendBtn").html("<i class='fa fa-location-arrow'></i> 등록");
      $("#commentForm button[type='button'].resetBtn").detach();
   }

   function deleteBtn(id, mvCoNum) {
      if (confirm("선택하신 한줄평을 삭제하시겠습니까?")) {
         $.ajax({
            url : '/comment/' + mvCoNum,
            type : 'delete', //method - get(조회-R)/post(입력-C)/put(수정-U)/delete(삭제-D) 명시
            headers : {
               "X-HTTP-Method-Override" : "DELETE"
            },
            dataType : 'text',
            error : function(xhr, textStatus, errorThrown) { //실행시 오류가 발생하였을 경우
               alert(textStatus + "(HTTP-" + xhr.status + " / "
                     + errorThrown + ")");
            },
            success : function(result) {
               if (result == "SUCCESS") {
                  alert("댓글 삭제가 완료되었습니다.");
                  listAll(id);
               }
            }
         });
      }
   }

   /* 댓글 목록을 보여주는 함수 */
   function listAll(id) {
      $(".comment").detach(); //detach():선택한 요소를 DOM트리에서 삭제.
      let url = "/comment/all/" + id;
      $.getJSON(url, function(data) { //data = [{...r_num:1,r_name:"홍길동"...},{...}]
         $(data).each(function(index) {
            let mvCoNum = this.mvCoNum;
            let likeCount = this.likeCount;
            let userName = this.userName;
            let mvCoContent = this.mvCoContent;
            let mvCoWriteDate = this.mvCoWriteDate;
            mvCoContent = mvCoContent.replace(/(\r\n|\r|\n)/g, "<br/>");

            template(mvCoNum, userName, mvCoContent, mvCoWriteDate, likeCount);
            console.log(mvCoNum, userName, mvCoContent, mvCoWriteDate, likeCount);
         });
      }).fail(function() {
         alert("댓글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.");
      });
   }

   /* 새로운 글을 화면에 추가하기(보여주기) 위한 함수 */
   function template(mvCoNum, userName, mvCoContent, mvCoWriteDate, likeCount) {
      let $div = $("#reviewList");
      
      

      let $element = $("#item-template").clone().removeAttr('id');
      $element.attr("data-num", mvCoNum);
      $element.addClass("comment");
       // 각 댓글의 좋아요 수를 표시할 span 요소를 추가합니다.
       let likeCountSpan = document.createElement('span');
       likeCountSpan.id = 'likeCount_' + mvCoNum;  // 각 댓글에 대한 고유 ID
       likeCountSpan.innerText = '좋아요 개수: 0';  // 초기 좋아요 개수
       $element.find('.anime__review__item__text').append(likeCountSpan);
      $element.find('.anime__review__item > .anime__review__item__text > .name').html(userName);
      $element.find('.anime__review__item > .anime__review__item__text > .date').html(mvCoWriteDate + " / 좋아요 : " +likeCount);
      $element.find('#comment').html(mvCoContent);
      $div.append($element);
   }

   /* 수정 폼 화 */
   function updateForm(mvCoNum, panel) {
      $("#commentForm .resetBtn").detach();

      //$("#userName").val(panel.find(".anime__review__item__text .name").html());
      //$("#userName").prop("readonly", true);

      let content = panel.find("#comment").html();
      content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
      $("#mvCoContent").val(content);

      $("#commentForm button[type='button']").attr("id", "commentUpdateBtn");
      $("#commentForm button[type='button']").attr("data-mv_co_num", mvCoNum);
      $("#commentForm button[type='button']").html("<i class='fa fa-location-arrow'></i> 수정");

      let resetButton = $("<button type='button' class='btn btn-success resetBtn' style='border: 1px solid;'>" );
      resetButton.html("<i class='fa fa-location-arrow'></i> 취소");

      $("#commentForm .sendBtn").after(resetButton);

   }
   
      // 좋아요 버튼 클릭 이벤트 처리
      $(document).on("click", "button[data-btn='likeBtn']", function() {
          let mvCoNum = $(this).parents("div.panel").attr("data-num");
          // 좋아요 요청을 서버로 보냄
          likeComment(mvCoNum);
          // 페이지 리로드
          location.reload();
      });

   
      function likeComment(mvCoNum) {
          let url = "/comment/like";
   
          // 좋아요 데이터 생성
          let likeData = {
              mvCoNum: mvCoNum,
              userNo: "${userLogin.userNo}"
          };
   
          // Ajax를 사용하여 좋아요 요청
          $.ajax({
              url: url,
              type: "post",
              headers: {
                  "Content-Type": "application/json"
              },
              dataType: "text",
              data: JSON.stringify(likeData),
              success: function(result) {
                  // 좋아요 수를 업데이트
                  updateLikeCount(mvCoNum, parseInt(result));
                  alert("댓글에 좋아요를 누르셨습니다.");
              },
              error: function(xhr, textStatus, errorThrown) {
                  alert("좋아요 처리 중 오류가 발생하였습니다.");
                  console.error(textStatus + "(HTTP-" + xhr.status + " / " + errorThrown + ")");
              }
          });
      }
   
      function updateLikeCount(mvCoNum, newLikeCount) {
          // 좋아요 수를 UI에 업데이트
          $('#likeCount_' + mvCoNum).text('좋아요 개수: ' + newLikeCount);
      }



</script>

</head>
<body>
<div id="commentContainer">
      <%-- 댓글 입력 화면 --%>
	<c:if test="${not empty userLogin}">        
		<form id="commentForm" name="commentForm" class="mt-4">
			<div class="row align-items-center">
				<div class="section-title" id="userName">
					<c:if test="${not empty userLogin}"><h5 id="userName">${userLogin.userName} 님</h5></c:if>
				</div>
				<input type="text" name="mvCoContent" id="mvCoContent" />
				<div class="col-md-3">
					<button type="button" id="commentInsertBtn" class="btn btn-success sendBtn" style='border: 1px solid;'>
						<i class="fa fa-location-arrow"></i> 등록
					</button>
				</div>
			</div>
		</form>
	</c:if>
      <br>
      <%-- 리스트 영역 --%>
      <div class="row">
         <div class="section-title">
            <h5>한줄평</h5>
         </div>
         <div class="col-lg-8 col-md-8" id="reviewList">
            <div class="anime__details__review panel" id="item-template">
               <div class="anime__review__item">
                  <div class="anime__review__item__text">
                     <h6 class="name"></h6>
                     <span class="date" style="color: white;"></span>
                     <c:if test="${commentUserName == userLogin.userName}">
                     <button type="button" data-btn="delBtn" class="btn btn-danger float-right" style="border: 1px solid;">삭제하기</button>
                     <button type="button" data-btn="upBtn" class="btn btn-success float-right" style="border: 1px solid;">수정하기</button>
                     </c:if>
                     <span id="likeCount_${mvCoNum}" class = "likenumber" > </span> <!-- 좋아요 개수를 표시할 span -->
                     <div class="btn-group" role="group" aria-label="좋아요">
                          <button type="button" class="btn btn-link" data-btn="likeBtn">
                            <i class="fas fa-heart" style="color: red;"></i>
                          </button>
                        </div>
                     <p id="comment"></p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>


