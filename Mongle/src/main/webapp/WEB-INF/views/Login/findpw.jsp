<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/Login/findpw",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<link rel="stylesheet" href="/resources/css/login/findpw.css">
<title>Insert title here</title>
</head>

<body>
	<div class="Loginform">
		<div class="w3-content w3-container w3-margin-top">
				<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 456.3px;">
					<div class="w3-center w3-large w3-margin-top">
					<img src="/resources/css/login/login/logo.png">
						<h3>비밀번호 찾기</h3>
					</div>
					<div>
						<p>
							<label >아이디</label><br>
							<input class="w3-input" type="text" id="id" name="id" placeholder="회원가입한 아이디를 입력하세요" required>
						</p><br><br>
						<p>
							<label>이메일</label><br>
							<input class="w3-input" type="text" id="email" name="email" placeholder="회원가입한 이메일주소를 입력하세요" required>
						</p><br><br>
						<p class="w3-center">
							<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn"id="">찾기</button>
							<button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn" id="btn">로그인으로</button>
						</p>
					</div>
				</div>
			</div>
		</div>
</body>
</html>