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
			<aside id="service_aside"><%--왼쪽 사이드바 --%>
			<h2 id="service_aside_header"><a href="servicemain">고객센터</a></h2>
			<ul>
				<li><a href="notice">공지사항</a><li>
				<li class="a_on"><a href="faq">자주묻는 질문(FAQ)</a></li>
				<li><a href="questions">1:1문의</a></li>
			</ul>
			</aside>
			<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
			<span id="service_main_title">자주묻는 질문</span>
				<div id="service_main_box">
					<ul>
						<li class="service_main_qbox"><a href="#">test용 글1</a></li>
						<li class="service_main_qbox"><a href="#">test용 글 2</a></li>
						<li class="service_main_qbox"><a href="#">test용 글3</a></li>
						<li class="service_main_qbox"><a href="#">test용 글 4</a></li>
					</ul>
				</div>
			<div>
				<div id="service_main_qlist">
					<ul>
						<li class="service_main_kategori current" data-tab="tab-1">회원정보</li><!--
					 --><li class="service_main_kategori" data-tab="tab-2">주문</li><!--
					 --><li class="service_main_kategori" data-tab="tab-3">배송</li><!--
					 --><li class="service_main_kategori" data-tab="tab-4">반품/AS</li><!--
					 --><li class="service_main_kategori" data-tab="tab-5">이벤트</li>
					</ul>
				</div>
				<div id="tab-1" class="service_faqlist current">
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
				</dl>
			 </div>
			 
			 <div id="tab-2" class="service_faqlist" >
			 <p>2번째 탭</p>
			 </div>
			 
			 <div id="tab-3" class="service_faqlist" >
			 <p>3번째 탭</p>
			 </div>
			 
			 <div id="tab-4" class="service_faqlist" >
			 <p>4번째 탭</p>
			 </div>
			 
			 <div id="tab-5" class="service_faqlist" >
			 <p>5번째 탭</p>
			 </div>
		</div> 
			</div>
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