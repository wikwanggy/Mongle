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
<script type="text/javascript" src="/resources/js/Detail.js"></script>
<link rel="stylesheet" href="/resources/css/shop/Detail.css">
</head>
<body>
	<form method="get">
		<div id="container">
			<!-- header 시작 -->
			<div id="hd">
				<header id="header">
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
						<div id="br"></div>
						<div id="cnt_header">
							<div id="cnt-header_left">
								<img id="img" alt="반려동몰 손 브러쉬" src="/resources/image/beauty.jpg">
							</div>
							<div id="box">
								<div id="cnt-header_right">
									<header id="title_header">
										<div>
											<h2>반려동물 손 브러쉬</h2>
											<div id="marks">
												<div id="sale" class="mark">SALE</div>
												<div id="best" class="mark">BEST</div>
											</div>
										</div>
										<div id="price">
											<span>900,000원</span>
										</div>
										<div>
											<span id="sale_percent" style="color: red;">50%</span> <span
												id="sale_price">450,000원</span>
										</div>
									</header>
									<div>
										<div>
											<span class="title"><b>브랜드</b></span><span></span>
										</div>
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
											<!-- &nbsp:공백주기 -->
											<div>
												<select style="width: 500px; height: 30px;"><option>&nbsp&nbsp&nbsp옵션선택/색상</option>
													<option>&nbsp&nbsp색상</option></select>
											</div>
											<br>
											<div>
												<select style="width: 500px; height: 30px;"><option>&nbsp&nbsp컬러선택</option>
													<option>&nbsp&nbsp레드</option>
													<option>&nbsp&nbsp블루</option>
													<option>&nbsp&nbsp골드</option></select>
											</div>
										</div>
									</div>
									<div id="bun">
										<p>색상/</p>
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
									<li name="detail" class="active"><a href=".product-detail">상세정보</a></li>
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
								<!-- 상품 설명 -->
								<li class="product-detail"><input type="hidden" name="bno"
									value="${detail.product_id}"></li>
								<li class="product-review"></li>
								<li class="product-qna"></li>
								<li class="product-etc"></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- center 시작 -->
				<!-- center 끝 -->
				<!-- right 시작 -->
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVT1.PNG" class="event" id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVN2.PNG" class="event" id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1"
							src="/resources/css/mainimg/EVEN3.PNG" class="event" id="ev3"></a></li>
				</ul>
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
										src="/resources/css/mainimg/facebook.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="/resources/css/mainimg/insta.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="/resources/css/mainimg/twitter.PNG" class="img2"></a></li>
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
