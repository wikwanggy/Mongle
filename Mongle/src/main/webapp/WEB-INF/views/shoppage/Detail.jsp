<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>shop</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/shop/Detail.js"></script>
<script type="text/javascript" src="/resources/js/shop/cart.js"></script>
<link rel="stylesheet" href="/resources/css/shop/Detail.css">
<link rel="stylesheet" href="/resources/css/shop/header.css">
</head>

<%--상단 시작 --%>
<jsp:include page="../include/header.jsp"></jsp:include>
<%--상단 끝 --%>
<%--본문 넣을 자리 --%>
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
					<form method="post">
						<div id="cnt-header_right">
							<div id="title_header">
								<div id="detail_name">
								<input type="hidden" value="${main.bno}" name="prodbno">
									<h2>${main.w_name}</h2>
								</div>
								<span id="total"><fmt:formatNumber
										value="${main.w_price}" pattern="#,###" /></span><span>원</span>
								<div id="price"></div>
							</div>
							<div id="shipping">
								<div>
									<span class="title"><b>배송방법</b></span><span>택배</span>
								</div>
								<div>
									<span class="title"><b>배송비</b></span><span>무료(50,000원 이상
										무료배송)</span>
								</div>
								<div>
									<span class="title"><b>배송 안내</b></span><br> <span>무료배송/도서산간10,000원
										추가/반품 및 교환비5,000원</span>
								</div>
							</div>

							<div id="sum">
								<div id="number">
									<input type="hidden" id="sell_price" value="${main.w_price}">
									<input type="text" name="quantity" value="1" id="num" class="sum"
										max="${main.w_Quantity}">
									<button type="button" id="plus" class="sum" value="+">+</button>
									<button type="button" id="minus" class="sum" value="-">-</button>
								</div>
								<input id="basket" type="submit" value="장바구니" class="but"
									formaction="/basket?id=${sessionScope.login.id}">
								<a><input type="submit" id="purchase" value="구매하기"
									class="but" formaction="#"></a>
							</div>


							<script type="text/javascript">							        							
									$(function(){
										$("#num").keyup(function(){
											if(isNaN($(this).val()) || parseInt($(this).val())<1){
												$(this).val("1");
												$("#total").html($("#sell_price").val()); /* 토탈 처음 가격 */
												return;
											}
											var total = parseInt($("#sell_price").val())*parseInt($(this).val());
											$('#total').html(total);
										})									   
										$("#plus").click(function(){
											numAdd();
										});
										$("#minus").click(function(){
											numDec();
										})
									})
									/* +1 */
									function numAdd(){										
										var num_add = parseInt($("#num").val())+1;
										if(num_add > ${main.w_Quantity}){											
										}
										else{								
									        $("#num").val(num_add);
									        var total = parseInt($("#sell_price").val())*parseInt($("#num").val());
									        var total1 = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
									        $("#total").html(total1);
									    }
									}
									/* -1 */
									function numDec(){
										var num_dec = parseInt($('#num').val())-1;
										if(num_dec<1){											
										}
										else{
											$("#num").val(num_dec);											
											var total = parseInt($('#sell_price').val())*parseInt($('#num').val());
											var total1 = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
											$('#total').html(total1);
										}
									}									
								</script>
							<br>
							<div id="list">
								<a
									href="/shoppage/shop_item?bno=${main.bno}&id=${sessionScope.login.id}"><button
										id="inquiry" type="button" value="문의하기">문의하기</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 상품 설명,리뷰,문의,배송 전체 -->
			<div id="btfTab" class="tab">
				<!-- 상품 상세 메뉴 -->
				<div id="slidemenu">
					<ul id="tab-titles">
						<li name="detail" class=""><a href="#product-detail">상세정보</a></li>
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
											<li><em>가격, 판매자, 교환/환불 및 배송 등 해당 상품 자체와 관련 없는 문의는
													고객센터 내 1:1 문의하기</em>를 이용해주세요.</li>
											<li><em>"해당 상품 자체"와 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의
													글은 예고 없이 이동, 노출제한, 삭제 등의 조치가 취해질 수 있습니다.</em></li>
											<li>공개 게시판이므로 전화번호, 메일 주소 등 고객님의 소중한 개인정보는 절대 남기지 말아주세요.</li>
										</ul>
									</div>
									<div class="prod-inquiry-list__container">
										<div class="prod-inquiry-items">
											<div class="prod-inquiry-item">
												<c:forEach items="${item}" var="item">
													<div class="prod-inquiry-item__wrap">
														<em class="prod-inquiry-item__label">질문</em> <strong
															calss="prod-inquiry-author">${item.s_id}</strong>
														<div class="prod-inquiry-selected">${main.w_name}</div>
														<div class="prod-inquiry-content">${item.s_question}</div>
														<div class="prod-inquiry-time">${item.s_time}</div>
													</div>
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
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<jsp:include page="../shoppage/Detail_Info.jsp"></jsp:include>
				</ul>
			</div>
		</div>
	</div>
</div>
<!-- main 끝 -->
<!-- bottom 시작 -->
<%--본문 넣을 자리 --%>
<%--하단 시작 --%>
<jsp:include page="../include/footer.jsp"></jsp:include>
<%--하단 끝 --%>
</body>
</html>
