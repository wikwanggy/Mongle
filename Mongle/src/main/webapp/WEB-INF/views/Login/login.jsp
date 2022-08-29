<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/login/login.js"></script>
</head>
<body>
	<div class="Loginform">
		<form action="/Login/loginpost" method="post" id="login">
			<img src="../resources/css/signin/signinimg/logo.png">
			<h1>Please sign in</h1>
			<div>
				<input type="text" name="id" placeholder="아이디" id="id">
			</div>
			<div>
				<input type="password" name="password" placeholder="비밀번호"
					id="password">
			</div>
			<div>
			<c:choose>
				<c:when test="${sessionScope.login==null}">
					<input type="submit" value="로그인">
				</c:when>
				<c:otherwise>
				${sessionScope.login.id}님 환영합니다.<br>
					<a href="/Login/logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
			</div>
			<div id="chcerkbox">
				<span>아이디 저장<input type="checkbox" id="cb_saveId" /></span>
			</div>
			
		</form>
		<form>
			<input class="btn" type="submit" value="Sign UP"
				formaction="/signup/signup">
			<p>제작자 3조</p>
		</form>
	</div>
</body>
</html>