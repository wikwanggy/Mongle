<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>shop</title>
<link rel="stylesheet" href="/resources/css/shop/Detail.css">
</head>
<body>
	<div id="container">
		<!-- header 시작 -->
		<div id="hd">
			<header>
				<div id="tm">
					<div id="logo">
						<a href="/"><img alt="logo"
							src="/resources/css/mainimg/logo.png" id="logoimg"></a>
					</div>
					<ul id="topmenu">
						<li><a href="/signup/signup">회원가입</a></li>
						<li><a href="/signin/signin">로그인</a></li>
						<li><a href="#">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="/shop">SHOP</a></li>
							<li><a href="#">PLACE</a></li>
							<li><a href="#">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<!-- header 끝 -->

		<!-- main 전체 -->
		<div id="main">
			<!-- center 시작 -->
			<div id="cn">
				<div class="Goods">
					<div class="img_box">
						<a href="/shoppage/Detail"><img class="img"
							src="/resources/image/beauty.jpg"></a>
					</div>
				</div>
			</div>
			<!-- center 끝 -->
			<!-- right 시작 -->
			<div id="rs">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVT1.PNG" class="event" id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVN2.PNG" class="event" id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVEN3.PNG" class="event" id="ev3"></a></li>
				</ul>
			</div>
			<!-- right 끝-->
		</div>
		<!-- main 끝 -->
		<!-- bottom 시작 -->
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
									src="resources/css/mainimg/facebook.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="resources/css/mainimg/insta.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="resources/css/mainimg/twitter.PNG" class="img2"></a></li>
						</ul>
					</div>
				</div>
				<div id="company">
					<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
				</div>
			</footer>
		</div>
		<!-- bottom 끝 -->
	</div>
</body>
</html>
