/**
 * 
 */
/*
 * function setCookie(cookieName, value, exdays) { var exdate = new Date();
 * exdate.setDate(exdate.getDate()+exdays); var cookieValue = excape(value) +
 * ((exdays==null)?"":"; expires=" + exdate.toGMTString()); document.cookie =
 * cookieName + "=" + cookieValue; } function deleteCookie(cookieName) { var
 * expireDate = new Date(); expireDate.setDate(expireDate.getDate() - 1);
 * document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString(); }
 * function getCookie(cookieName) { cookieName = cookieName + '='; var
 * cookieData = document.cookie; var start = cookieData.indexOf(cookieName); var
 * cookieValue = ''; if (start != -1) { start += cookieName.length; var end =
 * cookieData.indexOf(';', start); if (end == -1) end = cookieData.length;
 * cookieValue = cookieData.substring(start, end); } return
 * unescape(cookieValue); } $(document).redy(function() { // id 쿠키 저장 var
 * userInputId=getCookie("userInputId"); $("input[name='id']").val(userInputId);
 * 
 * if($("input[name='id']").val()!=""){ $("#idSaveCheck").attr("checked", true);
 *  $("#pwdSaveCheck").removeAttr("disabled");         }                
 * $("#idSaveCheck").change(function(){   
 * if($("#idSaveCheck").is(":checked")){       //
 * id 저장 클릭시 pwd 저장 체크박스 활성화      
 *  $("#pwdSaveCheck").removeAttr("disabled");       
 *  $("#pwdSaveCheck").removeClass('no_act');  
 * var userInputId = $("input[name='id']").val();           
 * setCookie("userInputId", userInputId, 365);    }else{                
 *  deleteCookie("userInputId");         
 *  $("#pwdSaveCheck").attr("checked", false);   
 *  deleteCookie("userInputPwd");               
 *  $("#pwdSaveCheck").attr("disabled", true);   
 *  $("#pwdSaveCheck").addClass('no_act');    }         });                     
 *   $("input[name='id']").keyup(function(){  
 * if($("#idSaveCheck").is(":checked")){        
 * var userInputId = $("input[name='id']").val();                
 * setCookie("userInputId", userInputId, 365); }   });                 //
 * Pwd 쿠키 저장          var userInputPwd = getCookie("userInputPwd");
 *         $("input[name='password']").val(userInputPwd);     
 * if($("input[name='password']").val() != ""){ 
 * $("#pwdSaveCheck").attr("checked", true); 
 * $("#pwdSaveCheck").removeClass('no_act');         }  
 * $("#pwdSaveCheck").change(function(){ 
 * if($("#pwdSaveCheck").is(":checked")){     
 * var userInputPwd = $("input[name='password']").val();   
 * setCookie("userInputPwd", userInputPwd, 365);  }else{          
 *        deleteCookie("userInputPwd");        }       });
 * $("input[name='password']").keyup(function(){
 *  if($("#pwdSaveCheck").is(":checked")){      
 * var userInputPwd = $("input[name='pwssword']").val();   
 * setCookie("userInputPwd", userInputPwd, 365);       }      });  });
 */
$(function(){//  쿠키값을 가져온다.
	var cookie_user_id = getLogin();
	/** * 쿠키값이 존재하면 id에 쿠키에서 가져온 id를 할당한 뒤* 체크박스를 체크상태로 변경 */
	if(cookie_user_id != "") {
		$("#id").val(cookie_user_id);$("#cb_saveId").attr("checked", true);}
	// 아이디 저장 체크시
	$("#cb_saveId").on("click", function(){
		var _this = this;var isRemember;	
		if($(_this).is(":checked")) {
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");
			if(!isRemember)    
			$(_this).attr("checked", false);
			}});
	// 로그인 버튼 클릭시
	$("#btn_login").on("click", function(){
		if($("#cb_saveId").is(":checked")){
// 저장 체크시
	saveLogin($("#virtual_id").val());}else{
		 // 체크 해제시는 공백
		saveLogin("");
		}});
	});/**
		 * * saveLogin* 로그인 정보 저장*
		 * 
		 * @param id
		 */
function saveLogin(id) {
	if(id != "") {
		// userid 쿠키에 id 값을 7일간 저장
		setSave("id", id, 7);
		}else{
			// userid 쿠키 삭제
			setSave("id", id, -1);}}
/**
 * * setSave* Cookie에 user_id를 저장*
 * 
 * @param name*
 * @param value*
 * @param expiredays
 */
function setSave(name, value, expiredays) {	
	var today = new Date();	
	today.setDate( today.getDate() + expiredays );	
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"}
/**
 * * getLogin* 쿠키값을 가져온다.*
 * 
 * @returns {String}
 */
function getLogin() {
	// userid 쿠키에서 id 값을 가져온다.
	var cook = document.cookie + ";";
	var idx = cook.indexOf("userid", 0);
	var val = "";
	if(idx != -1) {
		cook = cook.substring(idx, cook.length);
		begin = cook.indexOf("=", 0) + 1;
		end = cook.indexOf(";", begin);
		val = unescape(cook.substring(begin, end));
		}
	return val;
	}



