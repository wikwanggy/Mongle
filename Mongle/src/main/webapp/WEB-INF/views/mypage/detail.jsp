<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/mypage/detail.js"></script>
<link rel="stylesheet" href="../resources/css/mypage/detail.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
			<div id="main">
				<div id="ls"></div>
					<div id="cn">
						<form action="/mypage/modify" method="post">
							<h1>회원정보수정</h1>
							<table>
								<tr>
									<th>이름</th>
									<td><input type="text" value="${mdetail.name}" name="name"></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" value="${mdetail.id}" name="id" readonly></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" value="${mdetail.password}" name="password" class="btn" id="pw1">
									<input type="button" value="비밀번호확인" id="showPassword" class="btn" >
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="text" value="${mdetail.bth}" name="bth" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" value="${mdetail.gender}" name="gender" readonly></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" value="${mdetail.email}" name="email"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" value="${mdetail.addr}" name="addr"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" value="${mdetail.number}" name="number"></td>
								</tr>
							</table><br>
							<div>
							<input type="submit" value="회원정보 수정" id="modi">
							</div>
						</form>
					</div>
				<div id="rs"></div>
			</div>	
</body>
<jsp:include page="../footer.jsp"/>
</html>