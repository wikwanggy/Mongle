<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품 문의</h1>
	<form action="/shoppage/shop_item" method="post">
		<table border="1">
			<tr>
				<td>상품 번호</td>
				<td><input type="text" name="bno"></td>
			</tr>
			<tr>
				<td>회원 아이디</td>
				<td><input type="text" name="s_id"></td>
			</tr>
			<tr>
				<td>질문 제목</td>
				<td><input type="text" name="s_title"></td>
			</tr>		
			<tr>
				<td>상품 질문</td>
				<td><textarea cols="50" rows="30" name="s_question"></textarea></td>
			</tr>		
		</table>
		<table border="1">
			<tr>
				<td>관리자 아이디</td>
				<td><input type="text" name="a_id"><input type="text" name="s_Confirm" value="1"></td>
			</tr>			
			<tr>
				<td>답변</td>
				<td><textarea cols="50" rows="30" name="s_answer"></textarea></td>
			</tr>			
		</table>
		<input type="submit" value="문의하기">
	</form>
</body>
</html>