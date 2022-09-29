$(document).ready(function() {
	var likeval = $("#like").val();
	var bno = $("#bno").val();
	var id = $("#id").val();
	console.log("like:"+likeval+",bno:"+bno+",id:"+id);

	if (likeval > 0) {
		console.log(likeval + "좋아요 누름");
		$('.LikeBtn').attr("value", "♥");
		$(".LikeBtn").on("click", function() {

			$.ajax({
				type : 'post',
				url : '/likeDown',
				contentType : 'application/json',
				data : JSON.stringify({
					"bno" : bno,
					"id" : id
				}),
				success : function(data) {
					alert('취소 성공');
				}
			})// 아작스 끝
		})

	} else if (likeval == 0) {
		console.log(likeval + "좋아요 안누름")
		$('.LikeBtn').on("click", function() {
			$.ajax({
				type : 'post',
				url : '/likeUp',
				contentType : 'application/json',
				data : JSON.stringify({
					"bno" : bno,
					"id" : id
				}),
				success : function(data) {
					alert('성공');
				}
			})// 아작스 끝
		})
	}
})