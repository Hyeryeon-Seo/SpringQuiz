<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <%--아래에서 c:forEach반복문, c:choose 사용 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <%-- fmt: formatDate 사용--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통나무 팬션</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/booking/booking_style.css"> <!-- /booking까지!/ 경로 주의하기 -->
</head>
<body>

	<div id="wrap" class="container">
	
			<header class="d-flex justify-content-center align-items-center mt-3"> <!--나_text-center로 가운데 맞췄음, but, d-flex 속성이용해서 위의 두 center를 써줘야 가로세로center맞출 수 -->
				<div class="display-4">통나무 팬션</div> <!-- display활용! _h1보다 더 크게 설정 가능 -->
			</header>
			
			<nav class="menu d-flex mt-3"> 
				<ul class="nav nav-fill w-100"> <!-- w-100까지 써줘야 다 비율맞게 채워짐 -->
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold"><h5>펜션소개</h5></a></li>
					<li class="nav-item"><a href="#" class="nav-link text-white font-weight-bold"><h5>객실보기</h5></a></li>
					<li class="nav-item"><a href="/booking/make_booking_view" class="nav-link text-white font-weight-bold"><h5>예약하기</h5></a></li>
					<li class="nav-item"><a href="/booking/booking_list_view" class="nav-link text-white font-weight-bold"><h5>예약목록</h5></a></li>
					<%-- 위 li의 a태그링크가 이상하게 먹히는 에러 발생 -> /슬래시 부터 시작해야!  --%>
				</ul>
			</nav>
				
			<section class="contents">
				<h2 class="text-center font-weight-bold m-4">예약 목록 보기</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td><fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" /></td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<td>
								<%-- 상태에 따라 글씨색깔 다르게_ core 라이브러리 활용 --%>
								<c:choose>
									<c:when test="${booking.state eq '대기중'}"> <%-- ==대신 혹은 eq --%>
										<span class="text-info">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state == '확정'}">
										<span class="text-success">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state == '취소'}">
										<span class="text-danger">${booking.state}</span>
									</c:when>
									<c:otherwise>
										${booking.state}
									</c:otherwise>
								</c:choose>
							</td>
							<td><button type="button" class="del-btn btn btn-danger" data-booking-id="${booking.id}" >삭제</button></td>
							<%-- ls06. favorite즐찾 연습문제에서 했듯이 data활용 id부여해서 해보기 (해당this_ id받아서 아래에서 삭제)--%>
					</c:forEach>
					</tbody>
				</table>
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
		// 삭제 버튼	
		$('.del-btn').on('click', function() {
			let id = $(this).data('booking-id');
			// 확인 alert(id);
			
			$.ajax({
				// request
				type:"delete" // POST 계열, 브라우저로 직접 치고 못들어감
				, url:"/booking/delete_booking"
				, data:{"id":id}
			
				// response
				, success:function(data) {
					if (data.code == 1) {
						alert("삭제 되었습니다.");
						location.reload(true); // 새로고침
					}
				}
				, error:function(request, status, error) {
					alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
				
			})
			
		})
	
	
	})
	
	



</script>

</body>
</html>