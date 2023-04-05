<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz02</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<h1>HOT 5</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>순위</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${musicRanking}" var="rank" varStatus="status"> 
			<%--core 태그 forEach 반복문S
			_ items에 (꼭 EL문법으로!)가져올model key(로 해당리스트 가져오고), var에 가져온 리스트 속 String들을 하나하나 담는다 --%>
				<tr>
					<td>${status.count}</td>
					<td>${rank}</td> <%--아까 위 forEach문에서 담은 var (가져온 list 안의 각각의 String들)--%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<h1>멤버십</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>전화번호</th>
					<th>등급</th>
					<th>포인트</th>
				</tr>
			</thead>
			<c:forEach items="${membership}" var="member">
			<tbody>
				<tr>
					<td>${member.name}</td>
					<td>${member.phoneNumber}</td>
					<td>
			<!-- 조건에 따라 등급에 따라 색깔 부여 : member의 grade등급은 꼭 세가지 중 택1이므로 
			   -(하나만 선택, 중복겹쳐질 수 없음) if문보다는 choose가 낫다  
			/ td태그 안에서 글자색상 변경하는 게 나음 (조건에따라 나누면서 그 안에 td태그까지포함시키면 조건잘못될 시 안나타거나, 테이블 꼬일수 있으므로)
			   - 조건에 따라 span태그(글자감싸는 상자) 다르게 하기 5:39-->			
						<c:choose>
							<c:when test="${member.grade eq 'VIP'}"> <!--eq혹은== / 그냥VIP만 쓰면 변수로 착각할 수 -> 스트링으로 쓰기: 역슬래시\"따옴표나, 작은따옴표'도 사용  -->
								<span class="text-danger">${member.grade}</span>
							</c:when>
							<c:when test="${member.grade eq 'GOLD'}"> <!-- c:when다시, 위의 경우 아닌 경우 차선책 -->
								<span class="text-warning">${member.grade}</span>
							</c:when>
							<c:otherwise> <!-- 그외 나머지 경우 -->
								${member.grade} <!-- 그냥 글자만 찍으면 되니 이렇게 쓰든, span태그 감싸도 상관은 무 -->
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${member.point >= 5000}">
								<span class="text-primary">${member.point}P</span>
							</c:when>
							<c:otherwise>
								${member.point}P
							</c:otherwise>
						
						
						</c:choose>
					
					
					
					</td>
				</tr>
			</c:forEach>
			
			
			<!-- 조건에 따라 등급에 따라 색깔 부여 : member의 grade등급은 꼭 세가지 중 택1이므로 
			(하나만 선택, 중복겹쳐질 수 없음) if문보다는 choose가 낫다  -->
			</tbody>
		
		</table>
		
		
		
	</div>

</body>
</html>