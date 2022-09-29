<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\resources\css\event\eventmain.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/event/tab.js"></script>
</head>
			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
<%-- 이벤트 본문  시작점 --%>
<div id="eventbon">
	
					<div id="ls">
				<ul id="eventbn">
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn1.png" class="event"  id="ev1"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn2.png" class="event"  id="ev2"></a></li>
					<li><a href="#"><img alt="이벤트 배너 1" src="../resources/css/mainimg/event/evbn3.png" class="event"  id="ev3"></a></li>
				</ul>
			</div>
	
	<div id="event-bon-line">
	
		<div id="event-kategori-box">
		<ul>
			<li class="event-kategorie current" data-tab="tab-1">이벤트 진행중</li><!--
		 --><li class="event-kategorie" data-tab="tab-2">이벤트 종료</li><!--
		 --><li class="event-kategorie" data-tab="tab-3">이벤트 당첨</li>
		</ul>
		</div>
	<div id="tab-1" class="event-mainlist current"> <!-- 탭메뉴 내용 위치 분류 div -->	
		<div class="event-count-box">
		총
		<span class="event-count">7</span>
		건
		</div>
		
		<ul id="eventone">
			<li>
				<a href="event1" class="event_sub_page">
				<img class="event_img" alt="고양이이벤트1" src="../resources/image/image1.jpg">
				<p id="evp" class="evp1">박스1</p>
				<p id="evp" class="evp2">08.04~08.31</p>	
				</a>
			</li>
			<li>
				<a href="event2" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트2" src="../resources/image/image2.jpg">
				<p id="evp" class="evp1">박스2</p>
				<p id="evp" class="evp2">08.04~09.31</p>	
				</a>
			<li>
				<a href="event3" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트3" src="../resources/image/image3.jpg">
				<p id="evp" class="evp1">박스3</p>
				<p id="evp" class="evp2">08.01~08.31</p>	
				</a>
			</li>
			<li>
				<a href="event4" class="event_sub_page">
				<img class="event_img" alt="강아지 이벤트1" src="../resources/image/image4.jpg">
				<p id="evp" class="evp1">박스4</p>
				<p id="evp" class="evp2">08.01~08.31</p>	
				</a>
			</li>
				<li>
				<a href="event5" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트4" src="../resources/image/image5.jpg">
				<p id="evp" class="evp1">박스5</p>
				<p id="evp" class="evp2">07.15~08.22</p>	
				</a>
			</li>
			<li>
				<a href="event6" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트5" src="../resources/image/image6.jpg">
				<p id="evp" class="evp1">박스6</p>
				<p id="evp" class="evp2">06.20~08.30</p>	
				</a>
			</li>
			<li>
				<a href="event7" class="event_sub_page">
				<img class="event_img" alt="고양이 이벤트6" src="../resources/image/image7.png">
				<p id="evp" class="evp1">박스7</p>
				<p id="evp" class="evp2">06.10~08.30</p>	
				</a>
			</li>
		</ul>
	  </div>
	  <div id="tab-2" class="event-mainlist">
	  이벤트 종료
	  </div>
	  <div id="tab-3" class="event-mainlist">
	  이벤트 당첨자
	  </div>
	  
	  
	</div>
</div>
<%-- 이벤트 본문  끝부분 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>