<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<title>JSTL fn 라이브러리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<%-- 스타일시트도 <link href="/css/lesson05/style.css">이런 식으로 static이후경로부터 씀 --%>
</head>
<body>
	<%-- <img src="/img/sunny.jpg">  img경로쓸때 static까지는 자동인식 --%>
	<div class="container">
		<h1>회원 정보 리스트</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>No</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>국적</th>
					<th>이메일</th>
					<th>자기소개</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members}" var="member" varStatus="status"><!-- 번호부여위해 varStatus 필요 -->
				<tr>
					<td>${status.count}</td> <!-- 반복문 몇 번 돌았는지 1부터 출력 -->
					<td>${member.name}</td><!-- member.뒤에 map이라면 key명을, 이 경우 내가만든객체니까 그 필드명을 -->
					<td>
						<c:choose>
							<c:when test="${fn:startsWith(member.phoneNumber, \"010\")}">
								${member.phoneNumber}
							</c:when>
							<c:otherwise>
								유효하지 않은 전화번호
							</c:otherwise>
						</c:choose>
					</td>
					<td>${fn:replace(member.nationality, "삼국시대", "삼국 -")}</td>
					<td>
						<b>${fn:split(member.email, '@')[0]}</b>@${fn:split(member.email, '@')[1]}
					</td>
					<td class="text-left">
						<c:if test="${fn:length(member.introduce) > 15}">
							${fn:substring(member.introduce, 0, 15)}...
						</c:if>	
						<c:if test="${fn:length(member.introduce) <= 15}">
							${member.introduce}
						</c:if>			
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
</body>
</html>