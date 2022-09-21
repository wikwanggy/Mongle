/**
 * 
 */

$(document).ready(function(){
	$("#searchidcheck").submit(function() {
		//event.preventDefault();
		
		var name = $("#name").val();
		var email = $("#eamil").val();
		var bth=$("#bth").val();
		var number=$("#number").val();
		var check = false;
		
		// 이름이 공백이라면 false
		if (name == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
		
		// 비밀번호가 공백이라면 false
		} else if (email == "") {
			alert("email을 입력해주세요.");
			$("#email").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else if (bth == "") {
			alert("생년월일을 yyyy-mm-dd로 입력해주세요.");
			$("#bth").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else if (number == "") {
			alert("전화번호를 000-0000-0000식으로 입력해주세요.");
			$("#number").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else {
			
			$.ajax ({
				type : "POST",
				url : "/Login/searchidcheck",
				data : JSON.stringify ({name:name, email:email,bth:bth,number:number}),
				contentType : "application/json; charset=utf-8",
				async : false,
				success:function(result) {
					console("result")
					if(result == "success") {
						alert("찾으시는 id는'ㅁㄴㅇㄴㅁㅇ'입니다 ")
						check = true;
					}
				},
				error:function() {
					alert("없는 정보입니다.")
					check = false;
				}
			}) // ajax 끝
		}
		return check;
	})

})