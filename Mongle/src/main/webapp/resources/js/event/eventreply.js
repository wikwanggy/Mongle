/**
 * 
 */

$(document).ready(function(){//jquery 준비...
	//함수 호출
	//event1~n.jsp가 시작되자마자 bno값을 가져올려면 $(document).ready 아래에 선언
	var bnoValue=$("input[name='bno']").val();
	//eventl~n.jsp가 시작되자마자 댓글목록리스트(list) 함수를 호출
	
	//댓글 쓰기버튼을 클릭하면
	$("#add").on("click",function(){
		
		//댓글쓰기 버튼을 클릭했을 당시에 댓글내용을 가져오려면 $("#event-reply-add").on("click",function(){
		var replyValue=$("#reply").val();
		var idValue="abcd1";
		//댓글쓰기를 하기 위한 함수 호출
		add({bno:bnoValue,reply:replyValue,id:idValue});//댓글쓰기를 하기 위한 함수 호출
		
	})
})//jquery 끝

	//함수선언
	//(댓글 쓰기를 하기위한 함수선언)
	function add(reply) { //event-reply-add함수 선언 시작
		$.ajax({	//ajax 준비...(비동기식으로 처리)
			type:"post", 	//method(get,post,put,delete)
			url:"/replies/new",	
			data:JSON.stringify(reply),
			//contentType:ajax->controller로 데이터 전송  시 타입
			//(contentType을 생략하면 web Brower한테 위임)
			contentType:"application/json; charset=utf-8",
			success:function(result){
			if(result=="success") {
				alert("댓글쓰기성공");
			}
		}
	})
}