<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\event\eventmain.css">
</head>
			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
		<%-- 본문 시작 --%>
		<div id="eventbon">
	
					<div id="ls">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn1.png" class="event"  id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn2.png" class="event"  id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn3.png" class="event"  id="ev3"></a></li>
				</ul>
			</div>
	
	<div id="event-bon-line">
	
이벤트 게시판6
	<div><label>댓글</label></div>
		<div>
			<textarea rows="5" cols="50" id="reply"></textarea>
		</div>
		<div>
			<input type="button" value="댓글쓰기" id="add">
		</div>
		<div id="chat">
			<ul id="replyUL">
			</ul>
		</div>
	</div>
</div>
		<%-- 본문 끝 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>