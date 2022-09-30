<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>shop</title>
<link rel="stylesheet" href="/resources/css/shop/shop.css">
<link rel="stylesheet" href="/resources/css/shop/header.css">
<link rel="stylesheet" href="/resources/css/shop/footer.css">
</head>
<body>
	<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
		<%--본문 넣을 자리 --%>
		<!-- header 끝 -->

		<!-- main 전체 -->
		<div id="main">
		<div id="main_left">
			<!-- center 시작 -->
			<div id="cn">
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
					</ul>
				</div>
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
		<%--본문 넣을 자리 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</body>
</html>
