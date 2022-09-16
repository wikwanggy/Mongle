<!-- main jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/place/content.css">
<title>내용</title>
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
		<div>
			<main>
			<div id="ls">
				<ul id="place-list">
					<li><a href="/place/clinic">동물병원</a></li>
					<li><a href="/place/grooming">미용</a></li>
					<li><a href="/place/hotel">호텔</a></li>
					<li><a href="/place/school">학교/유치원</a></li>
					<li><a href="/place/cafe">식당/카페</a></li>
				</ul>
			</div>
			<div id="cn">

				<div id="contents">
					<div class="titarea">
						<h1 class="tit">카테고리명</h1>
						<p>카테고리설명</p>
					</div>

					<div class="vew-wr">
						<h2 class="subject">글제목</h2>
						<ul class="date">
							<li>작성자 :</li>
							<li>DATE : 2022.07.25</li>
							<li>HIT : 조회수</li>
						</ul>
						<div class="dv-vew">글 내용</div>
					</div>
				</div>
				<!-- /vew-wr -->
				<div class="bottom-lst" id="dCommentList">
					<div class="item">
						<div class="hd">
							<div class="name">
								<span>작성자</span> <span class="fate">data : 2022.07.26</span>
							</div>
						</div>
						<div class="con">
							<div class="desc">댓글내용</div>
						</div>
					</div>
				</div>
				<!-- /bottom-lst-->
				<div class="bottom-write">
					<div class="inbx">
						<textarea class="textarea block" id="txtContents"></textarea>
						<a style="cursor: pointer" class="bt btn btn-blue"
							id="aRegComment">댓글달기</a>
					</div>

				</div>
				<table>
					<tr>
						<td><div class="btn-box">
								<a href="/place">목록</a>
							</div></td>
						<td><div class="btn-box">
								<a href="/place/write">글쓰기</a>
							</div></td>
					</tr>
				</table>

			</div>
		</div>
	</div>
	<div id="rs"></div>
	</main>
	</div>
	<div>
		<footer>
			<div id="bottomMenu">
				<ul>
					<li><a href="/company/company">회사 소개</a></li>
					<li><a href="/company/company">개인정보처리방침</a></li>
					<li><a href="/company/company">이용안내</a></li>
					<li><a href="/company/company">고객센터</a></li>
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
