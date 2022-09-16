<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/boardlist.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/community.js"></script>
<title>Insert title here</title>
</head>
<jsp:include page="../header.jsp"/>
<body>
<div id="detail_all">
<form method="post">
	<div class="board_l">
		<div style="margin-left:40px;">
			<h2>커뮤니티</h2>
		</div>
	<table border="1" id="board_detail">
		<tr>
			<td style="width:75px; text-align:center;">${detail.bno}</td>
			<td style="height:25px;">
				<input type="hidden" name="bno" value="${detail.bno}"><input type="hidden" name="id" value="${detail.id}">
				${detail.title}
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:right"><span>작성자　</span>　${detail.id}　<span>　|　작성일　</span>　${detail.regdate}</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${detail.content}</pre>
				<div id="uploadResult">
					<ul>
					
					</ul>
				</div>
			</td>
		</tr>
		<c:choose>
				<c:when test="${sessionScope.login.id==detail.id}">
		<tr>
			<td colspan="2" id="btn_board_detail">
			
					<input type="submit" value="삭제" class="btn_board" formaction="boarddelete">
					<input type="submit" value="수정" class="btn_board" formaction="detailmd?bno=${detail.bno}">
				
			</td>
		</tr>
		</c:when>
			</c:choose>
	</table>
	<div class="tolist"><a href="http://localhost:8080/community/list">목록</a></div>
	</div>
</form>
<div>
	<ul>
		<li></li>
	</ul>
</div>


<div style="padding:20px">
<table id="detail_reply">
	<tr>
		<td>
			<c:choose>
				<c:when test="${sessionScope.login!=null}">
					<div class="detail_input">
						<div><label>댓글</label></div>
						<div><textarea cols="115" rows="7" placeholder="댓글 입력" id="comm_reply"></textarea></div>
						<div id="reply_wrt"><input type="button" class="btn_board" id="replywrt" value="작성"></div>
					</div>
				</c:when>
				<c:otherwise>
					<span>댓글은 로그인 후 작성할 수 있습니다.</span>
				</c:otherwise>
			</c:choose>
		</td>
	<tr>
	<tr>
		<td>
			<div id="chat">
				<ul id="replyUL" class="detail_input">
				
				</ul>
			</div>
		</td>
	</tr>
</table>

</div></div>
</body>
<jsp:include page="../footer.jsp"/>
</html>