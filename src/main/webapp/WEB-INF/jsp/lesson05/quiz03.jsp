<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>1. 후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표수</th>
					<th>득표율</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${candidates}" var="candidate" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td><fmt:formatNumber value="${candidate}" type="number" /> </td> <!-- 세자리마다 ,찍히도록 formatting (type은안적어도무방) -->
					<td><fmt:formatNumber value="${candidate / 1000000}" type="percent" /></td>
				</tr>
			</c:forEach>
			</tbody>		
		</table>
		
		
		<h1>2. 카드 명세서</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용 날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${cardBills}" var="bill">
				<tr>
					<td>${bill.store}</td>
					<td><fmt:formatNumber value="${bill.pay}" type="currency" /></td>
					<td>
						<!--기존리스트-맵안에선 문자열로 저장되어있어, formatter로 date객체 만들고, 또 string 변환해야(이중) -->
						<fmt:parseDate value="${bill.date}" pattern="yyyy-MM-dd" var="date1" />
						<fmt:formatDate value="${date1}" pattern="yyyy년 M월 d일" />
					</td> 
					<td>${bill.installment}</td>
				</tr>
			</c:forEach>
			</tbody>
		
		</table>
		
		
		
	</div>



</body>
</html>