<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>shop</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/shop.js"></script>
<!-- <script type="text/javascript" src="/resources/js/shop/attach.js"></script> -->
<link rel="stylesheet" href="/resources/css/shop/shop.css">
</head>
<body>
	<div id="container">
		<!-- header 시작 -->
		<div id="hd">
			<header>
				<div id="tm">
					<a href="/"><img alt="logo"
						src="/resources/css/mainimg/logo.png" id="logoimg"></a>
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
							<li><a href="/shoppage/shop">SHOP</a></li>
							<li><a href="#">PLACE</a></li>
							<li><a href="#">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
							<li><a href="/shoppage/shop_board" id="shop_board">상품 등록</a></li>
						</ul>
					</nav>
				</div>

			</header>
		</div>
		<!-- header 끝 -->

		<!-- main 전체 -->
		<div id="main">
			<!-- main left 시작 -->
			<div id="ls">
				<ul id="ls menu">
					<li><a href="/shoppage/Snack">간식</a></li>
					<li><a href="/shoppage/beauty">미용용품</a></li>
					<li><a href="/shoppage/toy">장난감</a></li>
					<li><a href="/shoppage/House">하우스</a></li>
					<li><a href="/shoppage/fashion">패션</a></li>
					<li><a href="/shoppage/etc">기타</a></li>
				</ul>
			</div>
			<!-- main left 끝 -->
			<!-- center 시작 -->
			<div id="cn">
				<h2>
					<a href="/shoppage/shop">전체상품</a>
				</h2>
				<input type="button" value="글쓰기"
					onclick="location.href='http://localhost:8080/board/detail'">
				<form action="/shoppage/shop" id="searchForm" method="get">
					<select name="type">
						<option value="T">이름</option>
						<option value="C">종류</option>
						<option value="TC">이름+종류</option>
					</select> <input type="text" name="keyword"> <input type="text"
						name="pageNum" value="${paging.scri.amount}" hidden=""> <input
						type="text" name="amount" value="${paging.scri.amount}" hidden="">
					<input type="button" value="검색">
				</form>
				<ul id="cnm">
					<li><a href="#">인기도순</a></li>
					<li><a href="#">누적판매순</a></li>
					<li><a href="#">낮은가격순</a></li>
					<li><a href="#">리뷰순</a></li>
					<li><a href="#">평점높은순</a></li>
				</ul>
				<br> <br> <br>
				<div class="Goods">
					<ul class="Goodss">
						<li><c:forEach items="${shop}" var="shoplist">
								<div>${shoplist.bno}"></div>
								<div>
									<a href="/shoppage/Detail?bno=${shoplist.attach.bno}"><img
										alt="${shoplist.attach.p_name}" src="D:\upload\${p_image}"></a>
								</div>
								<div>
									상품명<span>${shoplist.w_name}</span>
								</div>
								<div>
									가격<span>${shoplist.w_price}</span>
								</div>
								<div>
									<span>리뷰</span><span>평점</span>
								</div>

							</c:forEach></li>
						<li>
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/beauty.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/fashion.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/feed.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/House.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/House1.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/Snack.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
						<li class="Goodss">
							<div class="img_box">
								<a href="/shoppage/Detail"><img class="img"
									src="/resources/image/toy.jpg"></a>
							</div>
							<div>상품명</div>
							<div>가격</div> <span>리뷰</span> <span>평점</span>
						</li>
					</ul>
					<!-- prev(이전)이 true이면 이전버튼 화설화 -->
					<c:if test="${paging.prev}">
						<a
							href="/shoppage/shop?pageNum=${paging.startPage-1}&amount=${paging.scri.amount}">이전</a>
					</c:if>

					<!-- begin(1) end(10)될 동안 반복(1일 10일 될 동안 반복) -->
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="num">
						<a
							href="/shoppage/shop?type=${paging.scri.type}&keyword=${paging.scri.keyword}&pageNum=${num}&amount=${paging.scri.amount}">${num}</a>
					</c:forEach>

					<!-- next(다음)이 true이면 다음버튼 활성화 -->
					<c:if test="${paging.next}">
						<a
							href="/shoppage/shop?pageNum=${paging.endPage+1}&amount=${paging.scri.amount}">다음</a>
					</c:if>
					<br>
					<!-- ${paging} -->
				</div>
			</div>
			<!-- center 끝 -->
			<!-- right 시작 -->
			<div id="rs">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVT1.PNG" class="event" id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVN2.PNG" class="event" id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVEN3.PNG" class="event" id="ev3"></a></li>
				</ul>
			</div>
			<!-- right 끝-->
		</div>
		<!-- main 끝 -->
		<!-- bottom 시작 -->
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
		<!-- bottom 끝 -->
	</div>
</body>
</html>
