/**
 * 
 */

$(document).ready(function() {
	var namecheckresult="";
	var emailcheckresult="";
	var bthcheckresult="";
	var numbercheckresult="";



	// name
	$("#name").blur(function(){
		$.getJSON("/Signup/Signup/namecheck/"+name+".json",function(data){
		
			namecheckresult=false;
	}).fail(function(data){
		namecheckresult=true;
	})
	})
	//생년월일
	$("#bth").blur(function(){
		$.getJSON("/Signup/Signup/bthcheck/"+bth+".json",function(data){
		
			bthcheckresult=false;
	}).fail(function(data){
		bthcheckresult=true;
	})
	})
	// email
	$("#email").blur(function(){

		
		var email=$("#email").val();
		
		$.getJSON("/Signup/Signup/emailcheck/"+email+".json",function(data){
			
			 idcheckresult= false;
				
		}).fail(function(data){// select된 결과가 없으면 fail로 인식
			
			idcheckresule=true;
		})
	})
	
	// 전화번호
	$("#number").blur(function(){
		$.getJSON("/Signup/Signup/numbercheck/"+number+".json",function(data){
			
			 numbercheckresult= false;
				
		}).fail(function(data){// select된 결과가 없으면 fail로 인식
			
			numbercheckresule=true;
		})
	
	})
	
	// 필요한 데이터가 전부 입력되었다면 submit을 진행한다//
	$("form").on("submit", function() {
		if(namecheckresult=false && emailcheckresult==false && bthcheckresult==false &&numbercheckresult== false){
			
			
		
		}else if( idcheckresult== true){
			alert("없는 id 입니다.")
			return false;
		}else if(emailcheckresult==true){
			alert("없는 email 입니다.")
			return false;
		}else{
			
			return false;
		}
	
	})

});