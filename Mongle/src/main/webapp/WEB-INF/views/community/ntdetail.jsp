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
<div id="detail_all">
<div class="board_l">
	<div style="margin-left:40px;">
		<h2>공지사항/펫티켓</h2>
	</div>
<form>
	<table id="notice_detail">
		<tr>
			<td style="width:75px; text-align:center;">${ntdetail.bno}</td>
			<td style="height:25px;">
				<input type="hidden" name="bno" value="${ntdetail.bno}">
				${ntdetail.title}<%-- <input type="text" name="title" class="board_write_title" value="${detail.title}"> --%>
			</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${ntdetail.content}</pre><%-- <textarea cols="115" rows="30" name="content">${detail.content}</textarea> --%>
			<div id="uploadResult">
				<ul>
					
				</ul>
			</div></td>
		</tr>
		<tr>
			<td colspan="2" id="btn_board_detail">
			<input type="submit" value="삭제" class="btn_board" formaction="delete">
			<input type="submit" value="수정" class="btn_board" formaction="detailmd?bno=${detail.bno }">
			</td>
		</tr>
	</table>
</form>
<div class="tolist"><a href="http://localhost:8080/community/notice">목록</a></div>
</div>
</div>

</body>
<jsp:include page="../footer.jsp"/>
</html>