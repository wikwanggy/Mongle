/**
 * 첨푸파일 관련 js
 */
$(document).ready(
		function() {
			// boarddetail.jsp가 시작되자마자(ready이벤트) bno값가져오기
			var bno = $("input[name='bno']").val();
			// // 컨트롤루의 주소 , bno를 json으로 저장 function콜백
			$.getJSON("/attachlist", {
				bno : bno
			}, function(attachlist) {
				console.log(attachlist);
				var str="";
				$(attachlist).each(
						function(i, attach) {
							// 만약 image결과가 true면
							if (attach.image) {
								var filePath=encodeURIComponent(attach.p_upload+"/_"+attach.p_uid+"_"+attach.p_name)
								str += "<li><img src='/display?p_name="+filePath+"'></li>"
							} else {// 그렇지 않으면
								var filePath=encodeURIComponent(attach.p_upload+"/_"+attach.p_uid+"_"+attach.p_name)
								str += "<li><a href='/download?p_name="+filePath+"'>"+attach.p_name+"</a></li>"
							}

						})
				$("#uploadResult ul").html(str);

			})
		})