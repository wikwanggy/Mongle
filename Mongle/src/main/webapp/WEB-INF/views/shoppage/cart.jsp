<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

					<table border="1">
						<tr>
							<td><input type="checkbox"></td>
							<td><input type="text" class="name" id="product_name"
								name="w_name" placeholder="상품 이름"></td>
						</tr>
						<tr>
							<td>이미지</td>
							<td><input class="name" type="number" id="product_price"
								name="w_price" placeholder="가격"></td>
						</tr>
						<tr>
							<td>상품 정보</td>
							<td><input type="file" id="imagemain" name="main"></td>
						</tr>
						<tr>
							<td>상품 금액</td>
							<td><input type="file" id="imagesub" name="sub" multiple></td>
						</tr>
						<tr>
							<td>수량</td>
							<td><input class="name" type="number" id="product_Q"
								name="w_Quantity" placeholder="수량"></td>
						</tr>
						<tr>
						<td>총 금액</td>
						</tr>
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