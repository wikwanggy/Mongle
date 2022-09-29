<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- service detail 과 html 동일 함으로 css 그대로 연결 -->
<link rel="stylesheet" href="..\..\resources\css\service\servicedetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/serviceAttach.js"></script>
<script type="text/javascript" src="/resources/js/service/serviceUploadAjax.js"></script>
<script type="text/javascript" src="/resources/js/service/tab.js"></script>
</head>
			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
				<%-- 왼쪽 사이드바 시작--%>
					<jsp:include page="../include/serviceinclude.jsp"></jsp:include>
				<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
					<form method="POST" action="/service/modify" enctype="multipart/form-data">
					<table>
						<tr>
							<td>
								<input class="bkind_detail_button" id="uploadBtn" type="submit" value="수정 완료" style="cursor: pointer" onclick="alert('글수정완료')" formaction="/service/modify">
							</td>
						</tr>
						<tr>
							<td class="service_sub_font">제목</td>
						</tr>
							
						<tr>
							<td><input class="service_sub_font" type="text" name="title" value="${detail.title }" ></td>
							<td><input type="hidden" name="bgno" value="${detail.bgno}"></td>
							<td><input type="hidden" name="bno" value="${detail.bno}"></td>
							<td><input type="hidden" name="id" value="${detail.id}"></td>
						</tr>
						
						<tr>
							<td class="service_sub_font">내용</td>
						</tr>
						
						<tr>
							<td><textarea id="service_sub_content" class="service_sub_font" name="content" cols="50" rows="10"  >${detail.content }</textarea></td>
						</tr>
						<tr><td><input type="file" name="uploadFile" multiple></td></tr>
						<tr>
							<td>				
								<div id="uploadResult">
									<ul>
				
									</ul>
								</div>
							</td>
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