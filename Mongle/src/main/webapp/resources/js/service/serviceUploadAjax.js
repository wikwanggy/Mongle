/**
 * 
 */
$(document).ready(function(){
	/* 4.첨부파일 공격에 대비하기 위한 업로드 파일 확장자 제한.
	  
	  .exe .zip .alz
	 	 
	 */
	//함수선언(checkExtension)
	//정규식을 이용하여 확장자 제한
	var reg = new RegExp("(.*?)\.(exe|zip|alz)$")
	//최대크기를 설정하여 그 이상이면 제한
	var maxSize=5242880; //5MB
	// 					파일이름, 파일크기
	
	
	function checkExtension(fileName,fileSize) {
		//파일크기 제한
		//실제파일의 크기> 최대크기
		if(fileSize >= maxSize) {
			alert("파일사이즈초과");
			return false;
		}
		//확장자 제한
		//실제파일명의 확장자와 정규식 비교
		//정규식이면
		if(reg.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할수 없습니다.")
			return false;
		}
		return true;
	}
	
	//파일을 업로드할때(id="uploadFile")을 클릭후 선택하면
	var cloneOjb=$("#uploaddiv").clone();
	$("input[type='file']").change(function(e){
		//파일업로드 관련 로직 처리
		//.jsp의 form태그를 대체(FormData함수)
		var formData=new FormData();		
		var inputFile=$("input[name='uploadFile']");
		var files=inputFile[0].files;
		
		for(var i=0;i<files.length;i++) {
			
			//함수 호출(checkExtension)
			if(!checkExtension(files[i].name,files[i].size)) {
				return false;
			}
			
			//.jsp의 파일선택을 통해 선택한 파일들을 form태그에 추가
			formData.append("uploadFile",files[i]);
		}
		//ajax를 통해서 serviceUploadController에 파일 관련 데이터 전송.
		$.ajax({
			type:"post",
			url:"/serviceuploadAjaxAction",
			data:formData,
			contentType:false,
			processData:false,
			dataType:"json",
			success:function(result){
				console.log(result);
				
				$("#uploadDiv").html(cloneOjb.html());
				
				showUploadFile(result);
				
		}
		})
		
	})
	var uploadResult = $("#uploadResult ul");	
		//글쓰기 파트나 수정할시 파일을 삭제할수있게하는 파트
		function showUploadFile(arr) {
			if(!arr||arr.length==0){return;}
			var str="";
			$(arr).each(function(i,file){
				if(file.image) {
				//아래에 있는거 실행
					var filePath=encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
					str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'><div>";
					str+="<img src='/servicedisplay?fileName="+filePath+"'>";
					str+="<span>"+file.fileName+"</span>";
					str+="<button data-file=\'"+ filePath+"\' data-type='image'>삭제</button></div></li>";
				}else {//그렇지 않으면
					//다운로드 할 수 있도록 실행
					var filePath=encodeURIComponent(obj.uploadPath+"/"+file.uuid+"_"+file.fileName)
					var fileLink = filePath.replace(new RegExp(/\\/g), "/");
					
					str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'>"
					str+= "<a href='/servicedownload?fileName="+filePath+"'>"+file.fileName+"</a>"
					str+="<span>"+file.fileName+"</span>";
					str+="<button data-file=\'"+ filePath+"\' data-type='image'>삭제</button></li>"
				}
			});
			uploadResult.append(str);
		}
		
		
		$("#uploadResult").on("click","button", function(e){
			console.log("delete File");
			if(confirm("정말로 지우시겠습니까 ?")) {
			var targetFile=$(this).data("file");
			var type=$(this).data("type");
			var targetLi=$(this).closest("li");
			$.ajax({
				url:'/deleteFile',
				data:{fileName:targetFile,type:type},
				dataType:'text',
				type:'POST',
				success:function(result){
					alert(result);
					targetLi.remove();
				}
			})
		}
	})
		
		//글쓰기 버튼을 클릭했을 때
				var formObj=$("form[role='form']");
				$("#uploadBtn").on("click",function(e){
					e.preventDefault();
					var str="";
					var empty='';
					if($("input[name='title']").val().trim()==empty||$("input[name='title']").val().trim()==null){
						alert("제목을 입력하세요.");
						$("input[name='title']").val(empty);
						return false;
					}else if($("textarea[name='content']").val().trim()==empty||$("textarea[name='content']").val().trim()==null){
						alert("내용을 입력하세요.");
						$("textarea[name='content']").val(empty);
						return false;
					}
					
					$("#uploadResult ul li").each(function(i,file){
						var jfile=$(file);
						console.log(jfile.data);
						
						str += "<input type = 'hidden' name = 'svfile["+i+"].fileName' value = '" + jfile.data("filename")+"'>";
						str += "<input type = 'hidden' name = 'svfile["+i+"].uuid' value = '" + jfile.data("uuid") + "'>";
						str += "<input type = 'hidden' name = 'svfile["+i+"].uploadPath' value = '" + jfile.data("path") + "'>";
						str += "<input type = 'hidden' name = 'svfile["+i+"].image' value = '" + jfile.data("type") + "'>";
					})
					formObj.append(str).submit();
				})

})
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			