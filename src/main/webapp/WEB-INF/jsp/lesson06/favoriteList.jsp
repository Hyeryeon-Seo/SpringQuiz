<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %> <!-- c:forEach core사용하려면필요 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title> <!-- 결과 페이지 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%--AJAX를 사용하려면 jquery 원본 필요--%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container">
		<h1>즐겨찾기 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			 <c:forEach items="${favoriteList}" var="favorite"><!-- 여기서는 varStatus말고 id사용해서 입력아래에 -->
				<tr>
					<td>${favorite.id}</td>
				 	<td>${favorite.name}</td>
					<td>${favorite.url}</td>
					<td>
						<%-- (1) <button type="button" id="deleteFavoriteBtn" class="del-btn btn btn-danger" value="${favorite.id}">삭제</button> --%>
						<button type="button" class="del-btn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
					</td>
					<!-- data-   이름짓기 __카멜케이스안됨! 대문자들어가면안됨 / data- 하고 여러 이름 지을 수 있어서 편리
					여기서 data-..로 c:forEach반복문에서의 "${favorite.id}를 저장해두고 아래 스크립트에서 부를 것-->
					<!-- del-btn 이라고 내가 버튼태그의 속성class부여통해 따로 이름 지정 -->
					<!-- button태그는 value속성값이 아니라 그 사이에 버튼내용써주기 / input태그는 해당속성value값에 ="" 내용 써줘야 뜸 -->				
				</tr>
			</c:forEach> 
			</tbody>
		</table>
	</div>


<script>
	$(document).ready(function() {
		// (1)
		/*
		$('.del-btn').on('click', function(e) { // .del-btn은 내가부여한 클래스속성이름
			let id = e.target.value; // e(event), this객체 똑같은거 ,  value로 가져와 변수에 넣기 --원래이게자바순수문법(아랫줄보단)
			// let id = $(this).val(); // 지금 클릭된거 그것 하나 꺼내기 -val함수로
			alert(id);
		});
		*/
		
		// (2) data 활용 - 제이쿼리에서 많이 쓰는 방식
		// data-favorite-id 태그에 값을 심어 놓는다.   data-  그 뒤부터는 이름을 직접 짓는다. (!!대문자 들어가면 안됨, camle X)
		// 스크립트:   $(this).data('favorite-id');  ($(this) (삭제버튼통으로가져옴) 이 객체에 있으니, 꺼낼때는 data함수사용)
		$('.del-btn').on('click', function() { // .del-btn은 내가부여한 클래스속성이름
			let id = $(this).data('favorite-id'); // id 변수에 받은 거(data-favorite-id의 해당favorite.id) 저장
			// alert(id);
			
			$.ajax({
				// request
				type:"post"
				, url:"/lesson06/quiz01/delete_favorite"
				, data:{"id":id} // controller에서 서버가 먼저 파라미터 정의하는 것. 그대로 data라는 맵안 key에 써주기 "id", value값은 위에서 설정한 변수(let id) 
 			
				// response
				, success:function(data) {
					if (data.code == 1) {
						// 성공일 때는 삭제만되고 새로고침
						location.reload(true); // 새로고침 함수 (가끔 동작안됨 그래서 true넣어주기)
					} else {
						alert(data.errorMessage); // 서버가 지정해준 메세지로 뜨게
					}
				}
				, error:function(request, status, error) {
					alert("삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
				}
			
			});
		});
	});


</script>


</body>
</html>