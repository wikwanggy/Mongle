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
<script type="text/javascript" src="../resources/js/community/community.js"></script>
<link rel="stylesheet" href="../resources/css/main.css">
</head>
<jsp:include page="../header.jsp"/>
<body>
<div class="board_l">
	<div style="margin-left:40px;">
		<b><a href="http://localhost:8080/community/list" class="rv_b">커뮤니티</a></b>
	</div>
<c:choose>
	<c:when test="${sessionScope.login!=null}">
<form id="form" method="post" role="form">
	<table border="1" class="board_write">
		<tr>
			<td><input type="hidden" name="id" value="${sessionScope.login.id}"><input hidden="hidden">
			<input type="text" placeholder="제목" class="board_write_title" name="title" id="title"></td>
		</tr>
		<tr>
			<td><textarea cols="115" rows="30" placeholder="내용" name="content"></textarea></td>
		</tr>
		<tr>
			<td><div id="uploaddiv"><input type="file" name="uploadFile" multiple></div>
				<div id="uploadResult" style="width:100%">
					<ul>
					
					</ul>
				</div>
			</td>
		</tr>
		
				<tr>
					<td>
						<input type="button" value="올리기" id="uploadbtn" class="btn_board">
					</td>
				</tr>
	</table>
</form>
	</c:when>
	<c:otherwise>
		<div style="width:300px; height:100px; margin:auto; outline:solid 3px #FFEB62; text-align:center; border-radius:10px; padding:25px;">
			<span>글쓰기는 로그인 이후에 가능합니다.</span><br>
			<span><a href="http://localhost:8080/Login/login" style="text-decoration: underline; color:blue;">로그인</a> 또는
			<a href="http://localhost:8080/Signup/Signup" style="text-decoration: underline; color:blue;">회원가입</a> 하러가기</span>
		</div>
	</c:otherwise>
</c:choose>
</div>
<script>

	$(document).ready(function(){
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
		var CloneObj=$("#uploaddiv").clone();
		$("input[type='file']").change(function(e){
			var formData=new FormData();
			var inputFile=$("input[name='uploadFile']");
			var files=inputFile[0].files;
			console.log(files);
			for(var i=0;i<files.length;i++){
				if(!checkExtension(files[i].name,files[i].size)){
					return false;
				}
				formData.append("uploadFile",files[i]);
			}
			$.ajax({
				url:"/ComuploadAjaxAction",
				processData:false,
				contentType:false,
				data:formData,
				type:'POST',
				dataType:'json',
				success:function(result){
					console.log(result);
					$("#uploaddiv").html(CloneObj.html());
					showComloadResult(result);
				}
			})
		})
		
		var uploadResult=$('#uploadResult ul');
		var CformObj=$("form[role='form']");
		$("#uploadbtn").on("click",function(e){
			e.preventDefault();
			console.log("btnn");
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
				console.log(jobj);
				str += "<input type = 'hidden' name = 'attach["+i+"].filename' value = '" + jobj.data("filename")+"'>";
				str += "<input type = 'hidden' name = 'attach["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
				str += "<input type = 'hidden' name = 'attach["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
				str += "<input type = 'hidden' name = 'attach["+i+"].image' value = '" + jobj.data("type") + "'>";
			})
			CformObj.append(str).submit();
		})
		$("#uploadResult").on("click","button",function(e){
			console.log("deletefile");
			var targetFile=$(this).data("file");
			var type=$(this).data("type");
			var targetLi=$(this).closest("li");
			console.log(targetFile);
			$.ajax({
				url:'/comdeleteFile',
				data:{filename:targetFile,type:type},
				dataType:'text',
				type:'POST',
				success:function(result){
					alert(result);
					targetLi.remove();
				}
			})
		})
	});
</script>
</body>
<jsp:include page="../footer.jsp"/>
</html>