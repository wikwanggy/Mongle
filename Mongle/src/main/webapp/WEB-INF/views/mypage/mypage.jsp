<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mypage/mypage.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
			<div id="main">
				
				<div id="ls"></div>
					<div id="cn">
						<form>
							<h2>My Page</h2>
								<table>
								<tr>
									<th>이름</th>
									<td><input type="text" value="${mypage.name}" name="name" readonly ></td>
								</tr>
								<tr>
									<th>아이디</th>
									<td><input type="text" value="${mypage.id}" name="id" readonly></td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td><input type="text" value="${mypage.bth}" name="bth" readonly></td>
								</tr>
								<tr>
									<th>성별</th>
									<td><input type="text" value="${mypage.gender}" name="gender" readonly></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td><input type="text" value="${mypage.email}" name="email" readonly></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" value="${mypage.addr}" name="addr" readonly></td>
								</tr>
								<tr>
									<th>우편번호</th>
									<td><input type="text" value="${mypage.addr_post}" name="addr_post" readonly></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td><input type="text" value="${mypage.number}" name="number" readonly></td>
								</tr>
							</table><br><br>
							<div>
							    <a href="/shoppage/cart?id=${sessionScope.iogin.id}"><input type="button" value="장바구니 리스트" class="bth"></a>
								<a href="/mypage/leave?id=${sessionScope.login.id}"><input type="button" value="회원탈퇴" class="btn"></a>
								<a href="/mypage/detail?id=${sessionScope.login.id}"><input type="button" value="회원정보수정" class="btn"></a>
							</div>
						</form>
					</div>
				<div id="rs"></div>
			
			</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>