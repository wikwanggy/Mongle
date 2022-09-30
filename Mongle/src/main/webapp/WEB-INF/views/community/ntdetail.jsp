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
<div class="commu_top">
		<ul>
			<li><a href="http://localhost:8080/community/list">커뮤니티</a></li>
			<li><a href="http://localhost:8080/community/review">사용후기</a></li>
			<li><a href="http://localhost:8080/community/notice"><b>공지사항</b></a></li>
		</ul>
	</div>
<div id="detail_all">

<div class="board_l">
	<div style="margin-left:40px;">
		<b class="rv_b">공지사항/펫티켓</b>
	</div>
<form method="post">
	<table border="1" id="notice_detail">
		<tr>
			<td style="width:75px; text-align:center;">${ntdetail.bno}</td>
			<td style="height:25px;">
				<input type="hidden" name="bno" value="${ntdetail.bno}"><input type="hidden" name="id" value="${ntdetail.id}">
				${ntdetail.title}
			</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${ntdetail.content}</pre>
			<div class="row">
				<div class="ntuploadResult">
					<ul>
					
					</ul>
				</div>
			</div>
			</td>
		</tr>
		<c:choose>
			<c:when test="${sessionScope.login.id=='admin'}">
				<tr>
					<td colspan="2" id="btn_board_detail">
					<input type="submit" value="삭제" class="btn_board" formaction="ntdelete" onclick="return confirm('삭제 후엔 복구할 수 없습니다. 정말 삭제하시겠습니까?')">
					<input type="submit" value="수정" class="btn_board" formaction="ntdetailmd?bno=${ntdetail.bno}">
					</td>
				</tr>
			</c:when>
		</c:choose>
	</table>
</form>
<div class="tolist"><a href="http://localhost:8080/community/notice">목록</a></div>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
	(function(){
		var bno = $("input[name='bno']").val();
		$.getJSON("/community/ntlist", {bno:bno}, function(arr){
			console.log(arr);
			var str="";
			$(arr).each(function(i,attach){
				if(attach.image){
					var fileCellPath=encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.filename);
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<img src='ntdisplay?filename="+fileCellPath+"'></div></li>"
				}else{
					str+="<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.filename+"' data-type='"+attach.image+"'><div>"
					str+="<div style='text-decoration:underline;'><span>"+attach.filename+"</span><img src='../resources/image/paper-clip.png'></div>"
					str+="</div></li>"
				}
			})
			$(".ntuploadResult ul").html(str);
		});
	})();
});
</script>
</body>
<jsp:include page="../footer.jsp"/>
</html>