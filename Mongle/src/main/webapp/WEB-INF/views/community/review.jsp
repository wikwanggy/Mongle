<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
<div id="reviews">
	<h1>후기</h1>
	<div id="shop_review">
		<ul>
			<li>
				<!-- 상품사진, a상품이름, 추천, 상품후기, 날짜 -->
			</li>
		</ul>
		







		<table border="1" id="review_board">
			<tr height="40px">
				<td width="50px">글번호</td>
				<td width="200px">상품명</td>
				<td width="400px">상품후기</td>
				<td width="75px">작성자</td>
				<td width="125px">날짜</td>
			</tr>
			<!-- 리뷰 모아보기
				글번호, 상품명, 
			
			-->
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
		<p id="review_search">
			<input type="search"><a href="#">검색</a>
		</p>
	</div>
</div>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>