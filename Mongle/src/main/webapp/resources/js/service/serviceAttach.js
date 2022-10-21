/**
 * 첨부파일 관련 js
 */


$(document).ready(function(){
	//detail.jsp가 시작되자마자 bno값 가져오기
	var bno=$("input[name='bno']").val();
	$.getJSON("/filelist",{bno:bno},function(filelist){
		console.log(filelist);
		
		var str="";
		$(filelist).each(function(i,file){
			//만약 image결과가 true면
			if(file.image) {
				var filePath=encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
				str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'><div>";
				str+="<img src='/servicedisplay?fileName="+filePath+"'>";
				str+="<a href='/servicedownload?fileName="+filePath+"'>"+file.fileName+"</a></div></li>";
			}else {//그렇지않으면
				var filePath=encodeURIComponent(obj.uploadPath+"/"+file.uuid+"_"+file.fileName)
				var fileLink = filePath.replace(new RegExp(/\\/g), "/");
				
				str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'>"
				str+= "<a href='/servicedownload?fileName="+filePath+"'>"+file.fileName+"</a>"
			}
			
			
		})
		$("#uploadResult ul").html(str);
	})
})