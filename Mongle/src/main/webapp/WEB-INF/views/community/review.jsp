<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mongle-몽글</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/community/community.js"></script>
<link rel="stylesheet" href="../resources/css/boardlist.css"><link rel="stylesheet" href="../resources/css/main.css">
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
		<form action="/community/review" id="rv_search" method="get">
			<select id="type1">
				<option value="0" selected="selected">전체</option>
				<option value="1">장소별</option>
				<option value="2">상품별</option>
				<option value="3">기타</option>
			</select>
			<select id="type2">
				<option value="0">--</option>
				<option value="hos" class="select1">병원</option>
				<option value="bar" class="select1">미용실</option>
				<option value="hot" class="select1">호텔</option>
				<option value="sch" class="select1">유치원</option>
				<option value="foo" class="select1">음식점</option>
				<option value="ano_p" class="select1">기타</option>
				<option value="sna" class="select2">간식</option>
				<option value="pla" class="select2">미용용품</option>
				<option value="toy" class="select2">장난감</option>
				<option value="hou" class="select2">집</option>
				<option value="clo" class="select2">의류</option>
				<option value="ano_s" class="select2">기타</option>
			</select>
			<input type="hidden" name="pageNum" value="${reviewpaging.cri.pageNum}">
			<input type="hidden" name="amount" value="${reviewpaging.cri.amount}">
			<input type="text" name="keyword">
			<input type="button" id="searching" value="검색">
		</form>
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
				<td>${reviewlist.id}</td>
				<td>${reviewlist.regdate}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div id="board_paging">
		<c:if test="${reviewpaging.prev}">
		   <a href="/community/review?type=${reviewpaging.cri.type}&keyword=${reviewpaging.cri.keyword}&pageNum=${reviewpaging.startPage-1}&amount=${reviewpaging.cri.amount}">이전</a>
		</c:if>
		<c:forEach begin="${reviewpaging.startPage}" end="${reviewpaging.endPage}" var="rn">
		   <a href="/community/review?type=${reviewpaging.cri.type}&keyword=${reviewpaging.cri.keyword}&pageNum=${rn}&amount=${reviewpaging.cri.amount}">${rn}</a>
		</c:forEach>
		<c:if test="${reviewpaging.next}">
		   <a href="/community/review?type=${reviewpaging.cri.type}&keyword=${reviewpaging.cri.keyword}&pageNum=${reviewpaging.endPage+1}&amount=${reviewpaging.cri.amount}">다음</a>
		</c:if>
	</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>