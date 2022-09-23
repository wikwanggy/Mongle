/**
 * 
 */
$(document).ready(function(){
	//boarddetail.jsp가 시작되자마자 bno값 가져오기
	var bno=$("input[name='bno']").val();
	//alert(bno);
	$.getJSON("/community/uplist",{bno:bno},function(uplist){
		console.log(uplist);
		var str="";
		$(uplist).each(function(i,attach){
			if(attach.image){//만약 image 결과가 true면
				var filePath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.filename)
				str+="<li><img src='/community/comdisplay?filename="+filePath+"'></li>"
			}else{//그렇지 않으면
				var filePath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.filename)
				str+="<li><a href='/community/comdownload?filename="+filePath+"'>"+attach.filename+"</a></li>"
			}
		})
		$("#uploadResult ul").html(str);
	})
})