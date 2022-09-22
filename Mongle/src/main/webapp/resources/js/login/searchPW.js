/**
 * 
 */
$(document).ready(function(){
	$("#searchpwcheck").submit(function() {
		event.preventDefault();
		
		var id=$("#id").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var number=$("#number").val();
		var check = false;
		
		// 이름이 공백이라면 false
		if (id == "") {
			alert("id를 입력해주세요.");
			$("#id").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else if (name == "") {
			alert("이름을 입력해주세요");
			$("#name").focus();
		
		// 비밀번호가 공백이라면 false
		} else if (email == "") {
			alert("email을 입력해주세요.");
			$("#email").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else if (number == "") {
			alert("전화번호를 000-0000-0000식으로 입력해주세요.");
			$("#number").focus();
		
		// 어느쪽에도 해당되지 않는다면 아래의 ajax를 실행한다.
		}else {
			console.log(name)
			$.getJSON("/Login/searchpwcheck/"+id+"/"+encodeURIComponent(name)+"/"+email+"/"+number+".json",function(result){
				console.log(result.pw)
				alert("찾으시는 pw는"+result.pw+"입니다 ")
			})
		}
		//return check;
	})

})