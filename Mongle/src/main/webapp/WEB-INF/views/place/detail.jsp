<!-- main jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="/resources/css/shop/header.css">
<link rel="stylesheet" href="/resources/css/shop/footer.css">
<link rel="stylesheet" href="/resources/css/place/content.css">
<link rel="stylesheet" href="/resources/css/place/kakaoMAp.css">

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/resources/js/place/placeReply.js"></script>
<script type="text/javascript" src="/resources/js/place/placeAttach.js"></script>
<script type="text/javascript" src="/resources/js/place/placeList.js"></script>
<script type="text/javascript" src="/resources/js/place/placeRecup.js"></script>
<title>내용</title>
</head>
<jsp:include page="../header.jsp" />
<body>

	<div class="main">
		<div id="ls">
			<form method="get" action="/place/board" id="ctgrForm">
				<ul id="place-list">
				<li id="1" class=""><a href="/place/board">전체보기</a></li>
				<li id="2" class=""><a title="clinic" href="/place/board?ctgr=clinic">동물병원</a></li>
				<li id="3" class=""><a title="grooming"
					href="/place/board?ctgr=grooming">미용</a></li>
				<li id="4" class=""><a title="hotel" href="/place/board?ctgr=hotel">호텔</a></li>
				<li id="5" class=""><a title="school" href="/place/board?ctgr=school">학교/유치원</a></li>
				<li id="6" class=""><a title="cafe" href="/place/board?ctgr=cafe">식당/카페</a></li>
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
						<p class="subject">${detail.title}</p>
						<ul class="date">
							<li>작성자 : ${detail.id}</li>
							<li>조회수 : ${detail.cnt}</li>
							<li>작성날짜 : ${detail.date}</li>
						</ul>
						<div class="dv-vew">
						<div id="photo"> <ul></ul> </div>
						
						${detail.content}</div>
					</div>
				</div>

				<div id="file"> <ul></ul> </div>

				<div style="text-align: right">
					<c:choose>
						<c:when test="${sessionScope.login.id=='admin'}">
							<a href="/place/remove?bno=${detail.bno}"> <input
								type="button" value="삭제"></a>
						</c:when>
						<c:when test="${sessionScope.login.id==detail.id}">
							<a href="/place/modifyform?bno=${detail.bno}"> <input
								type="button" value="수정"></a>
							<a href="/place/remove?bno=${detail.bno}"> <input
								type="button" value="삭제"></a>
						</c:when>
						<c:otherwise>
							
						</c:otherwise>
					</c:choose>
				</div>
			</form>

		<div align="center">
			<c:if test="${sessionScope.login.id == null}">
				<button id="like" style="font-size: 30px">♡</button>
				<p>추천수 : ${detail.likecnt}</p>
				<br>추천 기능은 
				<a href="/Login/login" type="button" id="newLogin" style="color:blue;"> 로그인</a>후 사용 가능합니다.	
			</c:if>

			<c:if test="${sessionScope.login.id != null}">
				<div>
					<input type="button" class="LikeBtn" value="♡"
						style="font-size: 30px">
					<p>추천수 : ${detail.likecnt}</p>

					<input type="hidden" value="${like}" id="like"> <input
						type="hidden" value="${sessionScope.login.id}" id="id"> <input
						type="hidden" value="${detail.bno}" name="bno" id="bno">
				</div>
			</c:if>
		</div>
			<br> <br>
	<!-- 		<div class="map_wrap" style="margin:20px;">
				<div id="map"
					style="width: 600px; height: 300px; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								키워드 : <input type="text" value="울산 동물병원" id="keyword" size="15">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>

 -->
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
					<input type="button" value="댓글쓰기" id="add" class="bt btn btn-blue"
						style="cursor: pointer">
				</div>

			</div>
			<table>
				<tr>
					<td><div class="btn-box">
							<a href="/place/board">목록</a>
						</div></td>
					<td><div class="btn-box">
							<c:choose>
								<c:when test="${sessionScope.login==null}">
									<a href="/Login/login" id="loginNull">글쓰기</a>
								</c:when>
								<c:when test="${sessionScope.login.id=='admin'}">
									<a href="/place/write">공지등록</a>
								</c:when>
								<c:otherwise>
									<a href="/place/write">글쓰기</a>
								</c:otherwise>
							</c:choose>
						</div></td>
				</tr>
			</table>
		</div>
	</div>
	<div id="rs"></div>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93ed3fadc4dfa50afff064beaff51b58&libraries=services"></script>
	<script src="/resources/js/place/kakaoMap.js"></script>
</body>
<jsp:include page="../footer.jsp" />
</html>
