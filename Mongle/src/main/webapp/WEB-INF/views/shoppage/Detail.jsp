
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>shop</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script type="text/javascript" src="/resources/js/shop/Detail.js"></script> -->
<link rel="stylesheet" href="/resources/css/shop/Detail.css">
</head>
<body>
	<form method="get">
		<div id="container">
			<!-- header 시작 -->
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
											<a href="/Signup/Signup">회원가입</a>
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
			<!-- header 끝 -->

			<!-- main 전체 -->
			<div id="test">
				<div id="main">
					<div id="cnt">
						<div id="cnt_header">
							<div id="cnt-header_left">
								<img id="img" src="/display?filename=${main.filem}">
							</div>
							<div id="box">
								<div id="cnt-header_right">
									<div id="title_header">
										<div id="detail_name">
											<h2>${main.w_name}</h2>
										</div>
										<div id="price">
											<span>${main.w_price}원</span>
										</div>
									</div>
									<div id="shipping">
										<div>
											<span class="title"><b>배송방법</b></span><span>택배</span>
										</div>
										<div>
											<span class="title"><b>배송비</b></span><span>무료(50,000원
												이상 무료배송)</span>
										</div>
										<div>
											<span class="title"><b>배송 안내</b></span><br> <span>무료배송/제주도25,000원
												추가/도서산간50,000원 추가/반품 및 교환비50,000원</span>
										</div>
									</div>
									<div>
										<div id="color">
											<div>
												
													<select style="width: 600px; height: 50px;" id="selcbk">
													<option>&nbsp;&nbsp;색상 선택</option>
													<c:forEach items="${sub}" var="sub">
														<option>${sub.w_color}</option>
														</c:forEach>
													</select>
												
											</div>
										</div>
									</div>
									<div id="bun">
										<p style="font-size: 20px;">색상/</p>
										<button type="button" id="plus" class="but" value="-">-</button>
										<input type="text" id="Quantity" class="but" value="1">
										<button type="button" id="minus" class="but" value="+">+</button>
										<span>원</span>
									</div>
									<div id="sum">
										<strong>총 상품 금액</strong>
										<div id="sum2">
											<em>총 수량 개</em> <strong>원</strong>
										</div>
									</div>
									<div>
										<input type="submit" id="purchase" value="구매하기" formaction="#">
									</div>
									<br>
									<div id="list">
										<input id="inquiry" type="submit" value="문의하기" formaction="#">
										<input id="wish" type="submit" value="찜하기" formaction="#">
										<input id="basket" type="submit" value="장바구니" formaction="#">
									</div>
								</div>
							</div>
						</div>

						<!-- 상품 설명,리뷰,문의,배송 전체 -->
						<div id="btfTab">
							<!-- 상품 상세 메뉴 -->
							<div id="slidemenu">
								<ul id="tab-titles">
									<li name="detail" class="active"><a href="#product-detail">상세정보</a></li>
									<li name="review" class="active"><a href="#product-review">구매평</a></li>
									<li name="qna" class="active"><a
										href="http://localhost:8080/shoppage/Detail#product-etc">상품문의
											<span class="product-tab-review-count">(0)</span>
									</a></li>
									<li name="etc" class="active"><a href="#product-etc">배송/반품/교환
											안내</a></li>
								</ul>
							</div>
							<!-- 상품 설명,리뷰,문의,배송 전체 배치 -->
							<ul class="tab-contents">
								<c:forEach items="${sub}" var="sub">
									<!-- 상품 설명 -->
									<li id="product-detail"><img
										src="/display?filename=${sub.filem}"></li>
								</c:forEach>
								<li id="product-review"></li>
								<li id="product-qna"></li>
								<li id="product-etc"></li>
							</ul>
						</div>
					</div>
				</div>
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
										src="/resources/css/mainimg/FACENBOOK.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="/resources/css/mainimg/INSTA.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="/resources/css/mainimg/TWITTER.PNG" class="img2"></a></li>
							</ul>
						</div>
					</div>
					<div id="company">
						<p id="p">제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
					</div>
				</footer>
			</div>
			<!-- bottom 끝 -->
		</div>
	</form>
</body>
</html>
