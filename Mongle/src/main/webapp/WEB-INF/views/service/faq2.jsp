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
<body>
	<div id="container">
		<!-- 바디 전체를 container로 지정 -->
		<div id="hd">
			<!-- header 전체를 hd로 지정 -->
			<header>
				<div id="tm">
					<a href="/"><img alt="logo"src="../resources/css/mainimg/logo.png" id="logoimg"></a>
					<ul id="topmenu">
						<li>
							<div id="toplist">
								<c:choose>
									<c:when test="${sessionScope.login==null}">
										<a href="/signup/signup" >회원가입</a>
										<a href="/Login/login">로그인</a>
									</c:when>
									<c:otherwise>
										<a href="/Login/logout">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div></li>
						<li><a href="/mypage/mypage">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="/">HOME</a></li>
							<li><a href="#">SHOP</a>
								<ul>
									<li><a href="#">간식</a></li>
									<li><a href="#">미용용품</a></li>
									<li><a href="#">장난감</a></li>
									<li><a href="#">하우스</a></li>
									<li><a href="#">패션</a></li>
									<li><a href="#">기타</a></li>
								</ul></li>
							<li><a href="/place/">PLACE</a>
								<ul>
									<li><a href="/place/grooming">미용</a></li>
									<li><a href="/place/clinic">동물병원</a></li>
									<li><a href="/place/hotel">호텔</a></li>
									<li><a href="/place/school">학교/유치원</a></li>
									<li><a href="/place/cafe">식당/카페</a></li>
								</ul></li>
							<li><a href="#">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
									<li><a href="#">이벤트 당첨</a></li>
								</ul></li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="#">게시판</a></li>
									<li><a href="#">리뷰</a></li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
				<%--왼쪽 사이드바 --%>
					<jsp:include page="../include/serviceinclude.jsp"></jsp:include>
				<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">자주묻는 질문</span>
					<!-- 기초틀 시작-->
						<jsp:include page="../include/servicefaqinclude.jsp"></jsp:include>
					<!-- 기초틀끝 -->
				<div id="tab-1" class="service_faqlist">
				</div>
				 
				<div id="tab-2" class="service_faqlist current" >
			 		<div id="service_faqlist_top">
						<div id="faq_list_td1">번호</div>
						<div id="faq_list_td2">제목</div>
						<div id="faq_list_td3">작성자</div>
					</div>
					<dl id="service_faqlist_lower">
					<!-- for문 시작 -->
					<c:forEach items="${list}" var="faq">
						<dt id="service_faqlist_num">
							<div id="faq_list_td1">${faq.bno }</div>
							<div id="faq_list_td2"><a class="faq_list_link" href="javascript:onoffDisplay();">${faq.title }</a></div>
							<div id="faq_list_td3">${faq.name }</div>
						</dt>
						<dd style="display:none;">
						<div>${faq.content }</div>
						</dd>
					</c:forEach>
					<!-- for문 끝 -->
			 </div>
			  <c:choose>
				<c:when test="${sessionScope.login.id=='admin'}">
				 	<input id="questions_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="location.href='/service/write?bgno=4'";>
				 </c:when>
				 <c:otherwise>
				 	<input id="questions_button" type="submit" value="글쓰기" style="cursor: pointer" onclick="alert('로그인 해주세요')";>
				 </c:otherwise>
			 </c:choose>
				</dl>
			 
			 <div id="tab-3" class="service_faqlist" >
			 </div>
			 
			 <div id="tab-4" class="service_faqlist" >
			 </div>
			 
			 <div id="tab-5" class="service_faqlist" >
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
			 
			</div><%--본문div끝 --%>
		</div>
		<%--본문 넣을 자리 --%>
		<div>
		
			<footer>
				<div id="bottomMenu">
					<ul>
						<li><a href="#">회사 소개</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">이용안내</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<div id="sns">
						<ul>
							<li><a href="#"><img
									src="../resources/css/mainimg/FACENBOOK.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/INSTA.PNG" class="img2"></a></li>
							<li><a href="#"><img
									src="../resources/css/mainimg/TWITTER.PNG" class="img2"></a></li>
						</ul>
					</div>
				</div>
				<div id="company">
					<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
				</div>
			</footer>
		</div>
	</div>
</body>
</html>