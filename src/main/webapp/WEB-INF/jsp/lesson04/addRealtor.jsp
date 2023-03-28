<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공인중개사 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>공인중개사 추가</h1>
		
		<form method="post" action="/lesson04/quiz02/add_realtor">
			<div class="form-group">
				<label for="office">상호명</label>
				<input type="text" id="office" name="office" class="form-control col-4"> <!-- 상호명 칼럼에서 name아님 주의 ㅠㅠ -->
				<!-- 원래 id, name 도 input 태그에 적어주기 -->
			</div>
			<div class="form-group">
				<label>
					전화번호
					<input type="text" name="phoneNumber" class="form-control">
				</label>
			</div>
			<div class="form-group">
				<label>
					주소
					<input type="text" name="address" class="form-control">
				</label>
			</div>
			<div class="form-group">
				<label>
					등급
					<input type="text" name="grade" class="form-control">
				</label>
			</div>
		
			<button type="submit" class="btn btn-primary">추가</button>
		
		
		</form>
	
	
	
	</div>
</body>
</html>