/**
 * 
 */

$(document).ready(function() {
	var str = "";
	var idresult = "";
	var passwordresult = "";
	var password2result = "";
	var nameresult = "";
	var emailresult = "";

	// 아이디 길이 체크

	$("#id").on("blur",function() {
		
		
		

		var idRegex = /^[a-z]+[a-z0-9-_]{5,20}$/g;
		var id=$("#id").val();
		// 아이디를 서버로전송 > DB 유효성검사 >결과반환
		// 아이디 중복 체크
		$.getJSON("/Signup/Signup/idcheck/"+id+".json",function(data){
			// select된 결과가 있으면 success로 인식
			console.log(data)
			$("#idalert").remove();
			
			str = "<span id='idalert'> 사용중입니다 </span>"
			
			$("#idbox").append(str);
			
			$("#idalert").css("color", "red").css("margin-left", "10px");

		}).fail(function(data){
			// select된 결과가 없으면 fail로 인식
			if(idRegex.test($("#id").val())) {
			$("#idalert").remove();
			
			str = "<span id='idalert'> 사용가능합니다  </span>"
			
			$("#idbox").append(str);
			
			$("#idalert").css("color", "green").css("margin-left", "10px");
			idresult = true;
		} else {
			
			$("#idalert").remove();
			str = "<span id='idalert'>아이디는 5자 이상, 20자 이하로 써주세요.</span>"
			$("#idbox").append(str);
			$("#idalert").css("color", "red").css("margin-left", "10px");
			idresult=false;
		}
		})
	})

	
	// 비밀번호 길이 체크
	$("#password").blur(function() {
		
		var pwreg =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
		
		if (pwreg.test(($("#password").val()))) {
			$("#passwordalert").remove();
			str = "<span id='passwordalert'>사용가능합니다 </span>"
			$("#passwordbox").append(str);
			$("#passwordalert").css("color", "green").css("margin-left", "10px");
			passwordresult = true;
		} else {
			$("#passwordalert").remove();
				str = "<span id='passwordalert'>비밀번호는 8자 이상, 20자 이하로 써주세요. </span>"
				$("#passwordbox").append(str);
				$("#passwordalert").css("color", "red").css("margin-left", "10px");
			passwordresult=false;
		}
	})
	
	// 비밀번호 일치 확인
	$("#password2").blur(function() {
		
		var password = $("#password").val();
		var password2 = $("#password2").val();
		if (password != password2) {
			$("#password2alert").remove();
			str = "<span id='password2alert'>비밀번호가 일치하지 않습니다. </span>"
			$("#passwordbox2").append(str);
			$("#password2alert").css("color", "red").css("margin-left", "10px");
			password2result=false;
		} else {
			$("#password2alert").remove();
			str = "<span id='password2alert'>  비밀번호가 일치합니다.</span>"
				$("#passwordbox2").append(str);
				$("#password2alert").css("color", "green").css("margin-left", "10px");
				
				password2result = true;
		}
	})
	
	// 생년월일
	$("#dd").blur(function() {
		var yy = $("#yy").val();
		var mm = $("#mm").val();
		var dd = Number($("#dd").val());

		// 일이  1~9일 경우 01~09로 더하기
		if (dd > 0 && dd < 10) {
			dd = "0"+dd;
		}
		
		var a = yy+mm+dd;
		
		$("#bth").val(a);
	})
	// name
	$("#name").blur(function(){
		
		
		var nameRegex =  /^[가-힣]{2,5}$/;
		
		if(nameRegex.test($("#name").val())){
			$("#namealert").remove();
			str="<span id='namealert'>사용가능합니다.</span>"
			$("#namebox").append(str);
			$("#namealert").css("color", "green").css("margin-left", "10px");
			nameresult = true;
		}else{
			$("#namealert").remove();
			str="<span id='namealert'>이름 형식에 맞게 입력해주세요.</span>"
			$("#namebox").append(str);
			$("#namealert").css("color", "red").css("margin-left", "10px");
			nameresult=false;
		}
	})
	// email
	$("#email").blur(function(){

		var emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		
		if(emailRegex.test($("#email").val())){
			$("#emailalert").remove();
			str="<span id='emailalert'>사용가능합니다.</span>"
			$("#emailbox").append(str);
			$("#emailalert").css("color", "green").css("margin-left", "10px");
			emailresult = true;
		}else{
			$("#emailalert").remove();
			str="<span id='emailalert'>이메일 형식에 맞게 입력해주세요.</span>"
			$("#emailbox").append(str);
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			emailresult=false;
		}
	})

	
	// 필요한 데이터가 전부 입력되었다면 submit을 진행한다//
	$("form").on("submit", function() {

		if(idresult == true && passwordresult == true && password2result == true && nameresult == true && emailresult == true){
			alert("회원가입을 축하합니다.");
		}else{
			alert("다시 확인해주세요.");
		}
	
	})

});