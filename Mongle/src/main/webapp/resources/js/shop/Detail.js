/**
 * 상품 상세설명 페이지
 */
$(document).ready(function() {
	// detail.jsp가 시작되자마자(ready이벤트) bno값 가져오기
	var bno = $("input[name=bno]").val();
	// controller 주소, bno를 json으로 저장 function 콜백
	$.getJSON("/Detaillist", {
		bno : bno
	}, function(Detaillist) {
		console.log("Detaillist="+Detaillist);
		var str = "";
		$(attachlist).each(function(i, attachlist) {
			// 만약 image결과가 true면
			if (attachlist.p_image){
				var filePath=encodeURIComponent(attachlist.upload+"/s_"+attachlist.p_uid+"_"+attachlist.filename)
				str += "<img src='/diplay?filename="+filefilePath+"'>"
			} else{ // 그렇지 않으면
				var filePath=encodeURIComponent(attachlist.upload+"/s_"+attachlist.p_uid+"_"+attachlist.filename)
				str += "<img src='/diplay?filename="+filefilePath+"'>"+attachlist.filename
			}			
		})
		$(".product-detail li").html(str);
	})
})