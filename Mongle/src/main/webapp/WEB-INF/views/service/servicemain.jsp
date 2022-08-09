<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\service.css">
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
						<li><a href="/service/servicemain">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="/shop">SHOP</a></li>
							<li><a href="#">PLACE</a></li>
							<li><a href="/eventmain">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<%--본문 넣을 자리 --%>
		<div id="service_main"> <%-- 본문  div --%>
			<aside id="service_aside"><%--왼쪽 사이드바 --%>
			<ul>
				<li><a href="#"><strong>고객센터</strong></a></li>
				<li><a href="#">QnA</a></li>
				<li><a href="#">1:1질문</a></li>
				<li><a href="#">주문</a></li>
				<li><a href="#">배송</a></li>
				<li><a href="#">환불</a></li>
				<li><a href="#">회원 정보 수정</a></li>
				<li><a href="#">킾2</a></li>
			</ul>
			</aside>
			<div id="service_main_page">
			<span id="service_main_title">QnA</span>
			<div>테스트용 제목에따른 내용</div>
			</div><%--본문 --%>
		</div>
		
		<%--본문 넣을 자리 --%>
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