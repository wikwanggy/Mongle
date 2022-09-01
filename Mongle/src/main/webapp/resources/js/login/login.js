/**
 * 
 */
//
$(document).ready(function(){
	$("#login").submit(function() {
		//event.preventDefault();
		
		
		var id = $("#id").val();
		var password = $("#password").val();
		var check = false;
		
		// 아이디가 공백이라면 false
		if (id == "") {
			alert("아이디를 입력해주세요.");
			$("#id").focus();
		
		// 비밀번호가 공백이라면 false
		} else if (password == "") {
			alert("비밀번호를 입력해주세요.");
			$("#pw").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		} else {
			s$.ajax ({
				type : "POST",
				url : "/Login/logincheck",
				data : JSON.stringify ({id:id, password:password}),
				contentType : "application/json; charset=utf-8",
				async : false,
				success:function(result) {
					if(result == "success") {
						check = true;
					}
				},
				error:function() {
					alert("아이디 혹은 비밀번호가 존재하지 않거나 잘못되었습니다.")
					check = false;
				}
			}) // ajax 끝
		}
		
		return check;
	})

})