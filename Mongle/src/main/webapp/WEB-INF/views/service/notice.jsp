<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\notice.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/test.js"></script>
</head>
<body>
	<div id="container">
		<!-- 바디 전체를 container로 지정 -->
		<div id="hd">
			<!-- header 전체를 hd로 지정 -->
			<header>
				<div id="tm">
					<a href="/"><img alt="logo"src="../resources/css/mainimg/logo.png" id="logoimg"></a>
					<ul id="topmenu">
						<li>
							<div id="toplist">
								<c:choose>
									<c:when test="${sessionScope.login==null}">
										<a href="/signup/signup" >회원가입</a>
										<a href="/Login/login">로그인</a>
									</c:when>
									<c:otherwise>
										<a href="/Login/logout">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div></li>
						<li><a href="/mypage/mypage">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="#">SHOP</a>
								<ul>
									<li><a href="#">간식</a></li>
									<li><a href="#">미용용품</a></li>
									<li><a href="#">장난감</a></li>
									<li><a href="#">하우스</a></li>
									<li><a href="#">패션</a></li>
									<li><a href="#">기타</a></li>
								</ul></li>
							<li><a href="/place/">PLACE</a>
								<ul>
									<li><a href="/place/grooming">미용</a></li>
									<li><a href="/place/clinic">동물병원</a></li>
									<li><a href="/place/hotel">호텔</a></li>
									<li><a href="/place/school">학교/유치원</a></li>
									<li><a href="/place/cafe">식당/카페</a></li>
								</ul></li>
							<li><a href="#">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul></li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="#">게시판</a></li>
									<li><a href="#">리뷰</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
			<aside id="service_aside"><%--왼쪽 사이드바 --%>
			<h2 id="service_aside_header"><a href="servicemain">고객센터</a></h2>
			<ul>
				<li class="a_on"><a href="notice">공지사항</a><li>
				<li><a href="faq">자주묻는 질문(FAQ)</a></li>
				<li><a href="questions">1:1문의</a></li>
			</ul>
			</aside>
			<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">공지사항</span>
			<div id="service_noticelist">
				<div id="service_noticelist_top">
					<div id="notice_list_td1">번호</div>
					<div id="notice_list_td2">제목</div>
					<div id="notice_list_td3">등록일자</div>
					<div id="notice_list_td4">작성자</div>
				</div>
				<dl id="service_noticelist_lower">
				<!-- for문 시작 -->
				<c:forEach items="${list}" var="notice">
					<dt id="service_noticelist_num">
						<div id="notice_list_td1">${notice.bno }</div>
						<div id="notice_list_td2"><a class="notice_list_link" href="javascript:onoffDisplay();">${notice.title }</a></div>
						<div id="notice_list_td3">${notice.regdate }</div>
						<div id="notice_list_td4">${notice.name }</div>
					</dt>
					<dd style="display:none;">
					</dd>
				</c:forEach>
					<!-- for문 끝 -->
				</dl>
			 </div>
			 <input id="notice_button" type="submit" value="1:1질문하러가기" style="cursor: pointer" onclick="location.href='write'">
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