/**
 * 
 */
// 파일 보여주기
function showUploadntResult(Arr){
	if(!Arr||Arr.length==0){return;}
	var uploadUL=$("#ntuploadResult ul");
	var str="";
	$(Arr).each(function(i,obj){
		if(obj.image){
			var fileCellPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.filename);
			str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.image+"'><div>"
			str+="<span>"+obj.filename+"</span>"
			str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='image'><i class='i'>X</i></button><br>"
			str+="<img src='ntdisplay?filename="+fileCellPath+"'></div></li>"
		}else{
			var fileCellPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.filename)
			var fileLink=fileCellPath.replace(new RegExp(/\\/g),"/");
			str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.image+"'><div>"
			str+="<span>"+obj.filename+"</span>"
			str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='file'><i class='i'>X</i></button><br>"
			str+="<img src='../resources/image/paper-clip.png'></div></li>"
		}
	})
	uploadUL.append(str);
}
$(document).ready(function(){
	//글쓰기 버튼을 클릭했을 때
	var formObj=$("form[role='form']");
	$("#ntuploadbtn").on("click",function(e){
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
		$("#ntuploadResult ul li").each(function(i,obj){
			var jobj=$(obj);
			console.log(jobj);
			str += "<input type = 'hidden' name = 'attach["+i+"].filename' value = '" + jobj.data("filename")+"'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].image' value = '" + jobj.data("type") + "'>";
		})
		formObj.append(str).submit();
	})
	//파일 모아보는 곳에서 x버튼을 클릭했을 때 파일이 삭제되게끔
	$("#ntuploadResult").on("click","button", function(e){
		console.log("delete")
		var targetFile=$(this).data("file");
		var type=$(this).data("type");
		var targetLi=$(this).closest("li");
		console.log(targetFile);
		$.ajax({
			url:'/ntdeleteFile',
			data:{filename:targetFile,type:type},
			dataType:'text',
			type:'POST',
			success:function(result){
				alert(result);
				targetLi.remove();
			}
		})
	})
	var cloneOjb=$("#ntuploaddiv").clone();
	// 파일을 올렸을 때
	$("input[name='ntuploadFile']").change(function(e){
		var formData=new FormData();
		var inputFile=$("input[name='ntuploadFile']");
		var files=inputFile[0].files;
		console.log(files);
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("ntuploadFile",files[i]);
		}
		$.ajax({
			url:'/ntuploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			dataType:'json',
			success:function(result){
				console.log(result);
				$("#ntuploaddiv").html(cloneOjb.html());
				showUploadntResult(result);
			}
		})
	})
	// 업로드 목록
	var ntuploadResult=$("#ntuploadResult ul");
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
})
