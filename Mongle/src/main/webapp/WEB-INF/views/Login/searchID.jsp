<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/resources/css/login/searchid.css">
</head>
<body>
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
		<div class="Loginform">
			<h1>ID 찾기</h1>
			<form action="/Login/searchidcheck" method="get" id="searchidcheck"> 
				<img src="/resources/css/login/login/logo.png">
				<table>
					<tr>
						<th>이름</th>
					</tr>
					<tr>
						<td><input type="text" id="name" name="name"></td>
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
				<div >
					<input type="submit" value="ID찾기" class="btn">
				</div>
			</form>
		</div>
		</div>
		<div id="rs"></div>
	</div>
		<script type="text/javascript" src="/resources/js/login/searchID.js"></script>
</body>
</html>