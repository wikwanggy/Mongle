<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#main {
	display: flex;
}
#cn {
	text-align: center;
}

div#ls {
	float: left;
	margin: auto;
}

div#rs {
	float: right;
	margin: auto;
}

div#cnat {
	text-align: center;
}
</style>
<link rel="stylesheet" href="/resources/css/shop/header.css">
<link rel="stylesheet" href="/resources/css/shop/footer.css">
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="main">
		<div id="ls"></div>
		<div id="cn">
			<h1>상품 문의</h1>
			<form action="/shoppage/shop_item" method="post">
				<table border="1">
					<tr>
						<td>상품 번호</td>
						<td><input type="text" name="bno"></td>
						<td>문의 번호</td>
						<td><input type="text"
							name="s_Confirm" value="1"></td>
					</tr>
					<tr>
						<td>회원 아이디</td>
						<td><input type="text" name="s_id"></td>
						<td >관리자 아이디</td>
						<td><input type="text" name="a_id"></td>
					</tr>
					<tr>
						<td>질문 제목</td>
						<td><input type="text" name="s_title"></td>
					</tr>
					<tr>
						<td>상품 질문</td>
						<td><textarea cols="50" rows="30" name="s_question"></textarea></td>
							<td>답변</td>
						<td><textarea cols="50" rows="30" name="s_answer"></textarea></td>
					</tr>
				</table>
				<input type="submit" value="문의하기">
			</form>
		</div>
		<div id="rs"></div>
	</div>
	<%--본문 넣을 자리 --%>
	<%--하단 시작 --%>
	<jsp:include page="../footer.jsp"></jsp:include>
	<%--하단 끝 --%>
</body>
</html>