/**
 * 
 */
$(document).ready(function(){
	var reg=new RegExp("(,*?)\.(exe|zip|alz)$")
	//최대 크기 설정, 이상일시 제한
	var maxSize=5242880; // 5MB
				//파일 명, 파일 크기
	function checkExtension(fileName,fileSize){
		//파일 크기 제한
		//실제 파일의 크기>최대 파일의 크기
		if(fileSize>maxSize){
			alert("5MB 이하의 파일만 업로드 할 수 있습니다.");
			return false;
		}
		//확장자 제한
		//실제 파일명의 확장자와 정규식 비교
		//정규식이면,
		if(reg.test(fileName)){
			alert("해당 파일의 확장자는 업로드 할 수 없습니다.")
			return false;
		}
		return true;
	}
	//파일
	$("#uploadbtn").on("click",function(e){
		e.preventDefault();
		//alert("aaa");
		var formData=new FormData();
		var iF=$("input[name='uploadFile']");
		console.log(iF);
		var files=iF[0].files;
		console.log(files);
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			//.jsp의 파일선택을 통해 선택한 파일들을 form태그에 추가
			formData.append("uploadFile",files[i]);
		}
		$.ajax({
			type:'post',
			url:'/ComuploadAjaxAction',
			data:formData,
			contentType:false,
			processData:false,
			dataType:'json',
			success:function(result){
				console.log(result);
				var str="";
				var input="";
				$(result).each(function(i,obj){
					//console.log(obj);
					//console.log(obj.filename);
					input+="<input type='hidden' name='attach["+i+"].filename' value='"+obj.filename+"'>"
					input+="<input type='hidden' name='attach["+i+"].uuid' value='"+obj.uuid+"'>"
					input+="<input type='hidden' name='attach["+i+"].uploadPath' value='"+obj.uploadPath+"'>"
					input+="<input type='hidden' name='attach["+i+"].image' value='"+obj.image+"'>"
					
					if(obj.image){
						var filePath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.filename);
						console.log(filePath);
						str+="<li><img src='comdisplay?filename="+filePath+"'></li>";
					}else{
						var filePath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.filename);
						console.log(filePath);
						str+="<li><a href='comdownload?filename="+filePath+"'>"+obj.filename+"</a></li>";
					}
				})
				$("#uploadResult ul").html(str);
				$("#form").append(input).submit();
			}
		})
	})
	
})