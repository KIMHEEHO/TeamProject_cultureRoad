<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style>
#item-template {
	display: none;
}
</style>

<script type="text/javascript">

$(document).ready(function() {
    $("#commentDeleteBtn").click(function() {
        var mv_co_num = "${detail.mvCoNum}";  // 한줄평 번호 가져오기

        // 삭제 요청 보내기
        deleteComment(mv_co_num);
    });

    /* 목록 버튼 클릭시 처리 이벤트 */
    $("#commentListBtn").click(function() {
        location.href = "/admin/admincommentList";
    });
});

// 한줄평 삭제 요청 함수
function deleteComment(mv_co_num) {
    $.ajax({
        type: "POST",
        url: "/admin/admincommentDelete",  // 삭제를 처리할 URL
        data: { mv_co_num : mv_co_num },  // 삭제할 한줄평 번호 전달
        success: function(data) {
            // 삭제 성공 시 목록 페이지로 이동
            location.href = "/admin/admincommentList";
        },
        error: function(xhr, status, error) {
            console.error("Error deleting comment:", error);
            // 실패 시 적절한 에러 처리를 여기에 추가
        }
    });
}

</script>
</head>

<body>
	<div class="contentContainer container">
		<form name="f_data" id="f_data" method="get">
			<input type="hidden" name="mvCoNum" value="${detail.mvCoNum}">
		</form>
		<div class="btnArea col-md-4 text-right">
			<input type="button" value="글삭제" id="commentDeleteBtn" class="btn btn-success btnArea col-md-4 text-right" />
			 <input type="button" value="목록" id="commentListBtn" class="btn btn-success" />
		</div>
		<%--================= 상세 정보 보여주기 시작 ================== --%>
		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-3">작성자</td>
						<td class="col-md=3 text-left">${detail.userName}</td>
						<td class="col-md-3">작성일</td>
						<td class="col-md=3 text-left">${detail.mvCoWriteDate}</td>
					</tr>
					<tr>
						<td class="col-md-4">영화 제목</td>
						<td colspan="3" class="col-md-8 text-left">${detail.title}</td>
					</tr>
					<tr>
						<td class="col-md-4">글내용</td>
						<td colspan="3" class="col-md-8 text-left">
							<div>${detail.mvCoContent}</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>