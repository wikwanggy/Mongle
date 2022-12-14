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
	<a href="/"><img src="/resources/css/signup/signupimg/logo.png" alt="로고"></a>
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
			<input type="text" placeholder="년" id="yy" class="bth" pattern="[0-9]{4,4}" title="'1998'와 같은 4자리 숫자" name="bth_yy">
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
			<input type="text" placeholder="일" id="dd" class="bth" name="bth_dd">	
			<input type="hidden" id="bth" name="bth" >	
		</div>
		<div>
			<h3>성별</h3>
			<select id="gender" name="gender"  class="input">
				<option value="남성">남성</option>
				<option value="여성">여성</option>
			</select>
		</div>
		<div id="emailbox">
			<h3>이메일</h3>
			<input type="text" name="email" placeholder="이메일" id="email" class="input"><br>
		</div>
		<div id="addrbox">
			<h3>주소<button type="button" id="searchaddr" >주소찾기</button></h3> 
			<input id="member_addr" type="text" placeholder="주소" class="input" readonly><br>
		</div>
		<div>
			<input type="text" id="detail_addr" placeholder="상세 주소" class="input"><br>
			<input type="hidden" id="addr" name="addr" >
		</div>
		<div id="addrbox1">
			<input type="text" name="addr_post" placeholder="우편번호" id="addr_post" class="input"readonly>		
		</div>
		<div id="numberbox">
			<h3>전화번호</h3>
			<input type="text" name="number" placeholder="전화번호" id="number" class="input"><br>
		</div>
		<div>
			<input type="submit" value="가입하기" class="input" id="sb_btn">
		</div>
	</form>
</div>
<script type="text/javascript" src="/resources/js/Signup/Signup.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>