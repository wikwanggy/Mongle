<!-- main jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main.css">
<title>main</title>
</head>
<body><!--  -->
	<div id="container">
		<div id="hd">
			<header>
				<div id="tm">
					<div id="logo"><a href="http://localhost:8080/Mongle/"><img alt="logo" src="resources/css/mainimg/logo.png" id="logoimg"></a></div>
					<ul id="topmenu">
						<li><a href="http://localhost:8080/Mongle/signup/signup">회원가입</a></li>
						<li><a href="http://localhost:8080/Mongle/signin/signin">로그인</a></li>
						<li><a href="#">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="#">HOME</a></li>
							<li><a href="#">SHOP</a></li>
							<li><a href="#">PLACE</a></li>
							<li><a href="#">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<div>
			<main>
			<div id="ls">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1" src="resources/css/mainimg/EVT1.PNG" class="event"  id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="resources/css/mainimg/EVN2.PNG" class="event"  id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="resources/css/mainimg/EVEN3.PNG" class="event"  id="ev3"></a></li>
				</ul>
			</div>
			<div id="cn">
				<div id="slideShow">
					<div id="slides">
						<img src="resources/css/mainimg/slides4.PNG" alt="슬라이더 2"> 
						<img src="resources/css/mainimg/slides2.png" alt="슬라이더 2"> 
						<img src="resources/css/mainimg/slides3.png" alt="슬라이더 2">
						<button id="prev">&lang;</button>
						<button id="next">&rang;</button>
					</div>
				</div>
				<div id="SB">
					<h2>SHOP BEST</h2>
					<ul>
						<li><a href="#"><img alt="SHOP BEST1"
								src="resources/css/mainimg/dog1.PNG" class="sbimg"></a></li>
						<li><a href="#"><img alt="SHOP BEST2"
								src="resources/css/mainimg/dog2.PNG" class="sbimg"></a></li>
						<li><a href="#"><img alt="SHOP BEST3"
								src="resources/css/mainimg/dog3.PNG" class="sbimg"></a></li>
						<li><a href="#"><img alt="SHOP BEST4"
								src="resources/css/mainimg/dog4.PNG" class="sbimg"></a></li>
					</ul>
				</div>
				<div id="HB">
					<h2>HOTEL BEST</h2>
					<ul>
						<li><a href="#"><img alt="HOTEL BEST1"
								src="resources/css/mainimg/dog5.PNG" class="htimg"></a></li>
						<li><a href="#"><img alt="HOTEL BEST2"
								src="resources/css/mainimg/dog6.PNG" class="htimg"></a></li>
						<li><a href="#"><img alt="HOTEL BEST3"
								src="resources/css/mainimg/dogicon2.PNG" class="htimg"></a></li>
						<li><a href="#"><img alt="HOTEL BEST4"
								src="resources/css/mainimg/dogicon3.PNG" class="htimg"></a></li>
					</ul>
				</div>
			</div>
			<div id="rs"></div>
			</main>
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
	</div>
	<script src="resources/js/main.js"></script>
</body>
</html>
