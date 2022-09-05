<!-- main jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/place/content.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/placeReply.js"></script>
<script type="text/javascript" src="/resources/js/placeAttach.js"></script>
<title>내용</title>
</head>
<body>
	<div id="container">
		<!-- 바디 전체를 container로 지정 -->
		<div id="hd">
			<!-- header 전체를 hd로 지정 -->
			<header>
				<div id="tm">
					<div id="logo">
						<a href="/"><img alt="logo"
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
									<li><a href="/place/grooming">미용</a></li>
									<li><a href="/place/clinic">동물병원</a></li>
									<li><a href="/place/hotel">호텔</a></li>
									<li><a href="/place/school">학교/유치원</a></li>
									<li><a href="/place/cafe">식당/카페</a></li>
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
				<ul id="place-list">
					<li><a href="/place/clinic">동물병원</a></li>
					<li><a href="/place/grooming">미용</a></li>
					<li><a href="/place/hotel">호텔</a></li>
					<li><a href="/place/school">학교/유치원</a></li>
					<li><a href="/place/cafe">식당/카페</a></li>
				</ul>
			</div>
			<div id="cn">
			<form method="post">
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
							<li>HIT : ${detail.rec}</li>
						</ul>
						<div class="dv-vew">${detail.content}</div>
					</div>
				</div>
				<div id="uploadResult">
					<ul></ul>
				</div>
				<input type="submit" value="수정" formaction="/place/modify">
				<input type="submit" value="삭제" formaction="/place/remove">
				</form>
				<!-- /vew-wr -->
				<div class="bottom-lst" id="dCommentList">
					<div class="item">
						<div class="hd">
							<div class="name">
								<span>작성자</span> <span class="fate">data : </span>
							</div>
						</div>
						<div class="con">
							<div class="desc">댓글내용</div>
						</div>
					</div>
				</div>
				
				<div id="chat">
					<ul id="replyUL">
					</ul>
				</div>
				
				<!-- /bottom-lst-->
				<div class="bottom-write">
					<div class="inbx">
						<textarea class="textarea block" id="reply txtContents"></textarea>
							<input type="button" value="댓글쓰기" id="add aRegComment" class="bt btn btn-blue" style="cursor: pointer">
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

	<script src="resources/js/main.js"></script>
</body>
</html>
