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
				<h1>상품 수정 게시판</h1>
				<form action="/shoppage/modify?bno=${main.bno}" method="post"
					id="shop_form" name="shop_form" enctype="multipart/form-data">
					<table border="1">
						<tr>
							<td>상품 이름</td>
							<td><input type="text" class="name" id="product_name"
								name="w_name" value="${main.w_name}"></td>
						</tr>
						<tr>
							<td>상품 가격</td>
							<td><input class="name" type="number" id="product_price"
								name="w_price" value="${main.w_price}"></td>
						</tr>
						<tr>
							<td>썸네일 사진</td>
							<td><img src="/display?filename=${main.filem}"></td>
						</tr>

						<tr>
							<td>상품 수량</td>
							<td><input class="name" type="number" id="product_Q"
								name="w_Quantity" value="${main.w_Quantity}"></td>
						</tr>
					</table>
					<div id="bth">
						<input type="submit" value="수정하기" class="bth"> <a
							href="/shoppage/shop_list"><button type="button" value="목록으로"
								class="bth">목록으로</button></a>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div>
		<div id="rs"></div>
	</div>
	<%--본문 넣을 자리 --%>
	<%--하단 시작 --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<%--하단 끝 --%>
</html>