<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/login/searchpw.css">
</head>
<body>
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
			<div class="Loginform">
			<h1>PW 찾기</h1>
			<form action="/Login/searchpwcheck" method="post" id="searchpwcheck">
			<img src="/resources/css/login/login/logo.png"> 
				<table>

					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<th>아이디</th>
					</tr>
					<tr>
						<td><input type="text" id="id" name="id"></td>
					</tr>
					<tr>
						<th>이메일</th>
					</tr>
					<tr>

						<td><input type="text" id="email" name="email"></td>
					</tr>
					<tr>
						<th>전화번호</th>
					</tr>
					<tr>
						<td><input type="text" id="number" name="number"></td>
					</tr>
				</table>
				<br>
				<br>
				<div>
					<input type="submit" value="PW찾기" class="btn">
				</div>
			</form>
		</div>
		</div>
		<div id="rs"></div>
	</div>
<script type="text/javascript" src="/resources/js/login/searchPW.js"></script>
</body>

</html>