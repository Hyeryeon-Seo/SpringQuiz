<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				아래 input에서는 lable에 for있으면 아래에도 id써줘야(동일하게),    name도필수 - 그래야 넘어감::은.. post,get방식 넘길때인듯 -->
				<input type="text" id="title" class="form-control col-12" > <!-- placeholder 생략가능 -->
				<!-- 칼럼명과 다르게 title등으로 보낼 수 있다 (대신 아래 ajax에서도) -->
			</div>
			
			<div class="form-group">
				<label for="url">URL 주소</label>
					<div class="form-inline"><!--  form-inline은 form 컨트롤의 너비를 container 너비로 자동 확장되는 것을 방지하고 여러 컨트롤을 한 줄로 표시해주는 기능수행 -->
						<input type="text" id="url" class="form-control col-11">
						<button type="button" id="urlCheckBtn" class="btn btn-info">중복확인</button>
					</div>
					<!-- <small id="urlStatusArea"></small> -->
					<!-- 아니면 id=urlStatusArea 사용해 아래에서 뜨게하지말고, small 태그에 class부여해서 d-none으로 숨겨둘 수 -->
					<small id="isDuplicationText" class="text-danger d-none">중복된 URL 입니다.</small>
					<small id="availableUrlText" class="text-success d-none">저장 가능한 URL 입니다.</small>
			</div>
			
 			<%--ajax일떄는 submit없애야! / AJAX통신일 때는 반드시 button 타입으로 지정한다. --%>
 			<button type="button" id="addFavoriteBtn" class="btn btn-success btn-block">추가</button>
	</div>


<script>
$(document).ready(function() {  //이렇게 스크립트 만들면 꼭 먼저 alert로 테스트해보기
		// jquery의 AJAX 통신 이용
		// 아래는 스크립트니까 .. fn 쓰는 거 아님
		
		// --- 주소 중복 확인 버튼
 		$("#urlCheckBtn").on("click", function() {
 			// alert("중복확인버튼눌림"); > 작동 확인
 		
			// 클릭 초기화 처리 - nameStatusArea하위 태그들 초기화
		 	// $("#urlStatusArea").empty();  -- 이거 현재 주석처리해서 없어서, 해두면 에러
			
			let url = $("#url").val().trim();
			if (url == "") { // 비어있을시
				alert("검사할 url을 입력하세요.")
				return; // E: return 빼먹어서 에러
			}
			
			// 주소 중복 체크 -> AJAX 통신
			$.ajax ({
				// request
				type:"POST" // url은 길 수 있고, get방식은 56자정도? 제한이 있어서 post방식이 맞다/ E; 소문자를 대문자로 바꾸니까 됨
				, url:"/lesson06/quiz01/is_duplication_url" // 이 주소로 요청
				, data:{"url":url}
			
				// response
				, success:function(data) { // data는 map, dictionary
					// {"isDuplication":true}
					if(data.isDuplication) {
						// 중복
						//$("#urlStatusArea").append('<span class="text-danger">중복된 url 입니다.</span>');
						// 위에서 d-none 사용한 경우 - $("(뜨게할text)").removeClass("d-none")을 써준다, 
						// 감출 text의 경우 .addClass("d-none")- -- 아래 else의경우 반대
						$("#isDuplicationText").removeClass("d-none");
						$("#availableUrlText").addClass("d-none");		
					// } else if(!data.isDuplication) {
					} else {
						// 중복 아님 => 사용 가능
						// $("#urlStatusArea").append('<span class="text-info">저장 가능한 url 입니다.</span>');
						$("#isDuplicationText").addClass("d-none");
						$("#availableUrlText").removeClass("d-none");
					}
				}
				, error:function(request, status, error) {
					alert("중복확인에 실패했습니다. 관리자에게 문의해주세요.");
					// E; 중복된 url이(이전에 `favorite`에있던 url이) 여러개였더니 에러발생
				} 
			});
		}); 
	
 		// -- 즐겨찾기 추가버튼
		// + 답대로만 하니, (중복확인버튼) 중복된 url이어도, 혹은 중복버튼 안눌러도 (추가버튼)즐찾추가가 되어서 - 06레슨 예제 addName.jsp처럼, 처리를 생각해보자
		//    -> 이경우 #isDuplicationText뜨면 안되도록 & 중복버튼 꼭 누르도록
		$("#addFavoriteBtn").on("click", function() {
			// valiadation 유효성 체크
			let title = $("#title").val().trim(); // name 아니고 위와 맞춰서 #title로 써주는거주의
			let url = $("#url").val().trim();

			if (!title) { // 스크립트에서는 null, 빈거구분어려워서 title == ""
				alert("제목을 입력하세요");
				return;
			}
				
			if (!url) { //혹은 url == ""
				alert("주소를 입력하세요");
				return;
			} 
			
			<%-- 	내 E: else if (${!fn.contains(url, "http"..) {  > 틀림 애초에 fn 라이브러리 안하고 스크립트 문법대로 아래처럼 하면됨, startsWith사용
				// !url.contains("http")이런식으로하면 안됨
				// ($에서{!f하고n.  contains..(url, "http")}) 이렇게하면 뜨긴하는데... http있어도 안됨. 
				alert("주소에서 http(https)와 같은 프로토콜까지 올바르게 입력하세요") 
			}
			>> 근데 이거 주석처리 잘 먹히다가 갑자기 f..n 썼는데 라이브러리사용으로되면서 에러났다, 위의 f..n 라이브러리 임포트없애서인듯. 
			주석에서도 쓰면 에러나니 주의하자 (에러난 Whitelabel 페이지 새로고침 계속하니 내용뜸)_ 주석에서도 라이브러리 쓰는거 제발 주의
			>> %주석이용하면 될듯/**/ 말고 --%>
			
			// http도 아니고 https도 아닐 때 잘못된 주소
			// (fn쓰는거 아님.. 스크립트상의문법쓰면됨 , 그리고 if따로 쓰면됨 else if 할거없이..?)
			if(url.startsWith("http://") == false && url.startsWith("https://") == false) {
				// 둘다 아니어야 하니까 엠퍼센트 &&
				alert("주소 형식이 잘못되었습니다.");
				return;
			}
			
			// 테스트
			// console.log(title);
			// console.log(url);
			
			// AJAX 호출 => 서버 전송
			$.ajax({
				// request
				type:"POST" // 대소문자상관x
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
			 /* , complete:function(data) // { -> 무조건 떠서 여기선 쓸 필요없음 
					alert("일단 완료") */
				, error:function(request, status, error) { // 이 경우 ajax 자체가 실패해서 뜸
					alert("요청에 실패했습니다. 관리자에게 문의해주세요.");
					// alert(request);
					// alert(status);
					// alert(error);
				}
			});
		});  // 이거 맞추는 거 주의 ㅠㅠ
	
	
		
}); 

</script>

</body>
</html>