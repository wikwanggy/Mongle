<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<jsp:include page="../header.jsp" />
<body>
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
		<h1>ID 찾기</h1>
			<form action="/Login/searchidcheck" method="post" id="searchidcheck"> 
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td><input type="text" id="bth" name="bth"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" name="email"></td>
					</tr>

					<tr>
						<th>전화번호</th>
						<td><input type="text" id="number" name="number"></td>
					</tr>
				</table>
				<br>
				<br>
				<div>
					<input type="submit" value="ID찾기">
				</div>
			</form>
		</div>
		<div id="rs"></div>
	</div>
	<div>
			<footer>
				<div id="bottomMenu">
					<ul>
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">이용안내</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<div id="sns">
						<ul>
							<li><a href="#"><img
									src="../resources/css/mainimg/FACEBOOK.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/INSTA.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/TWITTER.PNG" class="img2"></a></li>
						</ul>
					</div>
				</div>
				<div id="company">
					<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
				</div>
			</footer>
		</div>
		<script type="text/javascript" src="/resources/js/login/searchID.js"></script>
</body>

</html>