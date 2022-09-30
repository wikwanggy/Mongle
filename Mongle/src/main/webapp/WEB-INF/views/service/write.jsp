<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\write.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/serviceUploadAjax.js"></script>
<script type="text/javascript" src="/resources/js/service/tab.js"></script>
</head>

			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
			
			<%--본문 넣을 자리 --%>
			<div id="service_main">
				<%--왼쪽 사이드바 --%>
					<jsp:include page="../include/serviceinclude.jsp"></jsp:include>
				<%-- 왼쪽 사이드바 끝 --%>
				
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">글쓰기</span>
			
			<form id="form" method="post" enctype="multipart/form-data">
			<table>
				<tr><td><input type="hidden" name="id" value="${sessionScope.login.id}"></td></tr>
				<tr><td><input type="hidden" name="name" value="${sessionScope.login.name}"></td></tr>
				<tr><td><input type="hidden" name="bgno" value="${bgno}"></td></tr>
				<tr><td class="service_sub_font">제목</td></tr>
				<tr><td><input type="text" name="title" vlaue="title" class="service_sub_font"></td></tr>
				
				<tr><td class="service_sub_font">내용</td></tr>
				<tr><td><textarea id="service_sub_content" class="service_sub_font" name="content" vlaue="content" cols="50" rows="10" class="service_sub_font" ></textarea></td></tr>
				
				<tr><td><input type="file" name="uploadFile" multiple></td></tr>
				<tr><td><input type="button" id="uploadBtn" style="cursor: pointer" value="글쓰기"></td></tr>

			</table>
			</form>
			<div id="uploadResult">
					<ul>
				
					</ul>
			</div>
		</div>
	</div>
</div>
			<%--본문 넣을 자리 --%>
		

			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
	</html>