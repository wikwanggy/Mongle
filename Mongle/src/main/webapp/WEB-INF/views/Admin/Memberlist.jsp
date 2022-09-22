<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/admin/admin.js"></script>
<link rel="stylesheet" href="../resources/css/admin/member.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
	<
		<div id="main">

			<div id="ls">
			</div>
			<div id="cn">
				
					<h2>MemberList</h2>
					<form action="/Admin/Memberlist" method="get" id="searchForm">
						<select name="type">
							<option value="I">아이디</option>
							<option value="N">이름</option>
							<option value="IN">아이디+이름</option>
						</select>
						<!--  -->
						<input type="text" name="keyword">
						<input type="hidden" name="pageNum" id="pageNum" value="${paging.cri.pageNum}"> 
						<input type="hidden" name="amount" value="${paging.cri.amount}">
						<input type="button" value="검색" name="sh">
					</form>
					<table>
						<tr>
							<th>이름</th>
							<th>아이디</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>이메일</th>
							<th>체크</th>
						</tr>
						<c:forEach items="${list}" var="list">
							<tr>
								<td>${list.name}</td>
								<td>${list.id}</td>
								<td>${list.bth}</td>
								<td>${list.gender}</td>
								<td>${list.email}</td>
								<td><input type="checkbox"></td>
							</tr>
						</c:forEach>
					</table>
					<br> <br>
					<!-- prev=true면 이전버튼 활성화 -->
					<c:if test="${paging.prev}">
						<a href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage-1}&amount=${paging.cri.amount}">이전</a>
					</c:if>

					<!-- begin이 end될동안 반복 10 -->
					<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
						var="num">
						<a
							href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${num}&amount=${paging.cri.amount}">${num}</a>
					</c:forEach>

					<!-- next=true면 다음버튼 활성화 -->
					<c:if test="${paging.next}">
						<a href="/Admin/Memberlist?type=${paging.cri.type}&keyword=${paging.cri.keyword}&pageNum=${paging.endPage+1}&amount=${paging.cri.amount}">다음</a>
					</c:if>
			</div>
			<div id="rs"></div>
		</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>