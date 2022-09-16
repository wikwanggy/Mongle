/**
 * 
 */
$(document).ready(function(){
	//검색
	$("#searching").on("click",function(){
		//pageNum을 1로 초기화한 후
		$("input[name='pageNum']").val("1");
		//form태그를 submit
		$("#searchForm").submit();
	})
	//댓글
	var bnoval=$("input[name='bno']").val();
	
	list(bnoval);
	
	$("#replywrt").on("click",function(){
		var replyval=$("#comm_reply").val();
		var idval="qwer1234";
		
		replywrt({bno:bnoval,reply:replyval,id:idval});
	})
	$("#chat").on("click",".remove",function(){
		var rno=$(this).data("comm_rno");
		var result=confirm("삭제 후엔 복구할 수 없습니다. 정말 삭제하시겠습니까?");
		if(result){
			remove(rno);
		}
	})
})
function replywrt(comm_reply){
	console.log(comm_reply);
	$.ajax({ //ajax (비동기식 처리)
		type:"post", // method방식(get, post, put, delete)
		url:"/commreply/new", // controller의 value(url주소예시:/sample/getText)
		data:JSON.stringify(comm_reply),
		contentType:"application/json; charset=utf-8",
		//댓글이 정상적으로 처리되면 ajax의 success가 실행되면서 알림창 띄움
		success:function(result){
			if(result=="success"){
				//alert("작성 성공");
				location.reload();
			}
		}
	})
}
function list(bno){
	//alert(bno)
	//↓type=get, data=JSON
	$.getJSON("/commreplies/"+bno+".json", function(data){
		var str="";
		
		for(var i=0;i<data.length;i++){
			str+="<li>"
			str+=data[i].comm_id+"<span> | </span><span>"+data[i].comm_replydate+"</span><p><pre>"+data[i].comm_reply+"</pre></p>"
			//str+="<input type='button' class='modify' value='수정' data-rno="+data[i].comm_rno+">"
			str+="<input type='button' class='remove' value='삭제' data-rno="+data[i].comm_rno+">"
			str+="</li>"
		}
	$("#replyUL").html(str);
	})
}
function remove(comm_rno){
	$.ajax({
		type:"delete",
		url:"/commreplies/remove/"+comm_rno,
		success:function(result){
			if(result=="success"){
				//alert("삭제가 완료되었습니다.");
				location.reload();
			}
		}
	})
}