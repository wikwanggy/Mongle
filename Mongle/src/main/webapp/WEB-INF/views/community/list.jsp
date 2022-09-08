<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/community.js"></script>
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="commu_top">
	<ul>
		<li><a href="http://localhost:8080/community/list"><b>커뮤니티</b></a></li>
		<li><a href="http://localhost:8080/community/review">사용후기</a></li>
		<li><a href="http://localhost:8080/community/notice">공지사항</a></li>
	</ul>
</div>


<div class="board_l">
	<div style="margin-left:40px;">
		<h2>커뮤니티</h2>
	</div>
	<table border="1" id="board_list">
		<tr>
			<td colspan="5" id="board_list_search">
			<div id="td">
			<input type="button" value="글쓰기" class="btn_board" onclick="location.href='http://localhost:8080/community/write'"></div>
			<form action="/community/list" id="searchForm" method="get">
				<select name="type">
					<option value="T">제목</option>
					<option value="C">내용</option>
					<option value="TC">제목+내용</option>
				</select>
				<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
				<input type="hidden" name="amount" value="${paging.cri.amount}">
				<input type="text" name="keyword">
				<input type="button" id="searching" value="검색">
			</form></td>
		</tr>
		<tr height="40px">
			<td width="50px">글번호</td>
			<td width="400px">제목</td>
			<td width="100px">날짜</td>
			<td width="50px">조회수</td>
			<td width="100px">작성자</td>
		</tr>
		<c:forEach items="${list}" var="boardlist">
			<tr height="40px">
				<td>${boardlist.bno}</td>
				<td><a href="detail?bno=${boardlist.bno}">${boardlist.title}</a></td>
				<td>${boardlist.regdate}</td>
				<td>${boardlist.cnt}</td>
				<td>${boardlist.writer}</td>
			</tr>
		</c:forEach>
	</table>
<br>
<div id="board_paging">
<!-- prev(이전)이 true이면 이전버튼 화설화 -->
<c:if test="${paging.prev}">
   <a href="/community/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
</c:if>
<!-- begin(1) end(10)될 동안 반복(1일 10일 될 동안 반복) -->
<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="num">
   <a href="/community/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
</c:forEach>
<c:if test="${paging.next }">
   <a href="/community/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
</c:if>
</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>