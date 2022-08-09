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
<form>
	<table border="1" id="board_list">
		<tr>
			<td colspan="4" id="board_list_search">
			<div id="td"><input type="text"><a href="#" id="btn_list_search">검색</a>			
			<input type="submit" value="글쓰기" class="btn_board"></div></td>
		</tr>
		<tr height="40px">
			<td width="50px">글번호</td>
			<td width="400px">제목</td>
			<td width="125px">날짜</td>
			<td width="75px">작성자</td>
		</tr>
		<tr height="40px">
			<td>bno</td>
			<td>title</td>
			<td>regdate</td>
			<td>writer</td>
		</tr>
	</table>
</form>
</div>
<script src="../resources/js/community.js"></script>
</body>
<jsp:include page="../footer.jsp"/>
</html>