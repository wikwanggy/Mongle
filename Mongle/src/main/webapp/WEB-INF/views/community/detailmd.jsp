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
<form method="post">
	<div class="board_l"><table border="1" id="board_detail">
		<tr>
			<td colspan="2" style="height:25px;">
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
</body>
<jsp:include page="../footer.jsp"/>
</html>