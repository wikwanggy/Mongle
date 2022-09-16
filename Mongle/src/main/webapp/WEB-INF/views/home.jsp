<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/main.css">
<title>Mongle-몽글</title>
</head>
<body>
	<div id="container">

		<div id="hd">
			<!-- header 전체를 hd로 지정 -->
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
						<li><a href="/shoppage/shop_board" id="shop_board">상품 등록</a></li>
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
							<li><a href="/event">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul></li>
							<li><a href="/event/eventmain">EVENT</a>
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
			<div class="main_div">
				<div>
					<span>반려가구 1500만 시대에 누구 </span>
				</div>
			</div>
			<section id="st_1"><h1>반려동물과 함께하는 세상 <label id="st1_label">"Mongle"</label> 입니다. </h1></section>
			<div class="main_div">
				<div>
					<span> 오늘도 Mongle을 찾아주셔서 감사합니다.</span>
				</div>
			</div>
			<section id="st_2">귀여운 애기냥이 보고 다들 기분 좋아지세요!</section>
			<div class="main_div">
				<div>
					<span> 오늘도 Mongle을 찾아주셔서 감사합니다.</span>
				</div>
			</div>
			<section id="st_3">
				집사가 데려나가길 바라고 있는 우리 냥이
				그런 냥이랑 놀고 싶은 우리 강아지들을 챙겨주세요.
			</section>
			<div class="main_div">
				<div>
					<span> 오늘도 Mongle을 찾아주셔서 감사합니다.</span>
				</div>
			</div>
			<section id="st_4">section 4번</section>
		</div>
		<div>
			<footer>
				<div id="bottomMenu">
					<ul>
						<li><a href="/company/company">회사 소개</a></li>
						<li><a href="/company/company">개인정보처리방침</a></li>
						<li><a href="/company/company">이용안내</a></li>
						<li><a href="/service/servicemain">고객센터</a></li>
					</ul>
					<div id="sns">
						<ul>
							<li><a href="#"><img
									src="/resources/css/mainimg/FACENBOOK.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="/resources/css/mainimg/INSTA.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="/resources/css/mainimg/TWITTER.PNG" class="img2"></a></li>
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