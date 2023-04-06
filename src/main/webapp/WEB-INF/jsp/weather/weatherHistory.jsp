<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- fmt필요: fmt:formatDate-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="/css/lesson05/weather_style.css">
</head>
<body>

	<div id="wrap">
		<div class="contents d-flex">
			<%-- 메뉴 영역 --%>
			<nav class="col-2">
				<%-- 상단 로고 --%>
				<div class="logo d-flex justify-content-center mt-3">
					<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Emblem_of_the_Government_of_the_Republic_of_Korea.svg/800px-Emblem_of_the_Government_of_the_Republic_of_Korea.svg.png" width="25"> 
					<span class="text-white font-weight-bold ml-2">기상청</span>
				</div>

				<%-- 메뉴 --%>
				<%-- flex-column: 세로 메뉴 --%>
				<ul class="nav flex-column mt-4">
					<li class="nav-item">
						<a href="/weather/weather_history_view"	class="nav-link menu-font">날씨</a>
					</li>
					<li class="nav-item">
						<a href="/weather/add_weather_view" class="nav-link menu-font">날씨입력</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link menu-font">테마날씨</a>
					</li>
					<li class="nav-item">
						<a href="#" class="nav-link menu-font">관측 기후</a>
					</li>
				</ul>
			</nav>
			
			<%-- 날씨 히스토리 --%>
			<section class="weather-history col-10 mt-3 ml-5">
				<h3>과거 날씨</h3>
				
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherHistoryList}" var="history"> <!-- history변수갹채에 저장 , 아래에서 객체로 꺼내기-->
						<tr>
							<!-- date객체로 되어있는데 > string으로 바꿔주기 (fmt태그활용) -->
							<td><fmt:formatDate value="${history.date}" pattern="yyyy년 M월 d일" /></td><!-- history객체.뒤에 필드명 -->
							<td>
								<c:choose> <!-- 날씨가 어떤지에 따라 이미지 출력, c:choose, when ,..태그활용 -->
									<c:when test="${history.weather == '맑음'}">
										<img src="/img/sunny.jpg" alt="맑음"><!-- img태그에서 alt속성도 웬만하면 넣어주는게 좋음 -->
									</c:when>
									<c:when test="${history.weather == '흐림'}">
										<img src="/img/cloudy.jpg" alt="흐림">
									</c:when>
									<c:when test="${history.weather == '구름조금'}">
										<img src="/img/partlyCloudy.jpg" alt="구름조금">
									</c:when>
									<c:when test="${history.weather == '비'}"><!-- 나머지경우는 otherwise처리도 가능하지만 when해주는게좋음 _다른 날씨 추가도 가능하니 -->
										<img src="/img/rainy.jpg" alt="비">
									</c:when>
									<c:otherwise><!-- 혹시나 날씨추가시 - 글씨뜨게해주기 (안나오는장애방지) -->
										${history.weather}
									</c:otherwise>
								</c:choose>
							</td>
							<td>${history.temperatures}℃</td> <!-- 단위도 뒤에 써주기 -->
							<td>${history.precipitation}mm</td>
							<td>${history.microDust}</td>
							<td>${history.windSpeed}km/h</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</section>
		</div>   <%--?? --%> 
		<footer class="d-flex align-items-center">
			<div class="footer-logo ml-4">
				<img class="foot-logo-image"
					src="https://www.weather.go.kr/w/resources/image/foot_logo.png"
					width="120">
			</div>
			<div class="copyright ml-4">
				<small class="text-secondary"> (07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2020 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
	
</body>
</html>