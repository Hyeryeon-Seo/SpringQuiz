<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 펜션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%-- AJAX를 사용하려면 jquery 원본 필요 --%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css">
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<div class="display-4">통나무 팬션</div>
		</header>
		<nav>
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">팬션소개</a></li>
				<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold">객실보기</a></li>
				<li class="nav-item"><a href="/booking/make_booking_view" class="nav-link text-white font-weight-bold">예약하기</a></li>
				<li class="nav-item"><a href="/booking/booking_list_view" class="nav-link text-white font-weight-bold">예약목록</a></li>
			</ul>
		</nav>
		<section class="banner bg-info">
			<%--시간 초마다 변경_배너순회시키기--%>
			<img id="bannerImage" src="/img/booking/test06_banner1.jpg"	alt="banner" width="1110" height="500">
		</section>
		<section class="reserve bg-primary d-flex">
			<section
				class="real-time-reserved col-4 d-flex justify-content-center align-items-center">
				<div class="display-4 text-white">
					실시간<br>예약하기
				</div>
			</section>
			<section class="confirm col-4">
				<div class="m-3">
					<span class="reserve-confirm mr-3">예약 확인</span>
				</div>

				<!-- 예약 확인 -->
				<div id="memberInputBox" class="m-2">
					<div class="d-flex justify-content-end mr-3">
						<span class="text-white">이름:</span> <input type="text" id="name"
							class="form-control input-form">
					</div>
					<div class="d-flex mt-2 justify-content-end mr-3">
						<span class="text-white">전화번호:</span> <input type="text"
							id="phoneNumber" class="form-control input-form">
					</div>

					<!-- 버튼 -->
					<div class="text-right mt-3 mr-3">
						<button type="button" id="searchBtn" class="btn btn-success submit-btn">조회하기</button>
					</div>
				</div>

			</section>
			<section
				class="inquiry col-4 d-flex justify-content-center align-items-center">
				<div class="text-white">
					<h4 class="font-weight-bold">예약문의:</h4>
					<h1>
						010-<br>0000-1111
					</h1>
				</div>
			</section>
		</section>

		<footer>
			<div class="text-secondary"> 
				<div><small>제주특별자치도 제주시 애월읍</small></div>
				<div><small>사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표:김통목</small></div> 
				<div><small>Copyright 2025 tongnamu. All right reserved.</small></div>
			</div>
		</footer>
	</div>
	
	
<script>
	$(document).ready(function() {
		$('#searchBtn').on('click', function() {
			let name = $('#name').val().trim();
			let phoneNumber = $('#phoneNumber').val().trim();
			
			if (!name) {
				alert("이름을 입력하세요");
				return;
			}
			
			if (!phoneNumber) {
				alert("전화번호를 입력하세요");
				return;
			}
	
		$.ajax({
			url:"/booking/search_booking"
			, data:{"name":name, "phoneNumber":phoneNumber}
			
			// select방식은 get_ get안써도됨(알아서get)
			, success:function(data) {
					if (data.code == 1) {
						alert("이름:" + data.booking.name 
								+ "\n날짜:" + data.booking.date.slice(10) // data.booking.date 스트링 : index 0 ~9까지만 출력
								+ "\n일수:" + data.booking.date.day
								+ "\n인원:" + data.booking.date.headcount
								+ "\n상태:" + data.booking.date.state
						);  
					} else {
						alert("예약내역이 없습니다.");
					}
			}
			, error:function(request, status, error) {
					alert("예약 내역을 조회하는데 실패했습니다.");
				}
		});
		
		
		// 배너 순회 (끝까지 돌고 없으면 다시 앞으로 가서 돌기)
		let bannerList = ["/img/booking/test06_banner1.jpg", "/img/booking/test06_banner2.jpg", "/img/booking/test06_banner3.jpg", "/img/booking/test06_banner4.jpg"]; // 이미지 주소를 배열 안에 넣어주기
		let currentIndex = 1;
		
		setInterval(function() {
			$('#bannerImage').attr('src', bannerList[currentIndex])  // 뒤에 지금 index가 가리키는 값
			
			currentIndex++;
			// 4개면  0 1 2 3  -> 4인덱스가되면 다시 앞 0으로 바꿔주기
			if (currnetIndex == bannerList.length) { //끝.. 같아지면
				currentIndex = 0; // 초기화 
			}
			// console.log(currnetIndex);
		}, 3000); // setInterval안에( , ) 첫번째 파라미터 함수(없으면 익명?함수function), 두번째 밀리세컨드(3초는 3000)
		
		
		
	});
		

</script>	
	
</body>
</html>