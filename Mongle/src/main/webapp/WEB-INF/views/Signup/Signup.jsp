<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/signup/signup.css">
</head>
<body>
<div id="signup">
	<img src="/resources/css/signup/signupimg/logo.png" alt="로고"><a href="/"></a>
	<form action="/Signup/Signup" method="post" id="form">
		<div id="idbox">
			<h3>아이디</h3>
			<input type="text" name="id" id="id" placeholder="아이디"  class="input">
			<br>
		</div>
		<div id="passwordbox">
			<h3>비밀번호</h3>
			<input type="password" name="password" id="password" placeholder="비밀번호"  class="input"> <br>
		</div>
		<div id="passwordbox2">
			<h3>비밀번호 확인</h3>
			<input type="password" id="password2" placeholder="비밀번호 확인" class="input"> <br>
		</div>
		<div id="namebox">
			<h3>이름</h3>
			<input type="text" id="name" name="name" placeholder="이름" class="input"><br>
		</div>
		<div>
			<h3>생년월일</h3>
			<input type="text" placeholder="년" id="yy" class="bth">
			<select id="mm" class="bth">
				<option>월</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<input type="text" placeholder="일" id="dd" class="bth">	
			<input type="hidden" id="bth" name="bth" >	
		</div>
		<div>
			<h3>성별</h3>
			<select id="gender" name="gender"  class="input">
				<option value="남성">남성</option>
				<option value="여성">여성</option>
				<option value=null>선택안함</option>
			</select>
		</div>
		<div id="emailbox">
			<h3>이메일</h3>
			<input type="text" name="email" placeholder="이메일" id="email" class="input"><br>
		</div>
		<div>
			<input type="submit" value="가입하기" class="input">
		</div>
	</form>
</div>
<script type="text/javascript" src="/resources/js/Signup/Signup.js"></script>
</body>
</html>