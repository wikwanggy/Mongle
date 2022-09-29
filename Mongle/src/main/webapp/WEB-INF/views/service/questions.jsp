<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\questions.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/questionslist.js"></script>
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
			<span id="service_main_title">1:1문의</span>
			<p id="service_main_subtitle">1:1질문게시판</p>
			<div id="service_main_content">
		
			<form id="searchForm" action="/service/bkind" method="get">
				<select name="type">
					<option value="T">제목</option>
					<option value="C">내용</option>
					<option value="TC">제목+내용</option>
				</select>
					<input type="text" name="keyword">
					<input type="hidden" name="bgno" value="${paging.spa.bgno}">
					<input type="hidden" name="pageNum" value="${paging.spa.pageNum }" >
					<input type="hidden" name="amount" value="${paging.spa.amount}">
					<input type="button" value="검색">
			</form>
			
			<br><table id="questions_list">
				<tr>
					<td>게시판번호</td>
					<td>제목</td>
					<td>작성일자</td>
					<td>조회수</td>
					<td>작성자</td>
				</tr>
				<!-- for문 시작 -->
				<c:forEach items="${list }" var="questions">
					<tr>
						<input type="hidden" name="bno" value="${questions.bno}">
						<td id="questions_list_td1">${questions.rownum }</td>																		
						<td id="questions_list_td2"><a class="questions_list_link" href="detail?bno=${questions.bno }&bgno=3">${questions.title }</a></td>
						<td id="questions_list_td3">${questions.regdate }</td>
						<td id="questions_list_td4">${questions.cnt }</td>
						<td id="questions_list_td5">${questions.name }</td>
					</tr>
				</c:forEach>
					<!-- for문 끝 -->
			 </table>
			 
			 <!-- 페이지 번호 시작 -->
			 <table class="page_table">
				 <tr class="page_table">
			 <!-- prev(이전)이 true이면 이전버튼 화설화 -->
				<td class="page_table">
				<c:if test="${paging.prev}">
					<a href="/service/bkind?bgno=${paging.spa.bgno}&pageNum=${paging.startPage-1}&amount=${paging.spa.amount}">이전</a>
				</c:if>
				</td>
				
				<!-- begin(1) end(10)될 동안 반복(1일 10일 될 동안 반복) -->
				<td class="page_table">
				<c:forEach begin="${paging.startPage}" end="${paging.endPage }" var="num">
					<td class="${paging.spa.pageNum eq num ? 'on' : '' }"><a href="/service/bkind?bgno=${paging.spa.bgno}&type=${paging.spa.type }&keyword=${paging.spa.keyword }&pageNum=${num }&amount=${paging.spa.amount}">${num}</a></td>
				</c:forEach>
				</td>
				
				<td class="page_table">
				<c:if test="${paging.next }">
					<a href="/service/bkind?bgno=${paging.spa.bgno}&pageNum=${paging.endPage+1}&amount=${paging.spa.amount}">다음</a>
				</c:if>
				</td>
			<!-- next(다음)이 true이면 다음버튼 활성화 -->
			 	</tr>
			 </table>
			 <!-- 페이지 번호 끝 -->
			 
			 <br>
			 <c:choose>
			<c:when test="${sessionScope.login!=null}">
			 	<input id="questions_button" type="submit" value="1:1질문하러가기" style="cursor: pointer" onclick="location.href='/service/write?bgno=3'";>
			 </c:when>
			 <c:otherwise>
			 <input id="questions_button" type="submit" value="1:1질문하러가기" style="cursor: pointer" onclick="alert('로그인 해주세요')";>
			 </c:otherwise>
			 </c:choose>
			 </div>
		</div>
	</div>
	<%--본문div끝 --%>
	</div>
		<%--본문 넣을 자리 --%>
		
	<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
	</html>