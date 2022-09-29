$(document).ready(function() {

	// var slt="<li id='slt'><a href='/place/board'>전체보기</a></li>";
	// $("#1").html(slt);

	$("input[name='search']").on("click", function() {
		// pageNum에 1을 초기화
		$("input[name='pageNum']").val("1");
		// form 태그를 submit
		$("#searchForm").submit();
	})

	// 카테고리 선택(a태그)
	/*
	 * $("#place-list a").on("click", function(e) { e.preventDefault(); var ctgr =
	 * $(this).attr("title");// 버튼이 클릭 되었을 때 그 버튼의 value를 var ctgr로 가져와서
	 * $.ajax({ url : '/place/board', // 이 주소로 type : "get", // 포스트 방식으로 보내는데
	 * cache : false, headers : { "cache-control" : "no-cache","pragma" :
	 * "no-cache" }, data : {"ctgr" : ctgr}, // ctgr를 ctgr로 명명하여 보내겠다 success :
	 * function(data) { console.log(ctgr); $('body').html(data); // 성공할시에
	 * body부분에 data라는 html문장들을 다적용시키겠다 }, error : function(data) {
	 * alert('error'); }// error })// ajax $('#ctgrForm').submit(); })
	
	// 카테고리 select
	$("select[name='ctgr']").on("change", function() {
		var ctgr = $("#ctgr-select").val();
		$.ajax({
			url : '/place/board', // 이 주소로
			type : "get", // 포스트 방식으로 보내는데
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
				"ctgr" : ctgr
			}, // ctgr를 ctgr로 명명하여 보내겠다
			success : function(data) {
				console.log(ctgr);
				$('body').html(data); // 성공할시에 body부분에 data라는 html문장들을 다적용시키겠다
			},
			error : function(data) {
				alert('error');
			}// error
		})// ajax
		$('#ctgrForm').submit();
	})
 */
	// 지역 선택
	$("#loc-select").on("change", function() {
/*		// type
		var type = $("select[name='type']").val();
		// pageNum
		var pageNum = $("input[name='pageNum']");
		// amount
		var amount = $("input[name='amount']");
		// keyword
		var keyword = $("input[name='keyword']");
		// ctgr
		var ctgr = $(ctgr);
*/		// loc
		var loc = $(this).val();
		alert(loc);

		$.ajax({
			url : '/place/board?ctgr=${ctgr}', // 이 주소로
			type : "get", // 방식으로 보내는데
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			data : {
/*				"type" : type,
				"pageNum" : pageNum,
				"amount" : amount,
				"keyword" : keyword,
				"ctgr" : ctgr,
*/				"loc" : loc
			},
			success : function(data) {
				console.log(loc);
				$('body').html(data); // 성공할시에 body부분에 data라는 html문장들을 다적용시키겠다
			},
			error : function(data) {
				alert('error');
			}// error
		})// ajax
		$('#locForm').submit();
	})
	
	$("#loginNull").on("click", function() {
		alert("로그인이 필요합니다.")
	})

})