<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Orbit&display=swap"
	rel="stylesheet">
<title>Movie culture</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="/resources/movieDetail/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/plyr.css"
	type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet"
	href="/resources/movieDetail/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/movieDetail/css/style.css"
	type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

<script type="text/javascript">
	$(function() {
		$("#choiceBtn").click(function() {
			let id = $(".btn-primary").attr("data-num");
			console.log("id :", id);
			//console.log("title :", title);
			$("#dateForm2").attr({
				method : "post",
				action : "/MovieSeatBooking/" + id
			});
			$("#dateForm2").submit();
		});
	});
</script>
	<style>
		 .row{
			display: flex;
			justify-content: center; /* 수평 가운데 정렬 */
			margin-top : 120px;
		} 
		
		.card-body {
			text-align : center;
		}
		
	.btn {
		margin : auto;
	}

	</style>
</head>
<body style = "background-color: #0b0c2a; margin-top: 100px;" ><!-- -->
<%@ include file="/WEB-INF/views/mainTemplate/nav.jsp"%>
<!-- <form id="dateForm">
		<input type="hidden" id="selected_date_input" name="selectedDate">
</form>  -->
<div class="row" id="myPage" style = "margin-top:100px;" >
              <div class="col-lg-6 grid-margin stretch-card" >
                <div class="card">
                  <div class="card-body">
                    <h3 class="card-title">상영날짜를 선택하세요</h3>
                    <br />
		<div id="div_calendar"> <!-- style="width: 500px;" -->
			<div>
				<!-- <input type="hidden" onclick="changeMonth(-1);" id="fa1" value="" /> -->
				<button type="button" onclick="changeMonth(-1);">
					<i class="fa fa-chevron-left" id="fa1"></i>
				</button>
				<input type="text" id="year" value="2020" style="width: 80px; display: initial;" class="form-control" readonly="readonly" /> 
					<select id="month" class="form-control" style="width: 80px; display: initial;" onchange="changeMonth();">
						<option value="1">1월</option>
						<option value="2">2월</option>
						<option value="3">3월</option>
						<option value="4">4월</option>
						<option value="5">5월</option>
						<option value="6">6월</option>
						<option value="7">7월</option>
						<option value="8">8월</option>
						<option value="9">9월</option>
						<option value="10">10월</option>
						<option value="11">11월</option>
						<option value="12">12월</option>
					</select>
					<!-- <input type="button" onclick="changeMonth(1);" id="fa2" value="" /> -->
				<button type="button" onclick="changeMonth(1);">
					<i class="fa fa-chevron-right" id="fa2"></i>
				</button>
			</div>
			 <table class="table table-bordered">
				<thead>
					<tr>
						<th>일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th>토</th>
					</tr>
				</thead>
				<tbody id="tb_body"></tbody>
			</table>
		</div>
		<div class="contentContainer container">
			<table>
				<tr>
					<td>예약일 :</td>
					<td id="input_date"></td>
				</tr>
				<tr>
					<td><form id="dateForm2"><input type="hidden" id="selected_date_input" name="selectedDate"></form></td>
				</tr>
				
			</table>
			<button type="button" name="choiceBtn" id="choiceBtn" class="btn btn-primary" data-num="${movie.id}">좌석 및 인원 선택</button>
		</div>
	</div>
	<div class="col-lg-4 col-md-4">
		<div class="anime__details__sidebar">
			<article class="accordion" style="background-color: white; text-align: center; margin-top: -25px; padding-bottom: 10px; border-radius: 7px;">
				<%-- <div>
					<button type="button" name="choiceBtn" id="choiceBtn" class="btn btn-primary" data-num="${movie.id}">좌석 및 인원 선택</button>
				</div> --%>
			</article>
		</div>
	</div> 
