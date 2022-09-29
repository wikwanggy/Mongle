$(document).ready(function() {
	// detail.jsp가 시작되자마자 bno값을 가져오려면 $(document).ready(function()아래에 선언
	var bnoValue = $("input[name='bno']").val();
	// detail.jsp가 시작되자마자 댓글목록리스트 함수를 호출
	list(bnoValue);

	// 댓글쓰기버튼을 클릭하면
	$('#add').on('click', function() {
		// 댓글쓰기 버튼을 클릭했을 당시에 댓글 내용을 가져오려면 $('#add').on('click',function() 아래에 선언
		var replyValue = $("#reply").val();
		var idValue = $("#idValue").val();
		add({
			bno : bnoValue,
			reply : replyValue,
			id : idValue
		}); // 댓글쓰기를 하기위한 함수 호출
	})
	// 댓글 수정 버튼을 클릭하면
	$("#chat").on("click", ".update", function() {
		// 댓글번호와 댓글내용을 수집해서
		var rno = $(this).data("rno");
		var reply = $('#replycontent' + rno).val();
		// 댓글 수정 함수 호출(댓글번호,댓글내용)
		modify({
			rno : rno,
			reply : reply
		});
	})

	// 댓글 삭제 버튼을 클릭하면
	$("#chat").on("click",".remove",function(){
		// 댓글 번호를 수집해서
		var rno = $(this).data("rno");
		//댓글 삭제 함수 호출(댓글번호)
		remove(rno);
	})
})
// 댓글 삭제 함수 선언
function remove(rno){
	console.log(rno);
	$.ajax({
		type : "delete", // method방식(get,post,put,delete)
		url : "/placereplies/remove/"+rno,
		success : function(result) {
			if (result == "success") {
				alert("댓글삭제성공")
			}
		}
	})
}
// 댓글 수정 함수 선언
function modify(reply) {
//	console.log(reply);
	$.ajax({ // ajax준비 (비동기식으로처리)
		type : "put", // method방식(get,post,put,delete)
		url : "/placereplies/modify",
		data : JSON.stringify(reply),
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			if (result == "success") {
				alert("댓글수정성공")
			}
		}
	})
}

function list(bno) { // list함수선언시작
	$.getJSON(
			"/placereplies/" + bno + ".json",
			function(data) {
				var str = "";
				for (var i = 0; i < data.length; i++) {
		str += "</li>"
		str += "<li>id : " + data[i].id + "</li>"
		str += "<li>rno : " + data[i].rno + "</li>"
		str += "<li><textarea id='replycontent"+ data[i].rno + "'>" + data[i].reply+ "</textarea></li>"
		str += "<li>"
		str += "<input class='update' type='button' value='수정' data-rno="+ data[i].rno + " data-reply=" + data[i].reply + ">"
		str += "<input class='remove' type='button' value='삭제' data-rno="+ data[i].rno + " data-reply=" + data[i].reply + ">"
		str += "</li>"
					}
					$("#replyUL").html(str);
					});
} // list함수선언끝

// 댓글쓰기를 하기위한 함수선언
function add(reply) { // add함수선언시작
	$.ajax({ // ajax준비 (비동기식으로처리)
		type : "post", // method방식(get,post,put,delete)
		url : "/placereplies/new", // controller와 연결하기위한 주소
		data : JSON.stringify(reply),
		// contentType을 생략하면 web Browser한테 위임
		contentType : "application/json; charset=utf-8",
		success : function(result) {
			if (result == "success") {
				alert("댓글쓰기성공")
			}
		}
	})
} // add함수선언끝

