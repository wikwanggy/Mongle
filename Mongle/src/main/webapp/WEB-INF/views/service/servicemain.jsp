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
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<ul id="menu">
							<li><a href="http://localhost:8080/controller/">HOME</a></li>
							<li><a href="#">SHOP</a>
								<ul>
									<li><a href="#">간식</a></li>
									<li><a href="#">미용용품</a></li>
									<li><a href="#">장난감</a></li>
									<li><a href="#">하우스</a></li>
									<li><a href="#">패션</a></li>
									<li><a href="#">기타</a></li>
								</ul>
							</li>
							<li><a href="http://localhost:8080/controller/place/">PLACE</a>
								<ul>
									<li><a href="http://localhost:8080/controller/place/grooming">미용</a></li>
									<li><a href="http://localhost:8080/controller/place/clinic">동물병원</a></li>
									<li><a href="http://localhost:8080/controller/place/hotel">호텔</a></li>
									<li><a href="http://localhost:8080/controller/place/school">학교/유치원</a></li>
									<li><a href="http://localhost:8080/controller/place/cafe">식당/카페</a></li>
								</ul>
							</li>
							<li><a href="#">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul>
							</li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="#">게시판</a></li>
									<li><a href="#">리뷰</a></li>
								</ul>
							</li>
						</ul>
				</div>
			</header>
		</div>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
			<aside id="service_aside"><%--왼쪽 사이드바 --%>
			<h2 id="service_aside_header"><a href="servicemain">고객센터</a></h2>
			<ul>
				<li><a href="faq">자주묻는 질문(FAQ)</a></li>
				<li><a href="questions">1:1질문(Q&A)</a></li>
				<li><a href="order">주문</a></li>
				<li><a href="shipping">배송/환불</a></li>
			</ul>
			</aside>
			<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">고객센터(main)</span>
			<p id="service_main_subtitle">자주 물어본 질문 10</p>
			<div id="service_main_content">
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">번호</li>
					<li class="service_main_li service_main_tit" >제목</a></li>
					<li class="service_main_li service_main_reg">작성일</li>
					<li class="service_main_li service_main_cnt">조회수</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">1</li>
					<li class="service_main_li service_main_tit"><a href="#">aasdfssdaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">2</li>
					<li class="service_main_li service_main_tit" ><a href="#">sdaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">3</li>
					<li class="service_main_li service_main_tit" ><a href="#">aㅁㅁㅁ</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">4</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
								<ul class="service_main_ul">
					<li class="service_main_li service_main_no">5</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">6</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">7</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">8</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">9</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
				<ul class="service_main_ul">
					<li class="service_main_li service_main_no">10</li>
					<li class="service_main_li service_main_tit" ><a href="#">aasdfsdaaf</a></li>
					<li class="service_main_li service_main_reg">08-09</li>
					<li class="service_main_li service_main_cnt">0</li>
				</ul>
			</div>
			</div><%--본문div끝 --%>
		</div>
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