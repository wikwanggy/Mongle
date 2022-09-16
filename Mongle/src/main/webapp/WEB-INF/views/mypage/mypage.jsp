<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mypage/mypage.css">
</head>
<body>
	<div id="container">
		<div id="hd">
				<header>
					<div id="tm">
					<a href="/"><img alt="logo"src="resources/css/mainimg/logo.png" id="logoimg"></a>
					<ul id="topmenu">
						<li>
							<div id="toplist">
								<c:choose>
									<c:when test="${sessionScope.login==null}">
										<a href="/Signup/Signup" >회원가입</a>
										<a href="/Login/login">로그인</a>
									</c:when>
									<c:when test="${sessionScope.login.id=='admin'}">
										<a href="/Admin/Memberlist" >관리자메뉴</a>
										<a href="/Login/logout">로그아웃</a>
									</c:when>
									<c:otherwise >
										<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a>
										<a href="/Login/logout">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div></li>
						<li><a href="/service/servicemain">고객센터</a></li>
					</ul>
				</div>
					<div>
						<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="/shoppage/shop">SHOP</a>
								<ul>
									<li><a href="/shoppage/snack">간식</a></li>
									<li><a href="/shoppage/beauty">미용용품</a></li>
									<li><a href="/shoppage/toy">장난감</a></li>
									<li><a href="/shoppage/House">하우스</a></li>
									<li><a href="/shoppage/fashion">패션</a></li>
									<li><a href="/shoppage/etc">기타</a></li>
								</ul></li>
							<li><a href="/place/">PLACE</a>
								<ul>
									<li><a href="/place/grooming">미용</a></li>
									<li><a href="/place/clinic">동물병원</a></li>
									<li><a href="/place/hotel">호텔</a></li>
									<li><a href="/place/school">학교/유치원</a></li>
									<li><a href="/place/cafe">식당/카페</a></li>
								</ul></li>
							<li><a href="/event/eventmain">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul></li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="/community/list">게시판</a></li>
									<li><a href="/community/review">리뷰</a></li>
								</ul></li>
						</ul>
					</nav>
					</div>
				</header>
			</div>
			<div id="main">
				
				<div id="ls"></div>
					<div id="cn">
						<form>
							<h2>My Page</h2>
								<table>
								<tr>
									<th>이름</th>
									<td><input type="text" value="${mypage.name}" name="name" readonly ></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" value="${mypage.id}" name="id" readonly></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="text" value="${mypage.bth}" name="bth" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" value="${mypage.gender}" name="gender" readonly></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" value="${mypage.email}" name="email" readonly></td>
								</tr>
							</table><br><br>
							<div>
								<a href="/mypage/leave?id=${sessionScope.login.id}"><input type="button" value="회원탈퇴" class="btn"></a>
								<a href="/mypage/detail?id=${sessionScope.login.id}"><input type="button" value="회원정보수정" class="btn"></a>
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
										src="../resources/css/mainimg/facebook.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="../resources/css/mainimg/insta.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="../resources/css/mainimg/twitter.PNG" class="img2"></a></li>
							</ul>
						</div>
					</div>
					<div id="company">
						<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
					</div>
				</footer>
			</div>
		</div>

	
</body>
</html>