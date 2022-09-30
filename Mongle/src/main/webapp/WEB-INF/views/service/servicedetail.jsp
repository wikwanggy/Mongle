<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\..\resources\css\service\servicedetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/serviceAttach.js"></script>
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
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
					<form name="fw" method="POST">
					<table>
						<tr>
							<td>
			<c:choose>
			     <c:when test="${detail.id==sessionScope.login.id || sessionScope.login.id=='admin'}">
								<a href="/service/modify?bno=${detail.bno }&bgno=${detail.bgno}" class="bkind_detail_button" style="cursor: pointer">수정 하러 하기</a>
					</c:when>
			 </c:choose>
			<c:choose>
			     <c:when test="${detail.id==sessionScope.login.id || sessionScope.login.id=='admin'}">
			 		<input class="bkind_detail_button" type="submit" value="삭제 하기" style="cursor: pointer"  onclick="alert('삭제되었습니다.')" formaction="/service/remove">
				 </c:when>
			 </c:choose>
							</td>
						</tr>
						<tr>
							<td class="service_sub_font">제목</td>
						</tr>
					
						<tr>
							<td><input class="service_sub_font" type="text" name="title" value="${detail.title }" readonly="readonly"></td>
							<td><input type="hidden" name="bgno" value="${detail.bgno}"></td>
							<td><input type="hidden" name="bno" value="${detail.bno}"></td>
							<td><input type="hidden" name="id" value="${detail.id}"></td>
							<td><input type="hidden" name="name" value="${detail.name}"></td>
						</tr>
						
						<tr>
							<td class="service_sub_font">내용</td>
						</tr>
						
						<tr>
							<td><textarea id="service_sub_content" class="service_sub_font" name="content" cols="50" rows="10"  readonly="readonly">${detail.content }</textarea></td>
						</tr>
						<tr>
							<td>첨부파일				
								<div id="filelistimage">
									<ul>
				
									</ul>
								</div>
							</td>
						</tr>
						
					</table>
					</form>
				</div>
			</div>
		</div>	
		<%--본문 넣을 자리 --%>
		
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>