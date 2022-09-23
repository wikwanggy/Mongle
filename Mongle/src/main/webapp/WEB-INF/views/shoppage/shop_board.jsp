<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/board.js"></script>
</head>
<body>
	<form action="/shoppage/shop_board" method="post" id="shop_form" name="shop_form"
		enctype="multipart/form-data">
		<h1>상품 등록 게시판</h1>
		<table border="1">
			<tr>
				<td>상품 이름</td>
				<td><input type="text" class="shop_name" id="product_name" name="w_name" placeholder="상품 이름"></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><input type="number"  class="shop_price" id="product_price"name="w_price" placeholder="가격"></td>
			</tr>
			<tr>
				<td>썸네일 사진</td>
				<td><input type="file" id="imagemain" name="main"></td>
			</tr>
			<tr>
				<td>상품 설명 사진 첨부</td>
				<td><input type="file" id="imagesub" name="sub" multiple></td>
			</tr>
			<tr>
				<td>상품 색상</td>
				<td><input type="text" class="shop_color" id="product_color" name="w_color" placeholder="색상"><button type="button" id="multi" name="multi_color">+</button></td>
				<td class="multi"></td>
			</tr>
			<tr>
				<td>상품 종류</td>
				<td><select id="product_type" class="shop_type" name="w_type">
						<option>간식</option>
						<option>미용용품</option>
						<option>장난감</option>
						<option>하우스</option>
						<option>패션</option>
						<option>기타</option>
				</select></td>
			</tr>
			<tr>
				<td>상품 수량</td>
				<td><input type="number" class="shop_Q" id="product_Q" name="w_Quantity" placeholder="수량"></td>
			</tr>
		</table>
		<input type="button" value="등록하기" id="uploadBtn">
		<div id="uploadResult">
			<ul>
			</ul>
		</div>
		<div id="uploadResult2">
			<ul>
			</ul>
		</div>
	</form>
</body>
</html>