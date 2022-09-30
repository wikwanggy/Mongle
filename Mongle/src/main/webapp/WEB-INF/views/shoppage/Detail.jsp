<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>shop</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/Detail.js"></script>
<link rel="stylesheet" href="/resources/css/shop/Detail.css">
<link rel="stylesheet" href="/resources/css/shop/header.css">
<link rel="stylesheet" href="/resources/css/shop/footer.css">
</head>
<body>
	<form method="get">
		<div id="container">
			<!-- header 시작 -->
			<div id="hd">
				<header>
					<div id="tm">
						<a href="/"><img alt="logo"
							src="../resources/css/mainimg/logo.png" id="logoimg"></a>
						<ul id="topmenu">
							<li>
								<div id="toplist">
									<c:choose>
										<c:when test="${sessionScope.login==null}">
											<a href="/Signup/Signup">회원가입</a>
											<a href="/Login/login">로그인</a>
										</c:when>
										<c:when test="${sessionScope.login.id=='admin'}">
											<a href="/Admin/Memberlist">관리자메뉴</a>
											<a href="/Login/logout">로그아웃</a>
										</c:when>
										<c:otherwise>
											<a href="/mypage/mypage?id=${sessionScope.login.id}">${sessionScope.login.id}님</a>
											<a href="/Login/logout">로그아웃</a>
										</c:otherwise>
									</c:choose>
								</div>
							</li>
							<li><a href="/service/servicemain">고객센터</a></li>
						</ul>
					</div>
					<div>
						<nav>
							<ul id="menu">
								<li><a href="/">HOME</a></li>
								<li><a href="/shoppage/shop">SHOP</a>
									<ul>
										<li><a href="/shoppage/Snack">간식</a></li>
										<li><a href="/shoppage/beauty">미용용품</a></li>
										<li><a href="/shoppage/toy">장난감</a></li>
										<li><a href="/shoppage/House">하우스</a></li>
										<li><a href="/shoppage/fashion">패션</a></li>
										<li><a href="/shoppage/etc">기타</a></li>
									</ul></li>
								<li><a href="/place/">PLACE</a>
									<ul>
										<li><a href="/place/grooming">미용</a></li>
										<li><a href="/place/clinic">동물병원</a></li>
										<li><a href="/place/hotel">호텔</a></li>
										<li><a href="/place/school">학교/유치원</a></li>
										<li><a href="/place/cafe">식당/카페</a></li>
									</ul></li>
								<li><a href="/event/eventmain">EVENT</a>
									<ul>
										<li><a href="#">진행 이벤트</a></li>
										<li><a href="#">종료 이벤트</a></li>
										<li><a href="#">이벤트 당첨</a></li>
									</ul></li>
								<li><a href="/event/eventmain">EVENT</a>
									<ul>
										<li><a href="/community/list">게시판</a></li>
										<li><a href="/community/review">리뷰</a></li>
									</ul></li>
							</ul>
						</nav>
					</div>
				</header>
			</div>
			<!-- header 끝 -->

			<!-- main 전체 -->
			<div id="test">
				<div id="main">
					<div id="cnt">
						<div id="cnt_header">
							<div id="cnt-header_left">
								<img id="img" src="/display?filename=${main.filem}">
							</div>
							<div id="box">
								<div id="cnt-header_right">
									<div id="title_header">
										<div id="detail_name">
											<h2>${main.w_name}</h2>
										</div>
										<div id="price">
											<span>${main.w_price}원</span>
										</div>
									</div>
									<div id="shipping">
										<div>
											<span class="title"><b>배송방법</b></span><span>택배</span>
										</div>
										<div>
											<span class="title"><b>배송비</b></span><span>무료(50,000원
												이상 무료배송)</span>
										</div>
										<div>
											<span class="title"><b>배송 안내</b></span><br> <span>무료배송/도서산간10,000원
												추가/반품 및 교환비5,000원</span>
										</div>
									</div>
									<div id="bun">
										<button type="button" id="plus" class="but" value="+">+</button>
										<input type="text" id="Quantity" class="but" value="${main.w_Quantity}">
										<button type="button" id="minus" class="but" value="-">-</button>
										<span>원</span>
									</div>
									<div id="sum">
										<strong>총 상품 금액</strong>
										<div id="sum2">
											<em>총 수량 개</em> <strong>원</strong>
										</div>
									</div>
									<div>
										<input type="submit" id="purchase" value="구매하기" formaction="#">
									</div>
									<br>
									<div id="list">
										<input id="inquiry" type="submit" value="문의하기" formaction="/shoppage/shop_item">
										<input id="wish" type="submit" value="찜하기" formaction="#">
										<input id="basket" type="submit" value="장바구니" formaction="#">
									</div>
								</div>
							</div>
						</div>

						<!-- 상품 설명,리뷰,문의,배송 전체 -->
						<div id="btfTab" class="tab">
							<!-- 상품 상세 메뉴 -->
							<div id="slidemenu">
								<ul id="tab-titles">
									<li name="detail" class=""><a href="#product-detail">상세정보</a></li>
									<li name="review" class=""><a href="#product-review">구매평</a></li>
									<li name="qna" class=""><a href="#product-qna">상품문의 <span
											class="product-tab-review-count">(0)</span></a></li>
									<li name="etc" class=""><a href="#product-etc">배송/반품/교환
											안내</a></li>
								</ul>
							</div>
							<!-- 상품 설명,리뷰,문의,배송 전체 배치 -->
							<ul class="tab-contents">
								<c:forEach items="${sub}" var="sub">
									<!-- 상품 설명 -->
									<li id="product-detail"><img
										src="/display?filename=${sub.filem}"></li>
								</c:forEach>
								<li id="product-review">
									<section>
										<article
											class="sdp-review__article__list js_reviewArticleReviewList">
											<div>
												<div class="sdp-review__article__list__info__user">
													<span
														class="sdp-review__article__list__info__user__name js_reviewUserProfileImage"
														data-member-id="10458996"></span>
												</div>
												<div
													class="sdp-review__article__list__info__product-info__seller_name">
													판매자: 쿠팡(주)</div>
												<div
													class="sdp-review__article__list__info__product-info__name">탐사수
													무라벨, 500ml, 40개입</div>
											</div>
											<div
												class="sdp-review__article__list__attachment js_reviewArticleListGalleryContainer">
												<div class="sdp-review__article__list__attachment__list">
													<img>
												</div>
											</div>
											<div class="sdp-review__article__list__headline">놀러갈 땐
												무조건 탐사수 먹는 샘물로 정했습니다~</div>
											<div
												class="sdp-review__article__list__review__content js_reviewArticleContent">
											</div>
										</article>
									</section>
								</li>

								<!-- 상품 문의 영역 -->
								<li id="product-qna">
									<div id="prod-inquiry-list" class="prod-tab">
										<div class="prod-inquiry-list">
											<div class="clearFix">
												<h4 class="prod-inquiry-list__title">상품문의</h4>
												<div class="prod-inquiry-list__emphasis">
													<ul>
														<li>구매한 상품의 <em>취소/반품은 구매내역에서 신청</em> 가능합니다.
														</li>
														<li>상품문의 및 후기게시판을 통해 취소나 환불, 반품 등은 처리되지 않습니다.</li>
														<li><em>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는
																문의는 고객센터 내 1:1 문의하기</em>를 이용해주세요.</li>
														<li><em>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배
																등의 글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</em></li>
														<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지
															말아주세요.</li>
													</ul>
												</div>
												<div class="prod-inquiry-list__container">
													<div class="prod-inquiry-items">
														<div class="prod-inquiry-item">
															<c:forEach items="${item}" var="item">
																<em class="prod-inquiry-item__label">질문</em>
																<div class="prod-inquiry-item__wrap">
																	<strong calss="prod-inquiry-author">${item.s_id}</strong>
																	<div class="prod-inquiry-selected">${main.w_name}</div>
																	<div class="prod-inquiry-content">${item.s_question}</div>
																	<div class="prod-inquiry-time">${item.s_time}</div>
																	<c:choose>
																		<c:when test="${item.s_Confirm == 2}">
																			<div class="prod-inquiry-reg">
																				<em class="prod-inquiry-reg-label">답변</em>
																				<div class="prod-inquiry-reg-wrap">
																					<strong class="prod-inquiry-reg-author">관리자</strong>
																					<div class="prod-inquiry-reg-content">${item.s_answer}
																					</div>
																					<div class="prod-inquiry-reg-time">${item.s_time}</div>
																				</div>
																			</div>
																		</c:when>
																	</c:choose>
																</div>
															</c:forEach>
														</div>
													</div>
												</div>												
											</div>
										</div>
									</div>
								</li>


								<li id="product-etc">
									<h5 class="prod-title">배송정보</h5>
									<table class="prod-table">
										<colgroup>
											<col width="150px">
											<col width="340px">
											<col width="150px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>배송방법</th>
												<td>순차배송</td>
												<th rowspan="2">배송비</th>
												<td rowspan="2">무료배송<br>배송 상품 중 30,000원 이상 구매 시 무료
													배송<br>도서산간 지역 추가비용 10,000원
												</td>
											</tr>
											<tr>
												<th>묶음배송 여부</th>
												<td>가능</td>
											</tr>
											<tr>
												<th class="prod-period">배송기간</th>
												<td colspan="3"><ul>
														<li><span>ㆍ배송 지역 : 주문 및 결제 완료 후, 1-2일 이내 도착</span></li>
														<li><span>ㆍ 미배송 지역 : 주문 및 결제 완료 후, 2-3일 이내 도착</span>
															<p>-도서 산간 지역 등은 하루가 더 소요될 수 있습니다. 곧 고객님께도 쿠팡친구가 찾아갈 수
																있도록 노력하겠습니다</p></li>
														<li>ㆍ천재지변, 물량 수급 변동 등 예외적인 사유 발생 시, 다소 지연될 수 있는 점 양해
															부탁드립니다.</li>
													</ul>
											</tr>
										</tbody>
									</table>

									<h5 class="prod-title">교환/반품 안내</h5>
									<ul class="prod-notice">
										<li>ㆍ교환/반품에 관한 일반적인 사항은 판매자가 제시사항보다 관계법령이 우선합니다.<br>다만,
											판매자의 제시사항이 관계법령보다 소비자에게 유리한 경우에는 판매자 제시사항이 적용됩니다.
										</li>
									</ul>
									<table class="prod-table">
										<colgroup>
											<col width="160px;">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>교환/반품 비용</th>
												<td>1) [총 주문금액] - [반품 상품금액] = 19,800원 미만인 경우 반품비 5,000원<br>2)
													[총 주문금액] - [반품 상품금액] = 19,800원 이상인 경우 반품비 2,500원
												</td>
											</tr>
											<tr>
												<th>교환/반품 신청 기준일</th>
												<td>
													<p>ㆍ단순변심에 의한 로켓배송 상품의 교환/반품은 제품 수령 후 30일 이내까지, 교환/반품
														제한사항에 해당하지 않는 경우에만 가능 (교환/반품 비용 고객부담)</p>
													<p>
														ㆍ상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날
														또는 알 수 있었던 날부터<br> <span class="prod-indent">30일
															이내에 청약철회 가능</span>
													</p>
												</td>
											</tr>
										</tbody>
									</table>

									<h5 class="prod-title">교환/반품 제한사항</h5>
									<ul class="prod-list">
										<li>ㆍ주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
										<li>ㆍ상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 훼손된 경우 (단, 내용 확인을
											위한 포장 개봉의 경우는 예외)</li>
										<li>ㆍ고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
										<li>ㆍ세트상품 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매
											불가한 경우</li>
										<li>ㆍ모니터 해상도의 차이로 인해 색상이나 이미지가 실제와 달라, 고객이 단순 변심으로 교환/반품을
											무료로 요청하는 경우</li>
										<li>ㆍ제조사의 사정 (신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는
											경우</li>
									</ul>
									<p class="prod-text">※ 각 상품별로 아래와 같은 사유로 취소/반품이 제한될 수 있습니다.</p>
									<table class="prod-table">
										<colgroup>
											<col width="150px">
											<col width="*">
										</colgroup>
										<tbody>
											<tr>
												<th>의류/잡화/수입명품</th>
												<td>
													<p>ㆍ상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된
														경우</p>
												</td>
											</tr>
											<tr>
												<th>계절상품/식품/화장품</th>
												<td>
													<p>ㆍ신선/냉장/냉동 식품의 단순변심의 경우</p>
													<p>
														ㆍ뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br> <span>진료
															확인서 및 소견서 등을 증빙하면 환불이 가능 (제반비용 고객부담)</span>
													</p>
												</td>
											</tr>
											<tr>
												<th>전자/가전/설치상품</th>
												<td>
													<p>ㆍ설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우</p>
													<p>ㆍ상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우 (내비게이션, OS시리얼이
														적힌 PMP)</p>
													<p>ㆍ홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우
														(노트북, 데스크탑 PC 등)</p>
												</td>
											</tr>
											<tr>
												<th>자동차용품</th>
												<td>
													<p>ㆍ상품을 개봉하여 장착한 이후 단순변심인 경우</p>
												</td>
											</tr>
											<tr>
												<th>CD/DVD/GAME/<br>BOOK
												</th>
												<td><span>ㆍ복제가 가능한 상품의 포장 등을 훼손한 경우</span></td>
											</tr>
										</tbody>
									</table>
									<div class="product-seller">
										<p class="prod-delivery-return-policy-title">판매자 정보</p>
										<table class="prod-delivery-return-policy-table">
											<colgroup>
												<col width="150px">
												<col width="*">
											</colgroup>
											<tbody>
												<tr>
													<th>판매자</th>
													<td>조석현 <a
														class="prod-delivery-return-policy-table__phone-link"
														href="tel:+8215777011" target="_blank">0000-0000</a>
													</td>
												</tr>
											</tbody>
										</table>

										<p class="prod-minor-notice">미성년자가 체결한 계약은 법정대리인이 동의하지 않는
											경우 본인 또는 법정대리인이 취소할 수 있습니다.</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- main 끝 -->
			<!-- bottom 시작 -->
			<%--본문 넣을 자리 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%></div>
	</form>
</body>
</html>
