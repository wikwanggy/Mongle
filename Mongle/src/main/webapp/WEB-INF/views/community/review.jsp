<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="commu_top">
	<ul>
		<li><a href="http://localhost:8080/community/list">커뮤니티</a></li>
		<li><a href="http://localhost:8080/community/review"><b>사용후기</b></a></li>
		<li><a href="http://localhost:8080/community/notice">공지사항</a></li>
	</ul>
</div>



<!-- <div id="review_all">
<div id="review_gallary"> -->
<div id="review">
	<div class="rv_top">
		<b class="rv_b">펫 용품/식품 BEST 후기</b>
	</div>
		<ul>
			<li>
				<div class="review_box">
					<div class="rv_img"><img src="../resources/image/review.png"></div>
					<div class="rv_txt">
						<div class="brand">
							<p>브랜드명</p>
							<p>상품명</p>
							<p>상품가격</p>
						</div>
						<div class="star_review">
							<p>별점</p>
							<a href="#">후기/클릭시 상품 페이지로 이동</a>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="review_box">
					<div class="rv_img"><img src="../resources/image/review.png"></div>
					<div class="rv_txt">
						<div class="brand">
							<p>브랜드명</p>
							<p>상품명</p>
							<p>상품가격</p>
						</div>
						<div class="star_review">
							<p>별점</p>
							<a href="#">후기/클릭시 상품 페이지로 이동</a>
						</div>
					</div>
				</div>
			</li>
			<li>
				<div class="review_box">
					<div class="rv_img"><img src="../resources/image/review.png"></div>
					<div class="rv_txt">
						<div class="brand">
							<p>브랜드명</p>
							<p>상품명</p>
							<p>상품가격</p>
						</div>
						<div class="star_review">
							<p>별점</p>
							<a href="#">후기/클릭시 상품 페이지로 이동</a>
						</div>
					</div>
				</div>
			</li>
		</ul>
	<div class="rv_top">
		<b class="rv_b">펫 이용 장소 BEST 후기</b>
	</div>
	<ul>
		<li>
			<div class="review_box">
				<div class="rv_img"><img src="../resources/image/review.png"></div>
				<div class="rv_txt">
					<div class="brand">
						<p>호텔명</p>
						<p>간략한 위치</p>
					</div>
					<div class="star_review">
						<p>별점</p>
						<a href="#">후기/클릭시 호텔 상세 페이지로 이동</a>
					</div>
				</div>
			</div>
		</li>
		<li>
			<div class="review_box">
				<div class="rv_img"><img src="../resources/image/review.png"></div>
				<div class="rv_txt">
					<div class="brand">
						<p>호텔명</p>
						<p>간략한 위치</p>
					</div>
					<div class="star_review">
						<p>별점</p>
						<a href="#">후기/클릭시 호텔 상세 페이지로 이동</a>
					</div>
				</div>
			</div>
		</li>
		<li>
			<div class="review_box">
				<div class="rv_img"><img src="../resources/image/review.png"></div>
				<div class="rv_txt">
					<div class="brand">
						<p>호텔명</p>
						<p>간략한 위치</p>
					</div>
					<div class="star_review">
						<p>별점</p>
						<a href="#">후기/클릭시 호텔 상세 페이지로 이동</a>
					</div>
				</div>
			</div>
		</li>
	</ul>
</div>
<div id="reviews">
	<b class="rv_b" style="margin-left:150px;">사용후기</b>
	<div id=review_search>
		<select id="rv_sel">
			<option>전체</option>
			<option>상품</option>
			<option>장소</option>
		</select>
		<input type="search" placeholder="상품명 검색" id="rv_search2"><a href="#">검색</a>
	</div>
	<div id="shop_review">
		<table border="1" id="review_board">
			<tr height="40px">
				<td width="75px">글번호</td>
				<td width="350px">상품명</td>
				<td width="450px">후기</td>
				<td width="100px">작성자</td>
				<td width="125px">날짜</td>
			</tr>
			<c:forEach items="${rvlist}" var="reviewlist">
			<tr>
				<td>${reviewlist.bno}</td>
				<td>${reviewlist.tradename}</td>
				<td>${reviewlist.user_review}</td>
				<td>${reviewlist.writer}</td>
				<td>${reviewlist.regdate}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>