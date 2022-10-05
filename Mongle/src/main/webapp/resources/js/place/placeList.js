$(document).ready(function() {

	// var slt="<li id='slt'><a href='/place/board'>전체보기</a></li>";
	// $("#1").html(slt);

	$("input[name='search']").on("click", function() {
		// pageNum에 1을 초기화
		$("input[name='pageNum']").val("1");
		// form 태그를 submit
		$("#searchForm").submit();
	})

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
	
	var ctgr=$('#sltctgr').val();
	if(ctgr=='clinic'){
		$('#2').attr('class','slt');
	}else if(ctgr=='grooming'){
		$('#3').attr('class','slt');
	}else if(ctgr=='hotel'){
		$('#4').attr('class','slt');
	}else if(ctgr=='school'){
		$('#5').attr('class','slt');
	}else if(ctgr=='cafe'){
		$('#6').attr('class','slt');
	}else{
		$('#1').attr('class','slt');
	}
	

})