</div>
</div>
</div>

	<script>
		let date = new Date();
		let y = date.getFullYear();
		let m = ('0' + (date.getMonth() + 1)).slice(-2);
		let d = ('0' + date.getDate()).slice(-2);
		let today = document.getElementById("input_date");
		today.innerHTML = y + '-' + m + '-' + d;

		// 날짜 선택을 제한할 최소 날짜 설정 (오늘 이후)++
		let minDate = new Date(y, m - 1, d);

		// 이전 날짜 비활성화 함수++
		function disablePastDates(date) {
			return date >= minDate;
		}

		$("#fa1").val((Number(m) - 1) + "월");
		$("#fa2").val((Number(m) + 1) + "월");
		//$("#fa1").text((Number(m) - 1) + "월");
		//$("#fa2").text((Number(m) + 1) + "월");

		function checkLeapYear(year) {//윤년 계산
			if (year % 400 == 0) {
				return true;
			} else if (year % 100 == 0) {
				return false;
			} else if (year % 4 == 0) {
				return true;
			} else {
				return false;
			}
		}

		function getFirstDayOfWeek(year, month) {//선택한 달의 1일 요일 구하기
			if (month < 10)
				month = "0" + month;//month가 10보다 작으면 month앞에 "0"

			return (new Date(year + "-" + month + "-01")).getDay(); //getDay () 메소드는 일주 (0-6), 하루 수를 반환
		}

		function changeYearMonth(year, month) {//버튼 클릭시 월별 날짜 구하기
			let month_day = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];//월별 마지막 날짜

			if (month == 2) {
				if (checkLeapYear(year))
					month_day[1] = 29;//2월이면 년도 나누기 4 했을 때 0이면 2월29일(윤년이면)
			}

			let first_day_of_week = getFirstDayOfWeek(year, month);//일요일이면 0, 월요일이면 1....
			let arr_calendar = [];
			for (let i = 0; i < first_day_of_week; i++) {
				arr_calendar.push("");//
			}

			for (let i = 1; i <= month_day[month - 1]; i++) {
				arr_calendar.push(String(i));//arr_calendar에 월에 마지막 날짜까지 1,2,3... 넣음 
			}

			let remain_day = 7 - (arr_calendar.length % 7);//빈공간
			if (remain_day < 7) {
				for (let i = 0; i < remain_day; i++) {
					arr_calendar.push("");
				}
			}

			renderCalendar(arr_calendar);
		}

		function renderCalendar(data) {
			let h = [];
			for (let i = 0; i < data.length; i++) {
				if (i == 0) {//첫주
					h.push('<tr>');
				} else if (i % 7 == 0) {
					h.push('</tr>');
					h.push('<tr>');//다음주..
				}

				if (data[i] === "") {
					h.push('<td></td>');
				} else {
					let day = Number(data[i]);
					let selectedDate = new Date(current_year,
							current_month - 1, day);

					if (disablePastDates(selectedDate)) {
						h.push('<td class="t_day" id="day' + data[i]
								+ '" onclick="setDate(' + data[i]
								+ ');" style="cursor:pointer;">' + data[i]
								+ '</td>');
					} else {
						h
								.push('<td class="t_day" id="day' + data[i] + '" style="cursor:not-allowed;">'
										+ data[i] + '</td>');
					}
				}

			}

			h.push('</tr>');

			$("#tb_body").html(h.join(""));
			for (let i = 1; i <= $(".t_day").text().length; i++) {
				if (d == i && m == current_month && y == current_year) {
					$("#day" + i).css("backgroundColor", "#E6FFFF");
				}

			}
		}

		function setDate(day) {//선택할 날짜 가져가기
			$(".t_day").css("backgroundColor", "white");
			$("#day" + day).css("backgroundColor", "#E6FFFF");
			let text_month = current_month;
			if (day < 10)
				day = "0" + day;
			if (current_month < 10)
				text_month = "0" + text_month;

			$("#date_text").text(current_year + "-" + text_month + "-" + day);

			$("#input_date").html(current_year + "-" + text_month + "-" + day);
			//$("#div_calendar").hide();

			// 선택한 날짜를 폼 필드에 설정
			let selectedDate = current_year + '-'
					+ ('0' + current_month).slice(-2) + '-'
					+ ('0' + day).slice(-2);
			$("#selected_date_input").val(selectedDate);

			// 폼 서브밋
			$("#dateForm").submit();
		}

		function changeMonth(diff) {
			if (diff == undefined) {
				current_month = parseInt($("#month").val());
			} else {
				current_month = current_month + diff;

				if (current_month == 0) {//전년도로 바뀜
					current_year = current_year - 1;
					current_month = 12;
				} else if (current_month == 13) {//다음년로 바뀜
					current_year = current_year + 1;
					current_month = 1;
				}
			}

			loadCalendar();
			if ((current_month) == Number(m)) {
				$("#fa1").prop("type", "hidden");
				//$("#fa1").css("visibility", "hidden");
			} else {
				$("#fa1").prop("type", "button");
				//$("#fa1").css("visibility", "visible");
			}
			if ((current_month) == (Number(m) + 1)) {
				$("#fa2").prop("type", "hidden");
				//$("#fa2").css("visibility", "hidden");
			} else {
				$("#fa2").prop("type", "button");
				//$("#fa2").css("visibility", "visible");
			}
		}

		function loadCalendar() {
			$("#year").val(current_year);
			$("#month").val(current_month);
			changeYearMonth(current_year, current_month);

			let previous_month = current_month - 1
			let next_month = current_month + 1
			if (previous_month === 0) {
				$("#fa1").val(12 + "월");
				//$("#fa1").text(12 + "월");
			} else {
				$("#fa1").val(previous_month + "월");
				//$("#fa1").text(previous_month + "월");
			}

			if (next_month === 13) {
				$("#fa2").val(1 + "월");
				//$("#fa2").text(1 + "월");   
			} else {
				$("#fa2").val(next_month + "월");
				//$("#fa2").text(next_month + "월");
			}

		}

		let current_year = (new Date()).getFullYear();
		let current_month = (new Date()).getMonth() + 1;

		$("#year").val(current_year);
		$("#month").val(current_month);

		changeYearMonth(current_year, current_month);
	</script>
<%-- 	<%@ include file="/WEB-INF/views/mainTemplate/footer.jsp"%> --%>
</body>
</html>