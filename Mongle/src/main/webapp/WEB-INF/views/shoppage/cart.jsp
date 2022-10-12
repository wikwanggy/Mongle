<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/board.js"></script>
<link rel="stylesheet" href="/resources/css/shop/shop_board.css">
<link rel="stylesheet" href="/resources/css/main.css">
<link rel="stylesheet" href="/resources/css/shop/cart.css">
</head>
<body>
	<%--상단 시작 --%>
	<jsp:include page="../header.jsp"></jsp:include>
	<%--상단 끝 --%>
	<%--본문 넣을 자리 --%>
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
			<div>
				<form action="/shoppage/shop_board" method="post" id="shop_form"
					name="shop_form" enctype="multipart/form-data">
					<h1>장바구니</h1>

					<table id="table">
						<tr>
							<td><input type="checkbox"></td>
							<td style="wi" class="font">이미지</td>
							<td class="font">상품 정보</td>
							<td class="font">상품 금액</td>
							<td class="font">수량</td>
							<td class="font">총 금액</td>
						</tr>
						<c:forEach items="${list}" var="list">
							<c:forEach items="${list2}" var="list2">
								<tr>
									<td><input type="checkbox"></td>
									<td><img id="img" src="/display?filename=${list2.filem}"></td>
									<td class="font2"><a href="/shoppage/detail?bno=${list.prodbno}">${list2.w_name}</a></td>
									<td class="font2"><fmt:formatNumber value="${list2.w_price}"
											pattern="#,###" /></td>
									<td class="font2">${list.quantity}</td>
									<td></td>
								</tr>
							</c:forEach>
						</c:forEach>
					</table>
					<input type="button" value="등록하기" id="uploadBtn">
				</form>
			</div>
		</div>
		<div id="rs"></div>
	</div>
	<%--본문 넣을 자리 --%>
	<%--하단 시작 --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<%--하단 끝 --%>
</html>