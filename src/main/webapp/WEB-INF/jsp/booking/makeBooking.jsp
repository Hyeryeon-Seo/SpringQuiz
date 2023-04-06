<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<%-- datepicker를 위해 아래의, slim 버전이 아닌 jquery를 import한다. --%>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
<body>

	<div id="wrap" class="container">
	
			<header class="d-flex justify-content-center align-items-center mt-3"> <!--나_text-center로 가운데 맞췄음, but, d-flex 속성이용해서 위의 두 center를 써줘야 가로세로center맞출 수 -->
				<div class="display-4">통나무 팬션</div> <!-- display활용! _h1보다 더 크게 설정 가능 -->
			</header>
			
			<nav class="menu d-flex mt-3"> 
				<ul class="nav nav-fill w-100"> <!-- w-100까지 써줘야 다 비율맞게 채워짐 -->
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold"><h5>펜션소개</h5></a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold"><h5>객실보기</h5></a></li>
					<li class="nav-item"><a href="booking/make_booking_view" class="nav-link text-white font-weight-bold"><h5>예약하기</h5></a></li>
					<li class="nav-item"><a href="/booking/booking_list_view" class="nav-link text-white font-weight-bold"><h5>예약목록</h5></a></li>
				</ul>
			</nav>
				
			<section class="contents">
				<h2 class="text-center font-weight-bold m-4">예약 하기</h2>
				<div class="d-flex justify-content-center"> <!-- 큰 div 가운데 정렬 -->
					<div class="reservation-box">
						<div class="subject-text my-2 font-weight-bold">이름</div>
						<input type="text" class="form-control" id="name">
						<!-- id로 잡든 name으로 잡든 -->
						
						<div class="subject-text my-2 font-weight-bold">예약날짜</div>
						<input type="text" class="form-control" id="date">
	
						<div class="subject-text my-2 font-weight-bold">숙박일수</div>
						<input type="text" class="form-control" id="day">
	
						<div class="subject-text my-2 font-weight-bold">숙박인원</div>
						<input type="text" class="form-control" id="headcount">
	
						<div class="subject-text my-2 font-weight-bold">전화번호</div>
						<input type="text" class="form-control" id="phoneNumber">
	
						<button type="button" id="reservationBtn" class="btn btn-warning w-100 mt-5">예약하기</button>
					<%--입력받은 값은 모두 string...?--%>
				</div>
			</div>
			</section>
			
			<footer>
				<div class="text-secondary small mt-5"> <%-- 바깥 div에도 small 클래스속성 주니까 이중으로 더 작아졌다 --%>
					<div class="small">제주특별자치도 제주시 애월읍</div> <%-- class="small"로도 가능, 혹은 아래처럼 small태그추가 --%>
					<div><small>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목</small></div> 
					<div><small>Copyright 2025 tongnamu. All right reserved.</small></div>
				</div>
			</footer>

	</div>

<script>
	$(document).ready(function() {
			// datepicker 사용
			$("#date").datepicker({ // input에 name으로 부여했다면 'input[name=""]' 라고 쓰면 됨
				dateFormat: "yy-mm-dd"   // 여기는 ; 넣으면 안됨
				// simpleDateFormat(yyyy)과 다르게 yy 2개만 씀
				, minDate:0 // 오늘부터 그 뒤 선택
				// 오늘부터 선택가능하도록 설정
			});
			
			// 예약하기 버튼
			$("#reservationBtn").on('click', function() {
				let name = $("#name").val().trim(); // input의 name의 경우_ "input[name=...]" 
				let date = $("#date").val().trim();
				let day = $("#day").val().trim();
				let headcount = $("#headcount").val().trim();
				let phoneNumber = $("#phoneNumber").val().trim();
				
				// validation 기본 유효성 검사
				if (name == "") {
					alert("이름을 입력하세요.");
					return;
				}
				if (date == "") {
					alert("예약날짜를 입력하세요.");
					return;
				}
				if (day == "") {
					alert("숙박일수를 입력하세요.");
					return;
				}
				if (isNaN(day)) { // 숫자가 아닌 값 들어오면 true : isNaN(..)
					alert("숙박일수는 숫자만 입력 가능합니다.");
					return;
				}
				
				if (headcount == "") {
					alert("숙박인원을 입력하세요.");
					return;
				}
				if (isNaN(headcount)) { // 숫자가 아닌 값 들어오면 true : isNaN(..)
					alert("숙박인원은 숫자만 입력 가능합니다.");
					return;
				}
				
				if (phoneNumber == "") {
					alert("전화번호를 입력하세요.");
					return;
				}
				
				
				$.ajax({
					// + type,url등 옵션의 순서는 상관없음
					type: "POST"
					, url: "/booking/make_booking"
					, data: {"name":name, "date":date, "day":day, "headcount":headcount, "phoneNumber":phoneNumber}
					, success:function(data) {
						if (data.code == 1) { // 성공시 아래, 결과목록페이지로 이동
							alert("예약되었습니다.");
							location.href = "/booking/make_booking_view"; // get방식으로 보냄
						} else {
							alert(data.errorMessage);
						}
					}
					, error:function(request, status, error) {
						alert("예약하는데 실패했습니다. 관리자에게 문의해주세요.");
					}
					
				});
				
			});
			
	});
	
</script>

</body>
</html>