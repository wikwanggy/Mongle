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
<script type="text/javascript" src="/resources/js/comUpload.js"></script>
<script type="text/javascript" src="/resources/js/community.js"></script>
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="board_l">
	<div style="margin-left:40px;">
		<b><a href="http://localhost:8080/community/list" class="rv_b">커뮤니티</a></b>
	</div>
<c:choose>
	<c:when test="${sessionScope.login!=null}">
<form id="form" method="post">
	<table border="1" class="board_write">
		<tr>
			<td><input type="hidden" name="id" value="${sessionScope.login.id}">
			<input type="text" placeholder="제목" class="board_write_title" name="title" id="title"></td>
		</tr>
		<tr>
			<td><textarea cols="115" rows="30" placeholder="내용" name="content"></textarea></td>
		</tr>
		<tr>
			<td><input type="file" name="uploadFile" multiple>
			</td>
		</tr>
		
				<tr>
					<td>
						<input type="button" value="올리기" id="uploadbtn" class="btn_board">
					</td>
				</tr>
	</table>
</form>
	</c:when>
	<c:otherwise>
		<div style="width:300px; height:100px; margin:auto; outline:solid 3px #FFEB62; text-align:center; border-radius:10px; padding:25px;">
			<span>글쓰기는 로그인 이후에 가능합니다.</span><br>
			<span><a href="http://localhost:8080/Login/login" style="text-decoration: underline; color:blue;">로그인</a> 또는
			<a href="http://localhost:8080/Signup/Signup" style="text-decoration: underline; color:blue;">회원가입</a> 하러가기</span>
		</div>
	</c:otherwise>
</c:choose>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>