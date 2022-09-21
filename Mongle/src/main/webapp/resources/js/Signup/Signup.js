/**
 * 
 */

$(document).ready(function() {
	var str = "";
	var idresult = "";
	var idcheckresult="";
	var passwordresult = "";
	var password2result = "";
	var nameresult = "";
	var emailresult = "";
	var emailcheckresult="";
	var addrresult = "";
	var numberresult="";
	// 아이디 길이 체크

	$("#id").on("blur",function() {
		
		
		

		var idRegex = /^[a-z]+[a-z0-9-_]{4,20}$/g;
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
			idcheckresult= false;
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
		
		var pwreg =/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{7,20}$/;
		
		if (pwreg.test(($("#password").val()))) {
			$("#passwordalert").remove();
			str = "<span id='passwordalert'>사용가능합니다 </span>"
			$("#passwordbox").append(str);
			$("#passwordalert").css("color", "green").css("margin-left", "10px");
			passwordresult = true;
		} else {
			$("#passwordalert").remove();
				str = "<span id='passwordalert'>비밀번호는 대.소문자,숫자로 8자~20자이하로 써주세요. </span>"
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
		$(document).on("keyup","input[name=bth_yy]",function(){
		var val= $(this).val();
		 
		if(val.replace(/[0-9]/g, "").length > 0) {
		        alert("숫자만 입력해 주십시오.");
		        $(this).val('');
		    }

		    if(val >2022) {
		        alert("2022년까지만 입력해 주십시오.");
		        $(this).val('');
		    }
	})
	$(document).on("keyup","input[name=bth_dd]",function(){
		var val= $(this).val();
		 
		if(val.replace(/[0-9]/g, "").length > 0) {
		        alert("숫자만 입력해 주십시오.");
		        $(this).val('');
		    }

		    if(val < 1 || val > 31) {
		    	$(this).val('');
		    	 alert("1일~31일 로 입력해 주십시오.");
		    }
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
		var email=$("#email").val();
		
		$.getJSON("/Signup/Signup/emailcheck/"+email+".json",function(data){
			// select된 결과가 있으면 success로 인식
			console.log(data)
			$("#emailalert").remove();
			
			str = "<span id='emailalert'> 사용중입니다 </span>"
			
			$("#emailbox").append(str);
			
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			
			 idcheckresult= false;
				
		}).fail(function(data){// select된 결과가 없으면 fail로 인식
			if(emailRegex.test($("#email").val())){
				$("#emailalert").remove();
				
				str="<span id='emailalert'>사용가능합니다.</span>"
				
				$("#emailbox").append(str);
				
				$("#emailalert").css("color", "green").css("margin-left", "10px");
				
				emailresult = true;
		} else {
			
			$("#emailalert").remove();
			str="<span id='emailalert'>이메일 형식에 맞게 입력해주세요.</span>"
			$("#emailbox").append(str);
			$("#emailalert").css("color", "red").css("margin-left", "10px");
			emailresult=false;
		}
		})
	})
	$("#searchaddr").on("click",function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('addr_post').value = data.zonecode;
	            if(roadAddr !== ''){
	                document.getElementById("member_addr").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("member_addr").value = jibunAddr;
	            }
	        }
	    }).open();
	})
	$("#detail_addr").blur(function() {
		var ma = $("#member_addr").val();
		var da = $("#detail_addr").val();
		var ap = $("#addr_post").val();
		
		var a = ma+","+da+",'우편번호'"+ap;
		
		$("#addr").val(a);
	})
	// 전화번호
	$("#number").blur(function(){
		
		
		var numberRegex =  /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
		
		if(numberRegex.test($("#number").val())){
			$("#numberalert").remove();
			str="<span id='numberalert'>사용가능합니다.</span>"
			$("#numberbox").append(str);
			$("#numberalert").css("color", "green").css("margin-left", "10px");
			numberresult = true;
		}else{
			$("#numberalert").remove();
			str="<span id='numberalert'>숫자, -을 포함해 휴대전화 형식에 맞게 입력해주세요</span>"
			$("#numberbox").append(str);
			$("#numberalert").css("color", "red").css("margin-left", "10px");
			numberresult=false;
		}
	})
	
	// 필요한 데이터가 전부 입력되었다면 submit을 진행한다//
	$("form").on("submit", function() {

		if(idresult == true && passwordresult == true && password2result == true && nameresult == true && emailresult == true){
			alert("회원가입을 축하합니다.");
		}else if( idcheckresult== false){
			alert("id가 중복되었습니다")
			return false;
		}else if(emailcheckresult==false){
			alert("email이 중복되었습니다")
			return false;
		}else{
			alert("다시 확인해 주세요.");
			return false;
		}
	
	})

});