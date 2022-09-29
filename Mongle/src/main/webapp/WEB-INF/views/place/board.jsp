<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/resources/js/place/placeList.js"></script>
<link rel="stylesheet" href="/resources/css/place/place.css">

</head>
<body>
	<div id="container">
		<div id="hd">
			<header>
				<div id="tm">
					<a href="/"><img alt="logo"
						src="resources/css/mainimg/logo.png" id="logoimg"></a>
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
						<li><a href="/service/servicemain">고객센터</a></li>
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
							<li id="1"><a href="/place/board">전체보기</a></li>
							<li id="2"><a title="clinic" href="/place/board?ctgr=clinic">동물병원</a></li>
							<li id="3"><a title="grooming" href="/place/board?ctgr=grooming">미용</a></li>
							<li id="4"><a title="hotel" href="/place/board?ctgr=hotel">호텔</a></li>
							<li id="5"><a title="school" href="/place/board?ctgr=school">학교/유치원</a></li>
							<li id="6"><a title="cafe" href="/place/board?ctgr=cafe">식당/카페</a></li>
						</ul>
				</div>
				<div id="cn">

					<form action="/place/board" method="get" id="searchForm">
						<select name="type">
							<option value="T">제목</option>
							<option value="C">작성자</option>
							<option value="TC">제목+게시글</option>
						</select>
						<input type="text" name="pageNum" value="${paging.pcri.pageNum}">
						<input type="text" name="amount" value="${paging.pcri.amount}">
						<input type="text" name="keyword" value="${paging.pcri.keyword}">
						<input type="text" name="ctgr" value="${paging.pcri.ctgr}">
						<input type="text" name="loc" value="${paging.pcri.loc}">
						<input type="button" value="검색" name="search">
					</form>
					<table id="list" border="1">
						<tr>
							<th width="50px">

								<form method="get" action="/place/board?ctgr=${paging.pcri.ctgr}" id="locForm">
									<select name="loc" id="loc-select">
										<option value=null>지역</option>
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
									</select>
								</form>
							</th>
							<th width="550px">제목</th>
							<th width="100px">작성자</th>
							<th width="100px">날짜</th>
							<th width="40px">조회</th>
							<th width="40px">추천</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.loc}</td>
								<td style="text-align:left; padding-left: 20px;"><a href="/place/detail?bno=${list.bno}">${list.title}</a><span style="color:red">  [${list.replycnt}]</span></td>
								<td>${list.id}</td>
								<td>
									<fmt:parseDate pattern = "yyyy-MM-dd" value="${list.date}" var="date"/>
									<fmt:formatDate pattern = "yyyy-MM-dd" value="${date}" />
								</td>
								<td>${list.cnt}</td>
								<td>${list.likecnt}</td>
							</tr>
						</c:forEach>
					</table>

					<!-- prev=true면 이전버튼 활성화 -->
					<c:if test="${paging.prev}">
						<a
							href="/place/board?type=${paging.pcri.type}&keyword=${paging.pcri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.pcri.amount}&ctgr=${paging.pcri.ctgr}&loc=${paging.pcri.loc}">이전</a>
					</c:if>

					<!-- begin이 end될동안 반복 10 -->
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="num">
						<a
							href="/place/board?type=${paging.pcri.type}&keyword=${paging.pcri.keyword}&pageNum=${num}&amount=${paging.pcri.amount}&ctgr=${paging.pcri.ctgr}&loc=${paging.pcri.loc}">${num}</a>
					</c:forEach>

					<!-- next=true면 다음버튼 활성화 -->
					<c:if test="${paging.next}">
						<a
							href="/place/board?type=${paging.pcri.type}&keyword=${paging.pcri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.pcri.amount}&ctgr=${paging.pcri.ctgr}&loc=${paging.pcri.loc}">다음</a>
					</c:if>


					<br> 
					
					<c:choose>
						<c:when test="${sessionScope.login==null}">
								<a href="/Login/login"><button id="loginNull">글쓰기</button></a>
						</c:when>
						<c:when test="${sessionScope.login.id=='admin'}">
							<a href="/place/write"><button>공지등록</button></a>
						</c:when>
						<c:otherwise>
							<a href="/place/write"><button>글쓰기</button></a>
						</c:otherwise>
					</c:choose>


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
