<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!-- core 라이브러리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> <!-- 함수라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가하기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<%--AJAX를 사용하려면 jquery 원본 필요--%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>

	<div class="container"> <!--container는 부트스트랩 에 있음 -->
		<h1 class="mt-3">즐겨찾기 추가하기</h1>
		
			<div class="form-group">
				<label for="title">제목</label> <!-- 뭐에 대한 라벨인지 for로, 
				아래 input에서는 for있으면 아래에도 id써줘야(동일하게), name도필수 - 그래야 넘어감 -->
				<input type="text" id="title" name="title" class="form-control col-12" > <!-- placeholder 생략가능 -->
				<!-- 칼럼명과 다르게 title등으로 보낼 수 있다 (대신 아래 ajax에서도) -->
			</div>
			<div class="form-group">
				<label for="url">URL 주소</label>
					<div class="d-flex">
						<input type="text" id="url" name="url" class="form-control col-10">
						<button type="button" class="btn btn-info" id="nameCheckBtn">중복확인</button>
					</div>
					<small id="nameStatusArea"></small>
			</div>
 			<%--ajax일떄는 submit없애야! / AJAX통신일 때는 반드시 button 타입으로 지정한다. --%>
 				<input type="button" id="addFavoriteBtn" class="btn btn-success col-12" value="추가">
	</div>


<script>
	$(document).ready(function() {  //이렇게 스크립트 만들면 꼭 먼저 alert로 테스트해보기
		
		// jquery의 AJAX 통신 이용
		// 아래는 스크립트니까 .. fn 쓰는 거 아님
		
		$("#addFavoriteBtn").on("click", function() {
			// valiadation 유효성 체크
			let title = $("#title").val().trim(); // name 아니고 위와 맞춰서 #title로 써주는거주의
			if (!title) { // 스크립트에서는 null, 빈거구분어려워서 title == ""
				alert("이름을 입력하세요");
				return;
			}
				
			let url = $("#url").val().trim();
			if (!url) {
				alert("주소를 입력하세요");
				return;
			} 
			
/* 			/else if (${!fn:contains(url, "http")}) {  > 틀림 
				// !url.contains("http")이런식으로하면 안됨
				// (${!fn:contains(url, "http")}) 이렇게하면 뜨긴하는데... http있어도 안됨. 
				alert("주소에서 http(https)와 같은 프로토콜까지 올바르게 입력하세요") 
			} */
			
			// http도 아니고 https도 아닐 때 잘못된 주소
			// fn쓰는거 아님.. 스크립트상의문법쓰면됨 , 그리고 if따로 쓰면됨 else if 할거없이..?
			if(url.startsWith("http://") == false && url.startsWith("https://") == false) {
				// 둘다 아니어야 하니까 엠퍼센트 &&
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			//테스트
			console.log(title);
			console.log(url);
			
				
			// AJAX 호출 => 서버 전송
			$.ajax({
				// request
				type:"POST"
				, url: "/lesson06/quiz01/add_favorite" // 여기로 넘긴다
				, data: {"title":title, "url":url} // JSON 형식으로 
				
				// response 
				, success:function(data) { // *** jquery ajax 함수가 (딕셔너리로바꿔줌) json string을 object로 파싱해줌 , data는 map이라고 생각하면됨
					// +? 여기서 controller의 /add_favorite페이지에서, 받은 data로 즐겨찾기 추가 한 후, 내려받는 'result' (map-json string)으로 하는건가...?
					// +? 그럼 아래 data는, Controller의 addFavorite 메소드 통해 받은 'result'(맵 _ 키가 code, result)인가? 		
					// alert(data.code); // data를 맵처럼 보고 key명을 뒤에 써주면 해당 값이 나옴
					// alert(data.result);
					if (data.code == 1){ // 혹은 data == "성공", 성공 시 아래(결과목록페이지)로 화면 이동
						location.href = "/lesson06/quiz01/favorite_list_view";
					} else { // 이 경우 ajax는 되고 로직상 에러
						alert(data.errorMessage);
					}
				}
			 /* , complete:function(data) { -> 무조건 떠서 여기선 쓸 필요없음 
					alert("일단 완료") */
				, error:function(request, status, error) { // 이 경우 ajax 자체가 실패해서 뜸
					alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
					// alert(request);
					// alert(status);
					// alert(error);
				}
			});
		});  // 이거 맞추는 거 주의 ㅠㅠ
			
		// ------  주소 중복 확인
 		$("#nameCheckBtn").on("click", function() {
 			// alert("중복확인버튼눌림"); > 작동 확인
 		})
			// 클릭 초기화 처리 - nameStatusArea하위 태그들 초기화
		/* 	$("#nameStatusArea").empty();
			
			let url = $("#url").val().trim();
			
			// 주소 중복 체크 -> AJAX 통신
			$.ajax ({
				// request
				type:"get"
				, url:"/lesson06/quiz01/is_duplication" // 이 주소로 요청
				, data:{"url":url}
			
				// response
				, success:function(data) {
					if(data.isDuplication) {
						$("#nameStatusArea").append('<span class="text-danger">주소가 중복되었습니다.</span>');
					}
				}
				, error:function(request, status, error) {
					alert("중복확인에 실패했습니다. 관리자에게 문의해주세요.");
				} 
			});
		}); */
		
});

</script>

</body>
</html>