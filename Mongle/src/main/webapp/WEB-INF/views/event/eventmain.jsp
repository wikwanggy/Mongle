<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\event\eventmain.css">
</head>
<body>
	<div id="container">
		<!-- 바디 전체를 container로 지정 -->
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
									<li><a href="/shoppage/Snack">간식</a></li>
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
<%-- 이벤트 본문  시작점 --%>
<div id="eventbon">
	
					<div id="ls">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn1.png" class="event"  id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn2.png" class="event"  id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn3.png" class="event"  id="ev3"></a></li>
				</ul>
			</div>
	
	<div id="event-bon-line">
	
		<ul class="event-kategorie">
			<li><a href="http://localhost:8080/event/eventmain" class="event-katebox" id="event-katebox1">진행 이벤트</a></li>
			<li><a href="#" class="event-katebox" id="event-katebox2">종료 이벤트</a></li>
			<li><a href="#" class="event-katebox" id="event-katebox3">이벤트 당첨</a></li>
		</ul>
		
		<div class="event-count-box">
		총
		<span class="event-count">7</span>
		건
		</div>
		
		<ul id="eventone">
			<li>
				<a href="event1" class="event_sub_page">
				<img class="event_img" alt="고양이이벤트1" src="../resources/image/image1.jpg">
				<p id="evp" class="evp1">박스1</p>
				<p id="evp" class="evp2">08.04~08.31</p>	
				</a>
			</li>
			<li>
				<a href="event2" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트2" src="../resources/image/image2.jpg">
				<p id="evp" class="evp1">박스2</p>
				<p id="evp" class="evp2">08.04~09.31</p>	
				</a>
			<li>
				<a href="event3" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트3" src="../resources/image/image3.jpg">
				<p id="evp" class="evp1">박스3</p>
				<p id="evp" class="evp2">08.01~08.31</p>	
				</a>
			</li>
			<li>
				<a href="event4" class="event_sub_page">
				<img class="event_img" alt="강아지 이벤트1" src="../resources/image/image4.jpg">
				<p id="evp" class="evp1">박스4</p>
				<p id="evp" class="evp2">08.01~08.31</p>	
				</a>
			</li>
				<li>
				<a href="event5" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트4" src="../resources/image/image5.jpg">
				<p id="evp" class="evp1">박스5</p>
				<p id="evp" class="evp2">07.15~08.22</p>	
				</a>
			</li>
			<li>
				<a href="event6" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트5" src="../resources/image/image6.jpg">
				<p id="evp" class="evp1">박스6</p>
				<p id="evp" class="evp2">06.20~08.30</p>	
				</a>
			</li>
			<li>
				<a href="event7" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트6" src="../resources/image/image7.png">
				<p id="evp" class="evp1">박스7</p>
				<p id="evp" class="evp2">06.10~08.30</p>	
				</a>
			</li>
		</ul>
	</div>
</div>
<%-- 이벤트 본문  끝부분 --%>

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
</div>
</body>
</html>