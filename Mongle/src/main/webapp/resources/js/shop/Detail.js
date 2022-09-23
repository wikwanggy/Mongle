/**
 * 상품 상세설명 페이지
 */
$(document).ready(function() {
	// detail.jsp가 시작되자마자(ready이벤트) bno값 가져오기
	var bno = $("input[name=bno]").val();
	// controller 주소, bno를 json으로 저장 function 콜백
	$.getJSON("/attachlist", {
		bno : bno
	}, function(attachlist) {
		console.log("attachlist="+attachlist);
		var str = "";
		$(attachlist).each(function(i, attach) {
			// 만약 image결과가 true면
			if (attach.p_image){
				var filePath=encodeURIComponent(attach.p_upload+"/s_"+attach.p_uid+"_"+attach.filename)
				str += "<img src='/diplay?filename="+filePath+"'>"
			} else{ // 그렇지 않으면
				var filePath=encodeURIComponent(attach.p_upload+"/s_"+attach.p_uid+"_"+attach.filename)
				str += "<img src='/diplay?filename="+filePath+"'>"+attach.filename
			}			
		})
		$("#cnt-header_left").html(str);
	})
})