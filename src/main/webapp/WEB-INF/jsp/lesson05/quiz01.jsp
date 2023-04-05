<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL 라이브러리: 아래 반드시 import 후 쓰기 --%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 라이브러리 연습문제 (1)</title>
</head>
<body>

	<h1>1. JSTL core 변수</h1>
	<c:set var="number1" value="36" />
	<c:set var="number2" value="3" />
	<h3>첫번째 숫자: ${number1}</h3>
	<h3>첫번째 숫자: ${number2}</h3>
	
	<h1>2. JSTL core 연산</h1>
	<h3>더하기: ${number1 + number2}</h3>
	<h3>빼기: ${number1 - number2}</h3>
	<h3>곱하기: ${number1 * number2}</h3>
	<h3>나누기: ${number1 / number2}</h3>
	
	<h1>3. JSTL core out</h1>
	<c:out value="<title>core out</title>" escapeXml="true" />
	
	<h1>4. core if</h1>
	<!-- 변수에 담았다 출력하든, if문 통해 바로 결과 출력해도 상관 무 -->
	<c:if test="${(number1 + number2) / 2 >= 10}">
		<h1>${(number1 + number2) /2}</h1>
	</c:if>
	<c:if test="${(number1 + number2) / 2 < 10 }">
		<h3>${(number1 + number2) /2}</h3>
	</c:if>
	
	<h1>5. core if</h1>
	<c:if test="${number1 * number2 > 100}">
		<c:out value="<script>alert('너무 큰 수 입니다.')</script>" escapeXml="false" />
	</c:if>
	
	
</body>
</html>