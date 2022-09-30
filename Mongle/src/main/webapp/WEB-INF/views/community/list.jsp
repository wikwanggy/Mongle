<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
		<li><a href="http://localhost:8080/community/list"><b>커뮤니티</b></a></li>
		<li><a href="http://localhost:8080/community/review">사용후기</a></li>
		<li><a href="http://localhost:8080/community/notice">공지사항</a></li>
	</ul>
</div>
<div class="board_l">
	<div style="margin-left:40px;">
		<b class="rv_b">커뮤니티</b>
	</div>
	<table border="1" id="board_list">
		<tr>
			<td colspan="5" id="board_list_search"><div style="padding:10px;">
				<c:choose>
					<c:when test="${sessionScope.login!=null}">
						<div id="td"><input type="button" value="글쓰기" class="btn_board" onclick="location.href='http://localhost:8080/community/write'"></div>
					</c:when>
					<c:otherwise>
						<span>글쓰기는 로그인 이후 가능합니다.</span>
					</c:otherwise>
				</c:choose>
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
			</form></div></td>
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
				<td>
					<a href="detail?bno=${boardlist.bno}">${boardlist.title}
					<c:if test="${boardlist.count ne 0}">
						<small><b>[&nbsp;<c:out value="${boardlist.count}"/>&nbsp;]</b></small>
					</c:if></a>
				</td>
				<td>
					<fmt:parseDate var="parsedDate" value="${boardlist.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
					<fmt:formatDate var="dateString" value="${parsedDate}" pattern="yyyy-MM-dd HH:mm"/> 
					${dateString}
				</td>
				<td>${boardlist.cnt}</td>
				<td>${boardlist.id}</td>
			</tr>
		</c:forEach>
	</table>
<br>
<div id="board_paging">
<c:if test="${paging.prev}">
   <a href="/community/list?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.startPage-1}&amount=${paging.cri.amount}">이전</a>
</c:if>
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