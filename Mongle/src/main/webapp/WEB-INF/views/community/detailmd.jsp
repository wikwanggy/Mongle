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
<c:choose>
	<c:when test="${sessionScope.login.id==detailmd.id||sessionScope.login.id=='admin'}">
		<form method="post" enctype = "multipart/form-data" role="form" action="update">
			<div class="board_l"><table border="1" id="board_detail">
				<tr>
					<td colspan="2" style="height:25px;">
						<input type="hidden" name="id" value="${detailmd.id}">
						<input type="hidden" name="bno" value="${detailmd.bno}">
						<input type="text" name="title" class="board_write_title" value="${detailmd.title}">
					</td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="115" rows="30" name="content">${detailmd.content}</textarea></td>
				</tr>
				<tr>
					<td><input type="file" name="uploadFile" multiple>
						<div id="uploadResult">
							<ul>
								
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td id="btn_board_detail">
					<input type="button" value="수정 완료" id="comuploadbtn" class="btn_board">
					</td>
				</tr>
			</table></div>
		</form>
	</c:when>
	<c:otherwise>
		<div style="width:300px; height:100px; margin:auto; outline:solid 3px #FFEB62; text-align:center; border-radius:10px; padding:25px;">
			<span>수정은 로그인 이후에 가능합니다.</span><br>
			<span><a href="http://localhost:8080/Login/login" style="text-decoration: underline; color:blue;">로그인</a> 또는
			<a href="http://localhost:8080/Signup/Signup" style="text-decoration: underline; color:blue;">회원가입</a> 하러가기</span>
		</div>
	</c:otherwise>
</c:choose>
<script>
function showComloadResult(Arr){
	if(!Arr||Arr.length==0){return;}
	var uploadUL=$("#uploadResult ul");
	var str= "";
	$(Arr).each(function(i,obj){
		if(obj.image){
			var fileCellPath=encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.filename);
			
			str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.image+"'><div>"
			str+="<span>"+obj.filename+"</span>"
			str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='image'><i class='i'>X</i></button><br>"
			str+="<img src='comdisplay?filename="+fileCellPath+"'></div></li>"
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
	(function(){
		var bno = $("input[name='bno']").val();
		$.getJSON("/community/uplist", {bno:bno}, function(arr){
			console.log(arr);
			var str="";
			$(arr).each(function(i,attach){
				if(attach.image){
					var fileCellPath=encodeURIComponent(attach.uploadPath+"/s_"+attach.uuid+"_"+attach.filename);
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<span>"+attach.filename+"</span>"
					str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='image'><i class='i'>X</i></button><br>"
					str+="<img src='comdisplay?filename="+fileCellPath+"'></div></li>"
				}else{
					var fileCellPath=encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.filename)
					//var fileLink=fileCellPath.replace(new RegExp(/\\/g),"/");
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<div style='text-decoration:underline;'>"+attach.filename+"<img src='../resources/image/paper-clip.png'></div>"
					str+="<button type='button' class='x' data-file=\'"+fileCellPath+"\' data-type='file'><i class='i'>X</i></button><br>"
					str+="</div></li>"
				}
			});
			$("#uploadResult ul").html(str);
		});
	})();
	$("#uploadResult").on("click","button",function(e){
		console.log('delete file');
		if(confirm("파일을 삭제하시겠습니까?")){
			var targetLi=$(this).closest("li");
			targetLi.remove();
		}
	})
	var reg=new RegExp("(.*?)\.(exe|sh|js|alz|zip)$");
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
	$("input[name='uploadFile']").change(function(e){
		var formData=new FormData();
		var inputFile=$("input[name='uploadFile']");
		console.log(inputFile);
		var files=inputFile[0].files;
		console.log(files);
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		$.ajax({
			url:'/ComuploadAjaxAction',
			processData:false,
			contentType:false,
			data:formData,
			type:"POST",
			dataType:'json',
			success:function(result){
				console.log(result);
				showComloadResult(result);
			}
		});
	});
	var formObj=$("form[role='form']");
	$("#comuploadbtn").on("click",function(e){
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
		$("#uploadResult ul li").each(function(i,obj){
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