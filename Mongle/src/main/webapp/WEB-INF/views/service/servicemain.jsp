<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\service.css">
</head>
			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
			<aside id="service_aside"><%--왼쪽 사이드바 --%>
			<h2 id="service_aside_header"><a href="servicemain">고객센터</a></h2>
			<ul>
				<li class="a_on"><a href="/service/bkind?bgno=1">공지사항</a><li>
				<li><a href="/service/bkind?bgno=2">자주묻는 질문(FAQ)</a></li>
				<li><a href="/service/bkind?bgno=3">1:1문의</a></li>
			</ul>
			</aside>
			<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">고객센터</span>
				<div id="service_main_Identity">
					<span id="service_main_subtitle"><b>고객지원 센터</b></span>
					<div class="service_main_content">
						<b>공간 채우기용 글 쓰기</b><br>
						ㅁㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄻㄴㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹㄴㅁㅇㄹ<br>
						asdfsadfsadfsadfsadfsadfsadfsdafsadfsadf
					</div>
					<a class="service_main_move" href="questions">1:1질문 하러 가기</a>
					<a class="service_main_move">미지정</a>
				</div>
			
			</div>
			</div><%--본문div끝 --%>
		</div>
		<%--본문 넣을 자리 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>