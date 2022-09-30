<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mongle-몽글</title>
<link rel="stylesheet" href="../resources/css/boardlist.css"><link rel="stylesheet" href="../resources/css/main.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../resources/js/community/comUpload.js"></script>
<script type="text/javascript" src="../resources/js/community/community.js"></script>
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="board_l">
	<div style="margin-left:40px;">
		<b class="rv_b">공지사항/펫티켓</b>
	</div>
	<c:choose>
			<c:when test="${sessionScope.login.id=='admin'}">
<form method="post" id="ntform" role="form">
	<table border="1" class="board_write">
		<tr>
			<td>
			<input type="hidden" name="id" value="${sessionScope.login.id}">
			<input type="text" placeholder="제목" class="board_write_title" name="title"></td>
		</tr>
		<tr>
			<td><textarea cols="115" rows="30" placeholder="내용" name="content"></textarea></td>
		</tr>
		<tr>
			<td><div id="ntuploaddiv"><input type="file" name="ntuploadFile" multiple></div>
				<div id="ntuploadResult">
					<ul>
						 
					</ul>
				</div>
				<div class="oImg">
				
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="올리기" id="ntuploadbtn" class="btn_board">
			</td>
		</tr>
	</table>
</form>
			</c:when>
			<c:otherwise>
				<%response.sendRedirect("http://localhost:8080/");%>
			</c:otherwise>
		</c:choose>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>