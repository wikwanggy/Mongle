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
					<a href="/"><img alt="logo"
						src="resources/css/mainimg/logo.png" id="logoimg"></a>
					<ul id="topmenu">
						<li>
							<div id="toplist">
								<c:choose>
									<c:when test="${sessionScope.login==null}">
										<a href="/Signup/Signup">회원가입</a>
										<a href="/Login/login">로그인</a>
									</c:when>
									<c:when test="${sessionScope.login.id=='admin'}">
										<a href="/Admin/Memberlist">관리자메뉴</a>
										<a href="/Login/logout">로그아웃</a>
									</c:when>
									<c:otherwise>
										<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a>
										<a href="/Login/logout">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div>
						</li>
						<li><a href="/service/servicemain">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="/shoppage/shop">SHOP</a>
								<ul>
									<li><a href="/shoppage/Snack">간식</a></li>
									<li><a href="/shoppage/beauty">미용용품</a></li>
									<li><a href="/shoppage/toy">장난감</a></li>
									<li><a href="/shoppage/House">하우스</a></li>
									<li><a href="/shoppage/fashion">패션</a></li>
									<li><a href="/shoppage/etc">기타</a></li>
								</ul></li>
							<li><a href="/place/board">PLACE</a>
								<ul>
									<li><a href="/place/board?ctgr=grooming">미용</a></li>
									<li><a href="/place/board?ctgr=clinic">동물병원</a></li>
									<li><a href="/place/board?ctgr=hotel">호텔</a></li>
									<li><a href="/place/board?ctgr=school">학교/유치원</a></li>
									<li><a href="/place/board?ctgr=cafe">식당/카페</a></li>
								</ul></li>
							<li><a href="/event/eventmain">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul></li>
							<li><a href="/community/list">커뮤니티</a>
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
			<section id="st_1"></section>
			<section id="st_2">
				<div id="st_box">
					<h1>
						<label id="st1_label">SHOP</label>
					</h1>
					<p id="st_text1">
						다양한 메뉴를 Mongle에서 즐겨보세요<br> 몽글만의 특별한 선택의 업체<br> 반려들을 위한
						완벽함을 자랑하는 푸드<br> 다양한 물건들이 많은 상품 <br> 소중한 반려에게 마음을전하는 <br>
						가장 좋은방법 Mongle
					</p>
					<a href="/shoppage/shop" id="btn_a"><input type="button"
						class="st_btn" value="자세히 보기"></a>
				</div>
				<img src="resources/css/mainimg/s_pt.png" id="s_pt">
			</section>
			<div id="combox">
				<div>
					<h3>사람들의 실제 후기가 궁금하다면? 아래의 버튼을 눌러주세요</h3>
					<a href="/community/review"><button>바로 가기</button></a>
				</div>
			</div>
			<section id="st_3">
				<h2>
					<label id="st1_label">HOTEL</label>
				</h2>
				<p id="st_text2" class="st1">
					많은 사용자들이 추천하는<br> 호텔을 찾아보세요! <br> <br>
				</p>
				<a href="/place/board" id="btn_a1"><input type="button"
					class="st_btn" value="자세히 보기"></a> <img
					src="resources/css/mainimg/s_pt1.png" id="s_pt1">
			</section>
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