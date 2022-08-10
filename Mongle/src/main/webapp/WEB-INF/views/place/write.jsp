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
					<div id="logo">
						<a href="#"><img alt="logo"
							src="../resources/css/mainimg/logo.png" id="logoimg"></a>
					</div>
					<ul id="topmenu">
						<li><a href="/signup/signup">회원가입</a></li>
						<li><a href="/signin/signin">로그인</a></li>
						<li><a href="/">MyPage</a></li>
						<li><a href="/">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="/">SHOP</a></li>
							<li><a href="/place">PLACE</a></li>
							<li><a href="/">EVENT</a></li>
							<li><a href="/">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<div>
			<main>
			<div id="ls"></div>
			<div id="cn">
				<form action="#">
					<table>
						<tr style="height: 40px">
							<th>카테고리</th>
							<td><select name="ctg" style="float: left">
									<option>카테고리</option>
									<option value="동물병원">동물병원</option>
									<option value="미용">미용</option>
									<option value="호텔">호텔</option>
									<option value="학교/유치원">학교/유치원</option>
									<option value="식당/카페">식당/카페</option>
							</select></td>
							<th>지역</th>
							<td><select name="loc" style="float: left"><option>지역</option>
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
							</select></td>
						</tr>
						<tr style="height: 40px">
							<th>제목</th>
							<td colspan="3"><input id="writetitle" type="text"></td>
						</tr>
						<tr style="height: 40px">
							<th>첨부</th>
							<td colspan="3"><input type="file" style="float: left"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3"><textarea id="writecontent" rows="20"></textarea></td>
						</tr>
					</table>
					<input type="submit" value="등록" class="button">
				</form>
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
