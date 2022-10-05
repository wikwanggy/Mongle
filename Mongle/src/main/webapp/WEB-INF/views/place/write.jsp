<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>place</title>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/resources/js/place/placeUploadAjax.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=93ed3fadc4dfa50afff064beaff51b58"></script>
<link rel="stylesheet" href="/resources/css/place/place.css">
<link rel="stylesheet" href="/resources/css/place/main.css">
</head>
<jsp:include page="../header.jsp" />
<body>
	<div class="main">
		<div id="ls"></div>
		<div id="cn">
			<form action="/place/write" method="post" id="form">
				<input type="hidden" name="id" value="${sessionScope.login.id}">
				<input type="hidden" name="name" value="${sessionScope.login.name}">
				<table>
					<tr style="height: 40px">
						<th>카테고리</th>
						<td><select name="ctgr" style="float: left" required>
								<option value="clinic">동물병원</option>
								<option value="grooming">미용</option>
								<option value="hotel">호텔</option>
								<option value="school">학교/유치원</option>
								<option value="cafe">식당/카페</option>
						</select></td>
						<th>지역</th>
						<td><select name="loc" style="float: left" required><option>지역</option>
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
						</select></td>
					</tr>
					<tr style="height: 40px">
						<th>제목</th>
						<td colspan="3"><input id="writetitle" type="text"
							name="title"></td>
					</tr>
					<tr style="height: 40px">
						<th>첨부</th>
						<td colspan="3"><input type="file" name="uploadFile" multiple></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3"><textarea id="writecontent" rows="20"
								name="content"></textarea></td>
					</tr>
				</table>
				<input type="button" id="uploadBtn" value="글쓰기">
			</form>

			<div id="uploadResult">
				<ul></ul>
			</div>
		</div>
		<div id="rs"></div>
	</div>

</body>
<jsp:include page="../footer.jsp" />
</html>
