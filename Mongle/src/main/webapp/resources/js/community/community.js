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
		var replyval=$("#reply").val();
		var idval=$("input[name='sessionid']").val();
		
		if(replyval==''){
			alert("내용을 입력하세요.");
			return;
		}
		
		replywrt({bno:bnoval,reply:replyval,id:idval});
		
		console.log(replyval);
	})
	$("#chat").on("click",".remove",function(){
		var rno=$(this).data("rno");
		var result=confirm("삭제 후엔 복구할 수 없습니다. 정말 삭제하시겠습니까?");
		if(result){
			remove(rno);
		}
	})
	$("#chat").on("click",".update",function(){
		var rno=$(this).data("rno");
		var reply=$('#replycontent'+rno).val();
		var id=$(this).data("id");
		if(reply==''){
			alert("내용을 입력하세요.");
			return;
		}
		modify({rno:rno,reply:reply,id:id});
	})
	
	var textEle=$('textarea');
	textEle.on('keyup',function(){
		adjustHeight();
	})
	
	var malls=false;
	$(function(){
		malls=$("#type2").find("option[value!=0]");
		malls.detach();
		
		$("#type1").change(update_selected);
		$("#type1").trigger("change");
	})
	function update_selected() {
	  $("#type2").val(0);
	  $("#type2").find("option[value!=0]").detach();
	  
	  $("#type2").append(malls.filter(".select" + $(this).val()));
	}
})
function replywrt(reply){
	console.log(reply);
	$.ajax({ //ajax (비동기식 처리)
		type:"post", // method방식(get, post, put, delete)
		url:"/commreply/new", // controller의 value(url주소예시:/sample/getText)
		data:JSON.stringify(reply),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				//alert("작성 성공");
				location.reload();
			}
		}
	})
}
function updatebtn(rno, reply, id, replydate){
	console.log("aaa");
	var str="";
	str+="<textarea class='upload_form' id='replycontent'>"+reply+"</textarea>"
	str+="<input type='button' class='updatesuccess' data-rno='"+rno+"' data-reply='"+reply+"' value='저장'>"
	str+="<input type='button' class='updatesuccess' onclick='getreplylist()' value='취소'>"
	
}
function list(bno){
	//alert(bno)
	//↓type=get, data=JSON
	$.getJSON("/commreplies/"+bno+".json", function(data){
			var str="";
			var idval=$("input[name='sessionid']").val();
			/*var list=data.list;
			var pf=data.page;*/
			
			for(var i=0;i<data.length;i++){
				str+="<li>"
				str+=data[i].id+"<span> | </span><span>"+data[i].replydate+"</span>"
				
				if(data[i].id==idval||idval=='admin'){
					str+="<br>"
					str+="<textarea onkeyup='adjustHeight();' cols='115' id='replycontent"+data[i].rno+"'>"+data[i].reply+"</textarea><br>"
					str+="<input type='button' class='update' id='reply_btn' value='수정' data-rno='"+data[i].rno+"' data-reply='"+data[i].reply+"'>"
					str+="<input type='button' class='remove' id='reply_btn' value='삭제' data-rno='"+data[i].rno+"'>"
				}else{
					str+="<pre><span id='replycontent"+data[i].rno+"'>"+data[i].reply+"</span></pre>"
				}
				str+="</li>"
			}
			$("#replyUL").html(str);
	})
	
}

function remove(rno){
	$.ajax({
		type:"delete",
		url:"/commreplies/remove/"+rno,
		success:function(result){
			if(result=="success"){
				//alert("삭제가 완료되었습니다.");
				location.reload();
			}
		}
	})
}
function modify(reply){
	console.log(reply);
	$.ajax({
		type:"put",
		url:"/commreplies/modify",
		data:JSON.stringify(reply),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				location.reload();
			}
		}
	})
}
function adjustHeight(){
	var textEle=$('textarea');
	textEle[0].style.height='auto';
	var textEleHeight=textEle.prop('scrollHeight');
	textEle.css('height',textEleHeight);
}
