<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- service detail 과 html 동일 함으로 css 그대로 연결 -->
<link rel="stylesheet" href="..\..\resources\css\service\servicedetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/service/serviceUploadAjax.js"></script>
<script type="text/javascript" src="/resources/js/service/tab.js"></script>
</head>
			<%--상단 시작 --%>							
				<jsp:include page="../header.jsp"></jsp:include>
			<%--상단 끝 --%>
		<%--본문 넣을 자리 --%>
		<div id="service_main">
				<%-- 왼쪽 사이드바 시작--%>
					<jsp:include page="../include/serviceinclude.jsp"></jsp:include>
				<%-- 왼쪽 사이드바 끝 --%>
			<%-- 본문  div --%>
			<div id="service_main_center">
			<div id="service_main_page">
					<form method="POST" role="form" action="/service/modify">
					<table>
						<tr>
							<td>
								<input class="bkind_detail_button" id="uploadBtn" type="submit" value="수정 완료" style="cursor: pointer" onclick="alert('글수정완료')" formaction="/service/modify">
							</td>
						</tr>
						<tr>
							<td class="service_sub_font">제목</td>
						</tr>
							
						<tr>
							<td><input class="service_sub_font" type="text" name="title" value="${detail.title }" ></td>
							<td><input type="hidden" name="bgno" value="${detail.bgno}"></td>
							<td><input type="hidden" name="bno" value="${detail.bno}"></td>
							<td><input type="hidden" name="id" value="${detail.id}"></td>
						</tr>
						
						<tr>
							<td class="service_sub_font">내용</td>
						</tr>
						
						<tr>
							<td><textarea id="service_sub_content" class="service_sub_font" name="content" cols="50" rows="10"  >${detail.content }</textarea></td>
						</tr>

						
					</table>
					</form>
							<div id="uploaddiv"><input type="file" name="uploadFile" multiple>첨부파일</div>			
							<div id="uploadResult">
								<ul>
			
								</ul>
							</div>
				</div>
			</div>
		</div>	
		<script type="text/javascript">
		$(document).ready(function(){
			//파일 보여주는 파트
			(function(){
				var bno=$("input[name='bno']").val();
				$.getJSON("/filelist",{bno:bno},function(filelist){
					console.log(filelist);
					
					var str="";
					$(filelist).each(function(i,file){
					//image type
					if(file.image){
						var filePath=encodeURIComponent(file.uploadPath+"/s_"+file.uuid+"_"+file.fileName);
						str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'><div>";
						str+="<img src='/servicedisplay?fileName="+filePath+"'>";
						str+="<span>"+file.fileName+"</span>";
						str+="<button data-file=\'"+ filePath+"\' data-type='image'>삭제</button></div></li>";
					}else{
						//var filePath=encodeURIComponent(obj.uploadPath+"/"+file.uuid+"_"+file.fileName)
						//var fileLink = filePath.replace(new RegExp(/\\/g), "/");
						
						str+="<li data-path='"+file.uploadPath+"' data-uuid='"+file.uuid+"' data-fileName='"+file.fileName+"' data-type='"+file.image+"'>"
						str+= "<a href='/servicedownload?fileName="+filePath+"'>"+file.fileName+"</a>"
						str+="<span>"+file.fileName+"</span>";
						str+="<button data-file=\'"+ filePath+"\' data-type='image'>삭제</button></div></li>";
					}
				});
				$("#uploadResult ul").html(str);
			}); // end getJson
			})();
			
			var formObj = $("form");
			$('#uploadBtn').on("click", function(e){
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
				
				if(oparation === 'modify'){
					console.log("submit clicked");
				}					$("#uploadResult ul li").each(function(i,file){
					var jfile=$(file);
					console.log(jfile.data);
					
					str += "<input type = 'hidden' name = 'svfile["+i+"].fileName' value = '" + jfile.data("filename")+"'>";
					str += "<input type = 'hidden' name = 'svfile["+i+"].uuid' value = '" + jfile.data("uuid") + "'>";
					str += "<input type = 'hidden' name = 'svfile["+i+"].uploadPath' value = '" + jfile.data("path") + "'>";
					str += "<input type = 'hidden' name = 'svfile["+i+"].image' value = '" + jfile.data("type") + "'>";
				});
				formObj.append(str).submit();
			})	
			
		});
		</script>
		<%--본문 넣을 자리 --%>
			<%--하단 시작 --%>							
				<jsp:include page="../footer.jsp"></jsp:include>
			<%--하단 끝 --%>
</html>