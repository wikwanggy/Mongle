<!-- main jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/place/content.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/place/placeReply.js"></script>
<script type="text/javascript" src="/resources/js/place/placeAttach.js"></script>
<script type="text/javascript" src="/resources/js/place/placeList.js"></script>
<script type="text/javascript" src="/resources/js/place/placeRecup.js"></script>
<title>내용</title>
</head>
<body>
	<div id="container">
		<!-- 바디 전체를 container로 지정 -->
		<div id="hd">
			<!-- header 전체를 hd로 지정 -->
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
							<li><a href="/">SHOP</a>
								<ul>
									<li><a href="/">간식</a></li>
									<li><a href="/">미용용품</a></li>
									<li><a href="/">장난감</a></li>
									<li><a href="/">하우스</a></li>
									<li><a href="/">패션</a></li>
									<li><a href="/">기타</a></li>
								</ul></li>
							<li><a href="/place">PLACE</a>
								<ul>
									<li><a href="#">미용</a></li>
									<li><a href="#">동물병원</a></li>
									<li><a href="#">호텔</a></li>
									<li><a href="#">학교/유치원</a></li>
									<li><a href="#">식당/카페</a></li>
								</ul></li>
							<li><a href="/">EVENT</a>
								<ul>
									<li><a href="/">진행 이벤트</a></li>
									<li><a href="/">종료 이벤트</a></li>
								</ul></li>
							<li><a href="/">커뮤니티</a>
								<ul>
									<li><a href="/">게시판</a></li>
									<li><a href="/">리뷰</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<div>
			<div class="main">
				<div id="ls">
					<form method="get" action="/place/board" id="ctgrForm">
						<ul id="place-list">
							<li id="1"><a href="/place/board">전체보기</a></li>
							<li id="2"><a title="clinic" href="/place/board?ctgr=clinic">동물병원</a></li>
							<li id="3"><a title="grooming"
								href="/place/board?ctgr=grooming">미용</a></li>
							<li id="4"><a title="hotel" href="/place/board?ctgr=hotel">호텔</a></li>
							<li id="5"><a title="school" href="/place/board?ctgr=school">학교/유치원</a></li>
							<li id="6"><a title="cafe" href="/place/board?ctgr=cafe">식당/카페</a></li>
						</ul>
					</form>
				</div>
				<div id="cn">
					<form method="get">
						<div id="contents">
							<div class="titarea">
								<h1 class="tit">${detail.ctgr}</h1>
							</div>

							<div class="vew-wr">
								<h2 class="subject">${detail.title}</h2>
								<ul class="date">
									<li>작성자 : ${detail.id}</li>
									<li>${detail.bno}</li>
									<li>DATE : ${detail.date}</li>
								</ul>
								<div class="dv-vew">${detail.content}</div>


							</div>
						</div>
						<div id="uploadResult">
							<input type="hidden" value="${detail.bno}" name="bno" id="bno">
							<ul></ul>
						</div>

						<div style="text-align: right">
							<a href="/place/modifyform?bno=${detail.bno}"><input
								type="button" value="수정"></a> <a
								href="/place/remove?bno=${detail.bno}"><input type="button"
								value="삭제"></a>
						</div>
					</form>

					
						<c:if test="${sessionScope.login.id == null}">
							<button id="like" style="font-size: 30px">♡</button>
							<p>추천수 : ${detail.likecnt}</p>
							<br>
						추천 기능은 <a href="/Login/login" type="button" id="newLogin"> 로그인</a> 후 사용 가능합니다.	
						</c:if>
						
						<c:if test="${sessionScope.login.id != null}">
							<div>
						<input type="button" class="LikeBtn" value="♡" style="font-size: 30px">
								<p>추천수 : ${detail.likecnt}</p>
								<input type="text" value="${like}" id="like">
								<input type="text" value="${sessionScope.login.id}" id="id">
							</div>
						</c:if>
					



					<!-- /vew-wr -->
					<div class="bottom-lst" id="dCommentList">
						<div class="item">

							<div class="con">
								<div class="desc">
									<div id="chat">
										<ul id="replyUL"></ul>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- /bottom-lst-->
					<div class="bottom-write">
						<div class="inbx">
							<textarea class="textarea block" id="reply"></textarea>
							<input type="button" value="댓글쓰기" id="add"
								class="bt btn btn-blue" style="cursor: pointer">
						</div>

					</div>
					<table>
						<tr>
							<td><div class="btn-box">
									<a href="/place/board">목록</a>
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


</body>
</html>
