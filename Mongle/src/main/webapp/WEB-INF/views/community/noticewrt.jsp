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
<div class="board_l">
	<div style="margin-left:40px;">
		<b class="rv_b">공지사항/펫티켓</b>
	</div>
<form method="post">
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
			<td><input type="file" name="uploadFile" multiple>
				<div id="uploadResult">
					<ul>
						
					</ul>
				</div>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.login.id=='admin'}">
				<tr>
					<td><input type="submit" value="올리기" id="uploadbtn" class="btn_board"></td>
				</tr>
			</c:when>
		</c:choose>
	</table>
</form>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>