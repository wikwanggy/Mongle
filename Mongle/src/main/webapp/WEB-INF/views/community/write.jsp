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
<div class="board_l">
	<div style="margin-left:40px;">
		<h2>커뮤니티</h2>
	</div>
<form method="post">
	<table border="1" class="board_write">
		<tr>
			<td><input type="text" placeholder="제목" class="board_write_title" name="title"></td>
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
		<tr>
			<td><input type="submit" value="올리기" id="uploadbtn" class="btn_board"></td>
		</tr>
	</table>
</form>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>