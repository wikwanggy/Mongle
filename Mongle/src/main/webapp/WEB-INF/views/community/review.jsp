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
<!-- <div id="review_all">
<div id="review_gallary"> -->
<div id="review">
	<div class="rv_top">
		<h2>펫 용품/식품 후기</h2>
		<h5><a href="#">＋ 전체 후기 보기</a></h5>
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
		<h2>펫 호텔 이용 후기</h2>
		<h5><a href="#">＋ 전체 후기 보기</a></h5>
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
	<h1>사용후기</h1>
	<div id=review_search>
		<select id="rv_sel">
			<option>전체</option>
			<option>상품</option>
			<option>호텔</option>
		</select>
		<input type="search" placeholder="상품명 검색" id="rv_search2"><a href="#">검색</a>
	</div>
	<div id="shop_review">
		<table border="1" id="review_board">
			<tr height="40px">
				<td width="75px">글번호</td>
				<td width="350px">상품명</td>
				<td width="450px">상품후기</td>
				<td width="100px">작성자</td>
				<td width="125px">날짜</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
</div>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>