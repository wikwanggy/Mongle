$(document).ready(function() {
	//detail.jsp 시작되자마자(ready이벤트) bno값 가져오기
	var bno=$("input[name='bno']").val();
	$.getJSON("/placeattachlist",{bno:bno},function(attachlist){
	//	console.log(attachlist);
		var str="";
		
		$(attachlist).each(function(i,attach){
			//만약 image 결과가 true면 
			if(attach.image){	// 아래 실행
			
				var filePath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
			
				console.log(filePath)
			
				str+="<li><img style='max-width:80%;' src='/placedisplay?fileName="+filePath+"'></li>"
				$("#photo ul").html(str);
				
			}else{	// image 결과가 false면
				// 다운로드 할 수 있도록 실행
				var filePath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
				
				str+="다운로드 : <li><a style='color:blue;' href='/placedownload?fileName="+filePath+"'>"+attach.fileName+"</a></li>"
				$("#file ul").html(str);
			}
		})

	})
	
})