/*
 * 상품 메인 페이지
 */
$(document).ready(function() {
	// 검색버튼을 클릭하면
	/*$("input[type='button']").on("click", function() {
		// pageNum에 1을 초기화
		$("input[name='pageNum']").val("1");
		// form태그를 submit
		$("#searchForm").submit();
	})*/
	$("#new").on("click", function(e) {
		e.preventDefault();
		var category = $("#category").val();
		// 만약에 category가 간식이면
		if (category == "메인") {
			location.href = "/shoppage/shop?s_type=메인&type=new";
		}
	})
	// 낮은 가격 순 클릭
	$("#row").on("click", function(e) {
		e.preventDefault();
		var category = $("#category").val();
		// 만약에 category가 간식이면
		if (category == "메인") {
			location.href = "/shoppage/shop?s_type=메인&type=row";
		}
	})
	// 높은 가격 순 클릭
	$("#hi").on("click", function(e) {
		e.preventDefault();
		var category = $("#category").val();
		// 만약에 category가 간식이면
		if (category == "메인") {
			location.href = "/shoppage/shop?s_type=메인&type=hi";
		}
	})
})