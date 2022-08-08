<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/boardlist.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="board_l"><!-- / -->
<form method="post">
	<table border="1" class="board_write">
		<tr>
			<td><input type="text" placeholder="제목" class="board_write_title" name="title"></td>
		</tr>
		<tr>
			<td><textarea cols="115" rows="30" placeholder="내용" name="content"></textarea></td>
		</tr>
		<!-- 로그인 하지 않은 상태에서 올리기를 클릭하면 권한이 없습니다 알림 나오게 -->
		<tr>
			<td><input type="submit" value="올리기" class="btn_board"></td>
		</tr>
	</table>
</form>
</div>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>