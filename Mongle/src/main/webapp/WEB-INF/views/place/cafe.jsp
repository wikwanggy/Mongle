<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="/resources/css/place/place.css">
<script type="text/javascript" src="/resources/js/placeList.js"></script>
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
						<li><a href="#">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
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
			<div class=main>
			<div id="ls">
				<ul id="place-list">
					<li><a href="/place/clinic">동물병원</a></li>
					<li><a href="/place/grooming">미용</a></li>
					<li><a href="/place/hotel">호텔</a></li>
					<li><a href="/place/school">학교/유치원</a></li>
					<li id="slt"><a href="/place/cafe">식당/카페</a></li>
				</ul>
			</div>
			<div id="cn">
			
			<form action="/place/cafe" method="get" id="searchForm">
	   		   <select name="type">
		         <option value="T">제목</option>
		         <option value="C">작성자</option>
		         <option value="TC">제목+게시글</option>
		      </select> 
	      <input type="text" name="pageNum" value="${paging.cri.pageNum}">
	      <input type="text" name="amount" value="${paging.cri.amount}">
	      <input type="text" name="keyword">
	      <input type="button" value="검색" name="search">
      </form>
				<table id="list" border="1">
					<tr>
						<th width="50px"><select name="loc" id="loc-select">
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
					<c:forEach items="${list}" var="list">
						<tr>
							<td>${list.loc}</td>
							<td><a href="/place/detail?bno=${list.bno}">${list.title}</a></td>
							<td>${list.id}</td>
							<td>${list.date}</td>
							<td>${list.cnt}</td>
							<td>${list.rec}</td>
						</tr>
					</c:forEach>
				</table>
	<!-- prev=true면 이전버튼 활성화 -->
	<c:if test="${paging.prev}">
	<a href="/place/cafe?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
	</c:if>
	
	<!-- begin이 end될동안 반복 10 -->
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
 	<a href="/place/cafe?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
	</c:forEach>
	
	<!-- next=true면 다음버튼 활성화 -->
	<c:if test="${paging.next}">
	<a href="/place/cafe?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
	</c:if>
	<br>
	<a href="/place/write"><button>글쓰기</button></a>




			</div>
			<div id="rs"></div>
			</div>
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
