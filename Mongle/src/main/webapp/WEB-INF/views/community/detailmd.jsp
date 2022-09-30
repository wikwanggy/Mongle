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
</head>
<jsp:include page="../header.jsp"/>
<body>
<c:choose>
	<c:when test="${sessionScope.login.id==detailmd.id||sessionScope.login.id=='admin'}">
		<form method="post">
			<div class="board_l"><table border="1" id="board_detail">
				<tr>
					<td colspan="2" style="height:25px;">
						<input type="hidden" name="id" value="${detailmd.id}">
						<input type="hidden" name="bno" value="${detailmd.bno}">
						<input type="text" name="title" class="board_write_title" value="${detailmd.title}">
					</td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="115" rows="30" name="content">${detailmd.content}</textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="uploadFile" multiple>
						<div id="uploadResult">
							<ul>
								
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td id="btn_board_detail">
					<input type="submit" value="수정 완료" class="btn_board" formaction="update">
					</td>
				</tr>
			</table></div>
		</form>
	</c:when>
	<c:otherwise>
		<div style="width:300px; height:100px; margin:auto; outline:solid 3px #FFEB62; text-align:center; border-radius:10px; padding:25px;">
			<span>수정은 로그인 이후에 가능합니다.</span><br>
			<span><a href="http://localhost:8080/Login/login" style="text-decoration: underline; color:blue;">로그인</a> 또는
			<a href="http://localhost:8080/Signup/Signup" style="text-decoration: underline; color:blue;">회원가입</a> 하러가기</span>
		</div>
	</c:otherwise>
</c:choose>
</body>
<jsp:include page="../footer.jsp"/>
</html>