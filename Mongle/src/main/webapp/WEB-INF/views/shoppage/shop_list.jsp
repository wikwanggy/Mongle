<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/shop/shop_list.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
			<h3>상품 등록 리스트</h3>
			<table border="1">
				<tr>
					<td>상품번호</td>
					<td>상품 이미지</td>
					<td>상품명</td>
					<td>가격</td>
					<td>수량</td>
					<td>등록 일자</td>
				</tr>
				<c:forEach items="${shop_list}" var="list">
					<tr>
						<td>${list.bno}</td>
						<td><img id="img" src="/display?filename=${list.filem}"></td>
						<td><a href="/shoppage/Detail?bno=${list.bno}">${list.w_name}</a></td>
						<td>${list.w_price}원</td>
						<td>${list.w_Quantity}</td>
						<td>${list.w_regdata}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="rs"></div>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>