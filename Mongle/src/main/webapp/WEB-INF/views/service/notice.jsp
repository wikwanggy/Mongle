<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\notice.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
			<span id="service_main_title">공지사항</span>
			<div id="service_noticelist">
				<div id="service_noticelist_top">
					<div id="notice_list_td1">번호</div>
					<div id="notice_list_td2">제목</div>
					<div id="notice_list_td3">등록일자</div>
					<div id="notice_list_td4">작성자</div>
				</div>
				<dl id="service_noticelist_lower">
				<!-- for문 시작 -->
				<c:forEach items="${list}" var="notice">
				<input type="hidden" value="${notice.bno }">
				<input type="hidden" value="${notice.bgno }">
					<dt id="service_noticelist_num">
						<div id="notice_list_td1">${notice.rownum }</div>
						<div id="notice_list_td2"><a class="notice_list_link" href="javascript:onoffDisplay();">${notice.title }</a></div>
						<div id="notice_list_td3">
							<fmt:parseDate value="${notice.regdate}" var="regdate" pattern="yyyy-MM-dd HH:mm:ss" />
							<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}"/>
						</div>
						<div id="notice_list_td4">${notice.name }</div>
				
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${notice.bno }&bgno=${notice.bgno}" class="notice_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
				
					</dt>
					<dd style="display:none;">
						<div>${notice.content }</div>
					</dd>
				</c:forEach>
					<!-- for문 끝 -->
				</dl>
			 </div>
			 
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
			 
			<c:choose>
			 <c:when test="${sessionScope.login.id=='admin'}">
			 <input id="notice_button" type="submit" value="공지사항쓰러가기" style="cursor: pointer" onclick="location.href='/service/write?bgno=1'">
			</c:when>
			</c:choose>
			</div><%--본문div끝 --%>
		</div>
	</div>
		<%--본문 넣을 자리 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>