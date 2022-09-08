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
	<div style="margin-left:40px;">
		<h2>공지사항/펫티켓</h2>
	</div>
	<!-- 관리자만 공지 올리기 버튼 볼 수 있도록 -->
<div id="ntcon">
	<table id="ntable">
		<tr height="40px" style="text-align:center;">
			<td width="50px">번호</td>
			<td width="500px">제목</td>
			<td width="100px">작성자</td>
		</tr>
		<c:forEach items="${notice}" var="ntlist">
		<tr height="40px">
			<td style="text-align:center;">${ntlist.bno}</td>
			<td><a href="ntdetail?bno=${ntlist.bno}">${ntlist.title}</a></td>
			<td style="text-align:center;">${ntlist.writer}</td>
		</tr>
		</c:forEach>
	</table>
</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>