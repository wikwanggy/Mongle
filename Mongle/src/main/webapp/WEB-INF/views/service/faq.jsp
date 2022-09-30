<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\service\faq.css">
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
			<span id="service_main_title">자주묻는 질문</span>
			<input type="text" value="${faq.bno}">
					<!-- 기초틀 시작-->
						<jsp:include page="../include/servicefaqinclude.jsp"></jsp:include>
					<!-- 기초틀끝 -->
					<div id="tab-1" class="service_faqlist">
					<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.rownum }</div>
							<input type="hidden" name="faqbno" value="${faq.bno }">
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
				<!--  id 운영자 권한 삭제or수정 이동 -->
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${faq.bno }&bgno=${faq.bgno}" class="faq_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
				</dl>
				 <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="faq_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=2'";>
				 </c:when>
			 </c:choose>
			 </div>
			 
			 <div id="tab-2" class="service_faqlist" >
  
  						<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.rownum }</div>
							<input type="hidden" name="faqbno" value="${faq.bno }">
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
				<!--  id 운영자 권한 삭제or수정 이동 -->
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${faq.bno }&bgno=${faq.bgno}" class="faq_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
				</dl>
				 <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="faq_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=4'";>
				 </c:when>
			 </c:choose>
			 
			 </div>
			 
			 <div id="tab-3" class="service_faqlist" >
			
							<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.rownum }</div>
							<input type="hidden" name="faqbno" value="${faq.bno }">
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
				<!--  id 운영자 권한 삭제or수정 이동 -->
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${faq.bno }&bgno=${faq.bgno}" class="faq_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
				</dl>
				 <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="faq_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=5'";>
				 </c:when>
			 </c:choose>	
		
			 </div>
			 
			 <div id="tab-4" class="service_faqlist" >

							<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.rownum }</div>
							<input type="hidden" name="faqbno" value="${faq.bno }">
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
				<!--  id 운영자 권한 삭제or수정 이동 -->
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${faq.bno }&bgno=${faq.bgno}" class="faq_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
				</dl>
				 <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="faq_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=6'";>
				 </c:when>
			 </c:choose>

			 </div>
			 
			 <div id="tab-5" class="service_faqlist" >
			 
						<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.rownum }</div>
							<input type="hidden" name="faqbno" value="${faq.bno }">
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
				<!--  id 운영자 권한 삭제or수정 이동 -->
				<c:choose>
				     <c:when test="${sessionScope.login.id=='admin'}">
						<a href="/service/detail?bno=${faq.bno }&bgno=${faq.bgno}" class="faq_detail_button" style="cursor: pointer">수정or삭제</a>
					</c:when>
				 </c:choose>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
				</dl>
				 <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="faq_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=7'";>
				 </c:when>
			 </c:choose>
			 </div>
			 
		</div> 
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
					<td class="${paging.spa.pageNum eq num ? 'on' : '' }"><a href="/service/bkind?bgno=${paging.spa.bgno}&pageNum=${num }&amount=${paging.spa.amount}">${num}</a></td>
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
			 
			</div><%--본문div끝 --%>
		</div>
		<%--본문 넣을 자리 --%>
		<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>