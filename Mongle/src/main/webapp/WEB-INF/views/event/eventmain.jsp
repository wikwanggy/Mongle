<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\event\eventmain.css">
</head>
<body>
	<div id="container">
		<div id="hd">
			<header>
				<div id="tm">
					<div id="logo"><a href="/"><img alt="logo" src="/resources/css/mainimg/logo.png" id="logoimg"></a></div>
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
							<li><a href="http://localhost:8080/event/eventmain">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
<%-- 이벤트 본문  시작점 --%>
<div id="eventbon">
	<div id="event-bon-line">
	
		<ul class="event-kategorie">
			<li><a href="#" class="event-katebox">진행 이벤트</a></li>
			<li><a href="#" class="event-katebox">종료 이벤트</a></li>
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
</body>
</html>