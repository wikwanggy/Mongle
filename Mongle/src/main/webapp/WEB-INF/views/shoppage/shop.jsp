<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>shop</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/shop.js"></script>
<!-- <script type="text/javascript" src="/resources/js/shop/attach.js"></script> -->
<link rel="stylesheet" href="/resources/css/shop/shop.css">
<link rel="stylesheet" href="/resources/css/shop/header.css">
<link rel="stylesheet" href="/resources/css/shop/footer.css">
</head>
<body>
	<%--상단 시작 --%>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<%--상단 끝 --%>
	<%--본문 넣을 자리 --%>
	<!-- header 끝 -->

	<!-- main 전체 -->
	<div id="main">		
			<!-- center 시작 -->
			<div id="cn">
				<a href="/shoppage/shop_list"><input type="button" value="상품리스트"></a>
				<a href="/shoppage/shop_board"><input type="button" value="상품등록"></a>
				<form action="/shoppage/shop" id="searchForm" method="get">
					<select name="type">
						<option value="T">이름</option>
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
				</ul>
				<br> <br> <br>
				<!-- shop 메인 탭 -->
				<div class="Goods">
					<ul class="Goodss">
						<!-- 상품 리스트 for문 -->
						<c:forEach items="${shop}" var="shoplist">
							<li>
								<div>
									<input type="text" value="${shoplist.bno}" hidden="">
								</div>
								<div>
									<a href="/shoppage/Detail?bno=${shoplist.bno}"> <img
										class="img" src="/display?filename=${shoplist.filem}"></a>
								</div>
								<div>
									상품명<span class="font">${shoplist.w_name}</span>
								</div>
								<div>
									가격<span class="font">${shoplist.w_price}</span>
								</div>
								<div>
									<span>리뷰</span>
								</div>
							</li>
						</c:forEach>
						<!-- 상품 리스트 for문 종료 -->
					</ul>
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
	<div id="pag">
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
	</div>
	<br>
	<!-- main 끝 -->
	<!-- bottom 시작 -->
	<%--본문 넣을 자리 --%>
	<%--하단 시작 --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<%--하단 끝 --%>
</body>
</html>