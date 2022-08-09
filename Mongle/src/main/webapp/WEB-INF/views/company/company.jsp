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
					<div id="logo"><a href="/"><img alt="logo" src="../resources/css/mainimg/logo.png" id="logoimg"></a></div>
					<ul id="topmenu">
						<li><a href="/signup/signup">회원가입</a></li>
						<li><a href="/signin/signin">로그인</a></li>
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
									<li><a href="/place/grooming">미용</a></li>
									<li><a href="/place/clinic">동물병원</a></li>
									<li><a href="/place/hotel">호텔</a></li>
									<li><a href="/place/school">학교/유치원</a></li>
									<li><a href="/place/cafe">식당/카페</a></li>
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
						<div data-slider-id="lyande"></div>
						<div id="tb">
							<table>
								<tr>
									<td><h1>이용안내</h1></td>
								</tr>
								<tr>
									<td><img alt="이용안내" src="../resources/css/company/companyimg/img1.PNG" id="img1"></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				</main>
			</div>
			<div>
				<footer>
					<div id="bottomMenu">
						<ul>
						<li><a href="/company/company">회사 소개</a></li>
						<li><a href="/company/company">개인정보처리방침</a></li>
						<li><a href="/company/company">이용안내</a></li>
						<li><a href="/company/company">고객센터</a></li>
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

	<script type="text/javascript" src="https://sliderui.com/sliders/lyande.js"></script>
</body>
</html>