<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>
<link rel="stylesheet" href="${path}/resources/css/place/place.css">
<script type="text/javascript" src="${path}/resources/js/place/place.js"></script>
</head>
<body>
	<div id="container">
		<div id="hd">
			<header>
				<div id="logo">로고 자리입니다.</div>
				<div id="tm">
					<ul id="topmenu">
						<li><a href="#">회원가입</a></li>
						<li><a href="#">로그인</a></li>
						<li><a href="#">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="#">HOME</a></li>
							<li><a href="#">SHOP</a></li>
							<li><a href="http://localhost:8080/controller/place/place">PLACE</a></li>
							<li><a href="#">EVENT</a></li>
							<li><a href="#">커뮤니티</a></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<div>
			<main>
			<div id="ls">
				<button class="button" onclick="#">미용</button>
				<br>
				<button class="button" onclick="#">동물병원</button>
				<br>
				<button class="button" onclick="#">미용</button>
				<br>
				<button class="button" onclick="#">호텔</button>
				<br>
				<button class="button" onclick="#">학교/유치원</button>
				<br>
				<button class="button" onclick="#">식당/카페</button>
				<br>
			</div>
			<div id="cn">
				<div id=place1>미용</div>
				<form action="placeServer.jsp">
					<table border="1">
						<tr>
							<th width="50px"><select name="loc">
									<option>지역</option>
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기">경기</option>
									<option value="부산">부산</option>
									<option value="대구">대구</option>
									<option value="울산">울산</option>
									<option value="광주">광주</option>
									<option value="대전">대전</option>
									<option value="강원">강원</option>
									<option value="충북">충북</option>
									<option value="충남">충남</option>
									<option value="전북">전북</option>
									<option value="전남">전남</option>
									<option value="경북">경북</option>
									<option value="경남">경남</option>
									<option value="제주">제주</option>
							</select></th>
							<th width="550px">제목</th>
							<th width="100px">작성자</th>
							<th width="100px">날짜</th>
							<th width="40px">조회</th>
							<th width="40px">추천</th>
						</tr>
						<%
							Connection conn = null;
							PreparedStatement pstmt = null;
							ResultSet rs = null;

							try {
								Context init = new InitialContext();
								DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/mysql");
								conn = ds.getConnection();

								pstmt = conn.prepareStatement("select * from board");

								rs = pstmt.executeQuery();

								while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("loc")%></td>
							<td><%=rs.getString("title")%></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("date")%></td>
							<td><%=rs.getString("cnt")%></td>
							<td><%=rs.getString("rec")%></td>
						</tr>
						<%
							}
							} catch (Exception e) {
								e.printStackTrace();
							} finally {
								conn.close();
								rs.close();
								pstmt.close();
							}
						%>
					</table>
					<input type="submit" value="글쓰기" class="button">
				</form>

			</div>
			<div id="rs">123</div>
			</main>
		</div>
		<div>
			<footer> </footer>
		</div>
	</div>

</body>
</html>
