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
<div id="container">
	<div class="commu_top">
		<ul>
			<li><a href="http://localhost:8080/community/list">커뮤니티</a></li>
			<li><a href="http://localhost:8080/community/review">사용후기</a></li>
			<li><a href="http://localhost:8080/community/notice"><b>공지사항</b></a></li>
		</ul>
	</div>
	<div id="ntcon">
		<div style="margin-left:40px;">
			<b class="rv_b">공지사항/펫티켓</b>
		</div>
		<table id="ntable">
			<tr height="40px" style="text-align:center;">
				<td width="50px">번호</td>
				<td width="500px">제목</td>
				<td width="100px">작성자</td>
			</tr>
			<c:forEach items="${notice}" var="noticee">
			<tr height="40px">
				<td style="text-align:center;">
					<c:choose>
						<c:when test="${noticee.pin eq 1}">
							<span>공지</span>
						</c:when>
						<c:otherwise>
							${noticee.bno}
						</c:otherwise>
					</c:choose>
				</td>
				<td><a href="ntdetail?bno=${noticee.bno}">${noticee.title}</a></td>
				<td style="text-align:center;">${noticee.id}</td>
			</tr>
			</c:forEach>
		</table>
			<form action="/community/notice" id="noticesearchform" method="get">
				<input type="hidden" name="pageNum" value="${noticepaging.cri.pageNum}">
				<input type="hidden" name="amount" value="${noticepaging.cri.amount}">
			</form>
		<div id="board_paging">
		<c:if test="${noticepaging.prev}">
		   <a href="/community/notice?pageNum=${noticepaging.startPage-1}&amount=${noticepaging.cri.amount}">이전</a>
		</c:if>
		<c:forEach begin="${noticepaging.startPage}" end="${noticepaging.endPage}" var="rn">
		   <a href="/community/notice?pageNum=${rn}&amount=${noticepaging.cri.amount}">${rn}</a>
		</c:forEach>
		<c:if test="${noticepaging.next}">
		   <a href="/community/notice?pageNum=${noticepaging.endPage+1}&amount=${noticepaging.cri.amount}">다음</a>
		</c:if>
		</div>
		<c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
					<tr>
						<td><input type="button" value="글쓰기" class="btn_board" onclick="location.href='http://localhost:8080/community/noticewrt'"></td>
					</tr>
				</c:when>
			</c:choose>
	</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>