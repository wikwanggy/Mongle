/**
 * 상품 상세설명 페이지
 */
$(document).ready(function() {
	// detail.jsp가 시작되자마자(ready이벤트) bno값 가져오기
	var bno = $("input[name=product_id]").val();
	// controller 주소, bno를 json으로 저장 function 콜백
	$.getJSON("/Detaillist", {
		product_id : product_id
	}, function(Detaillist) {
		console.log(Detaillist);
		var str = "";
		$(Detaillist).each(function(i, Detaillist) {
			// 만약 image결과가 true면
			if (Detaillist.product_image){
				var filePath=encodeURIComponent(Detaillist.upload+"/s_"+Detaillist.uid+"_"+Detaillist.filename)
				str += "<img src='/diplay?filename="+filefilePath+"'>"
			} else{ // 그렇지 않으면
				var filePath=encodeURIComponent(Detaillist.upload+"/s_"+Detaillist.uid+"_"+Detaillist.filename)
				str += "<img src='/diplay?filename="+filefilePath+"'>"+Detaillist.filename
			}			
		})
		$(".product-detail li").html(str);
	})
})