<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/company/company.css">
</head>
<body>
	<div id="container">
		<div id="hd">
			<div id="hd"><!-- header 전체를 hd로 지정 -->
			<header>
				<div id="tm">
					<div id="logo"><a href="http://localhost:8080/Mongle/"><img alt="logo" src="../resources/css/mainimg/logo.png" id="logoimg"></a></div>
					<ul id="topmenu">
						<li><a href="http://localhost:8080/Mongle/signup/signup">회원가입</a></li>
						<li><a href="http://localhost:8080/Mongle/signin/signin">로그인</a></li>
						<li><a href="#">MyPage</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
				</div>
				<div>
					<nav>
						<ul id="menu">
							<li><a href="http://localhost:8080/Mongle/">HOME</a></li>
							<li><a href="#">SHOP</a>
								<ul>
									<li><a href="#">간식</a></li>
									<li><a href="#">미용용품</a></li>
									<li><a href="#">장난감</a></li>
									<li><a href="#">하우스</a></li>
									<li><a href="#">패션</a></li>
									<li><a href="#">기타</a></li>
								</ul>
							</li>
							<li><a href="#">PLACE</a>
								<ul>
									<li><a href="#">미용</a></li>
									<li><a href="#">동물병원</a></li>
									<li><a href="#">호텔</a></li>
									<li><a href="#">학교/유치원</a></li>
									<li><a href="#">식당/카페</a></li>
								</ul>
							</li>
							<li><a href="#">EVENT</a>
								<ul>
									<li><a href="#">진행 이벤트</a></li>
									<li><a href="#">종료 이벤트</a></li>
								</ul>
							</li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="#">게시판</a></li>
									<li><a href="#">리뷰</a></li>
								</ul>
							</li>
						</ul>
					</nav>
				</div>
			</header>
		</div>
			<div>
				<main>
				<div id="cn">
					<div id="slideShow">
						<div id="slides">
							<img src="../resources/css/company/companyimg/img3.jpg"
								alt="슬라이더 1"> <img
								src="../resources/css/company/companyimg/img1.jpg" alt="슬라이더 2">
							<img src="../resources/css/company/companyimg/img2.jpg"
								alt="슬라이더 3"> <img
								src="../resources/css/company/companyimg/img.PNG" alt="슬라이더 4">
							<button id="prev">&lang;</button>
							<button id="next">&rang;</button>
						</div>
					</div>
					<table>
						<tr>
							<td><h1>회사 소개</h1></td>
						</tr>
						<tr>
							<td><p>삶은 말하지 못하는 생명체들에게도 소중하다.</p>
							 <p>사람이 행복을 원하고 고통을 두려워 하며</p>
							<p>생명을 원하는 것 처럼, 그들 역시 그러하다 </p> 
							<p><strong> -달라이 라마- </strong></p></td>
						</tr>
						<tr>
							<td><p>인간과 반려동물이 함께 공존하고 존중하며 서로를 배려하고</p>
							<p> 인간과 같이 즐기고 놀 수있도록 최선을 다하는 회사가 되겠습니다 .</p>
							<p id="brand"><strong>Mongle</strong></p></td>
						</tr>
						<tr>
							<td><h1>이용 안내</h1></td>
						</tr>
						<tr>
							<td><p>교환 환불 시  7일에서 15일 이내의 시간이 걸릴 수 있습니다.</p>
							<p>사용자들의 실경험리뷰는 사용자간에 느끼는 차이가 있음을 말합니다.</p>
							<p>불편한 사항이 있을 경우 고객센터로 문의 주시면 감사하겠습니다.</p>
							</td>
						</tr>
						<tr>
							<td><h1>고객센터</h1></td>
						</tr>
						<tr>
							<td><p>고객센터 번호 : 155-155</p>
							<p>고객센터 Email : asd123@gmail.com</p>
							<p>전화와 메일이 불편하신 경우 문의 남겨주시면 빠른 시일내에 답변 드리겠습니다.</p></td>
						</tr>
					</table>


				</div>
				</main>
			</div>
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
										src="../resources/css/mainimg/facebook.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="../resources/css/mainimg/insta.PNG" class="img2"></a></li>
								<li><a href="#"><img
										src="../resources/css/mainimg/twitter.PNG" class="img2"></a></li>
							</ul>
						</div>
					</div>
					<div id="company">
						<p>제 3조 팀 프로젝드 참여자 : 현우 연희 민서 석현 광규</p>
					</div>
				</footer>
			</div>
		</div>
		<script src="../resources/js/company.js"></script>
</body>
</html>