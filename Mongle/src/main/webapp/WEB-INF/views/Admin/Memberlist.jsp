<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/admin/admin.js"></script>
<link rel="stylesheet" href="../resources/css/admin/member.css">
</head>
<body>
	<div id="container">
		<div id="hd">
			<header>
				<div id="tm">
					<a href="/"><img alt="logo"
						src="../resources/css/mainimg/logo.png" id="logoimg"></a>
					<ul id="topmenu">
						<li>
							<div id="toplist">
								<c:choose>
									<c:when test="${sessionScope.login==null}">
										<a href="Signup/Signup">회원가입</a>
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
							<li><a href="#">PLACE</a>
								<ul>
									<li><a href="#">미용</a></li>
									<li><a href="#">동물병원</a></li>
									<li><a href="#">호텔</a></li>
									<li><a href="#">학교/유치원</a></li>
									<li><a href="#">식당/카페</a></li>
								</ul></li>
							<li><a href="#">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
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
		<div id="main">

			<div id="ls">
			</div>
			<div id="cn">
				
					<h2>MemberList</h2>
					<form action="/Admin/Memberlist" method="get" id="searchForm">
						<select name="type">
							<option value="I">아이디</option>
							<option value="N">이름</option>
							<option value="IN">아이디+이름</option>
						</select>
						<!--  -->
						<input type="text" name="keyword">
						<input type="hidden" name="pageNum" id="pageNum" value="${paging.cri.pageNum}"> 
						<input type="hidden" name="amount" value="${paging.cri.amount}">
						<input type="button" value="검색" name="sh">
					</form>
					<table>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>이메일</th>
							<th>체크</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.name}</td>
								<td>${list.id}</td>
								<td>${list.bth}</td>
								<td>${list.gender}</td>
								<td>${list.email}</td>
								<td><input type="checkbox"></td>
							</tr>
						</c:forEach>
					</table>
					<br> <br>
					<!-- prev=true면 이전버튼 활성화 -->
					<c:if test="${paging.prev}">
						<a href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage-1}&amount=${paging.cri.amount}">이전</a>
					</c:if>

					<!-- begin이 end될동안 반복 10 -->
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="num">
						<a
							href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
					</c:forEach>

					<!-- next=true면 다음버튼 활성화 -->
					<c:if test="${paging.next}">
						<a href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
					</c:if>
			</div>
			<div id="rs"></div>

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
					<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
				</div>
			</footer>
		</div>
	</div>


</body>
</html>