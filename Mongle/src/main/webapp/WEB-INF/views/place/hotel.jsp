<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>

<script src="${path}http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/place/place.css">
<script type="text/javascript" src="${path}/resources/js/place/place.js"></script>
</head>
<body>
	<div id="container">
		<div id="hd">
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
		<div>
			<main>
			<div id="ls">
				<ul id="place-list">
					<li><a href="/place/clinic">동물병원</a></li>
					<li><a href="/place/grooming">미용</a></li>
					<li id="slt"><a href="/controller/place/hotel">호텔</a></li>
					<li><a href="/place/school">학교/유치원</a></li>
					<li><a href="/place/cafe">식당/카페</a></li>
				</ul>
			</div>
			<div id="cn">
				<table id="list" border="1">
					<tr>
						<th width="50px">
						<select name="loc" id="loc-select">
								<option>지역</option>
								<option value="서울">서울</option>
								<option value="인천">인천</option>
								<option value="경기">경기</option>
								<option value="부산">부산</option>
								<option value="대구">대구</option>
								<option value="울산">울산</option>
								<option value="광주">광주</option>
								<option value="대전">대전</option>
								<option value="강원">강원</option>
								<option value="충북">충북</option>
								<option value="충남">충남</option>
								<option value="전북">전북</option>
								<option value="전남">전남</option>
								<option value="경북">경북</option>
								<option value="경남">경남</option>
								<option value="제주">제주</option>
						</select></th>
						<th width="550px">제목</th>
						<th width="100px">작성자</th>
						<th width="100px">날짜</th>
						<th width="40px">조회</th>
						<th width="40px">추천</th>
					</tr>
					<tr><td>서울</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>인천</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>경기</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>부산</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>대구</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>울산</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>광주</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>대전</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>강원</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>충북</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>충남</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>전북</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>전남</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>경북</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>경남</td><td></td><td></td><td></td><td></td><td></td></tr>
					<tr><td>제주</td><td></td><td></td><td></td><td></td><td></td></tr>
				</table>
				<br>
				<a href="/place/write"><button class="button">글쓰기</button></a>
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
									src="../resources/css/mainimg/facebook.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/insta.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/twitter.PNG" class="img2"></a></li>
						</ul>
					</div>
				</div>
				<div id="company">
					<p>제 3조 팀 프로젝트 참여자 : 현우 연희 민서 석현 광규</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>
