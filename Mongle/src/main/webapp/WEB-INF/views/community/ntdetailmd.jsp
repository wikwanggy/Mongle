<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mongle-몽글</title>
<link rel="stylesheet" href="../resources/css/boardlist.css"><link rel="stylesheet" href="../resources/css/main.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<jsp:include page="../header.jsp"/>
<body>
<form method="post" enctype = "multipart/form-data" role="form" action="ntupdate">
	<div class="board_l"><table border="1" id="board_detail">
		<tr>
			<td colspan="2" style="height:25px;">
				<input type="hidden" name="id" value="${ntdetailmd.id}">
				<input type="hidden" name="bno" value="${ntdetailmd.bno}">
				<input type="text" name="title" class="board_write_title" value="${ntdetailmd.title}">
			</td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="115" rows="30" name="content">${ntdetailmd.content}</textarea></td>
		</tr>
		<tr>
			<td><div id="ntuploaddiv"><input type="file" name="ntuploadFile" multiple></div>
				<div class="row">
				<div class="ntuploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
			</td>
		</tr>
		<c:choose><c:when test="${sessionScope.login.id=='admin'}">
			<tr>
				<td id="btn_board_detail">
					<input type="button" value="수정 완료" id="ntuploadbtn" class="btn_board">
				</td>
			</tr>
		</c:when></c:choose>
	</table></div></form>
<script type="text/javascript">
function showUploadntResult(Arr){
	if(!Arr || Arr.length==0){return;}
	var uploadUL=$(".ntuploadResult ul");
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
$(document).ready(function() {
	(function(){
		var bno = $("input[name='bno']").val();
		$.getJSON("/community/ntlist", {bno:bno}, function(arr){
			console.log(arr);
			var str="";
			$(arr).each(function(i,attach){
				if(attach.image){
					var fileCellPath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.filename);
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<span>"+attach.filename+"</span>"
					str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='image'><i class='i'>X</i></button><br>"
					str+="<img src='ntdisplay?filename="+fileCellPath+"'></div></li>"
				}else{
					var fileCellPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.filename)
					//var fileLink=fileCellPath.replace(new RegExp(/\\/g),"/");
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<div style='text-decoration:underline;'>"+attach.filename+"<img src='../resources/image/paper-clip.png'></div>"
					str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='file'><i class='i'>X</i></button><br>"
					str+="</div></li>"
				}
			});
			$(".ntuploadResult ul").html(str);
		});
	})();
	$(".ntuploadResult").on("click","button",function(e){
		console.log('delete file');
		if(confirm("파일을 삭제하시겠습니까?")){
			var targetLi=$(this).closest("li");
			targetLi.remove();
		}
	})
	var reg=new RegExp("(,*?)\.(exe|zip|alz)$");
	var maxSize=5242880;
	function checkExtension(fileName,fileSize){
		if(fileSize>maxSize){
			alert("5MB 이하의 파일만 업로드 할 수 있습니다.");
			return false;
		}
		if(reg.test(fileName)){
			alert("해당 파일의 확장자는 업로드 할 수 없습니다.")
			return false;
		}
		return true;
	}
	// 파일을 올렸을 때
	$("input[name='ntuploadFile']").change(function(e){
		var formData=new FormData();
		var inputFile=$("input[name='ntuploadFile']");
		console.log(inputFile);
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
				showUploadntResult(result);
			}
		});
	});
	var formObj=$("form[role='form']");
	$("#ntuploadbtn").on("click",function(e){
		e.preventDefault();
		var str="";
		var empty='';
		if($("input[name='title']").val().trim()==empty||$("input[name='title']").val().trim()==null){
			alert("제목을 입력하세요.");
			$("input[name='title']").val(empty);
			return false;
		}
		$(".ntuploadResult ul li").each(function(i,obj){
			var jobj=$(obj);
			console.log("jobj..."+jobj);
			str += "<input type = 'hidden' name = 'attach["+i+"].filename' value = '" + jobj.data("filename")+"'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
			str += "<input type = 'hidden' name = 'attach["+i+"].image' value = '" + jobj.data("type") + "'>";
		});
		formObj.append(str).submit();
	})
});
</script>
</body>
<jsp:include page="../footer.jsp"/>
</html>