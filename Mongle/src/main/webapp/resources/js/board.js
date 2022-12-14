/**
 * 상품 등록 js
 */
$(document).ready(function() {
	// 첨부파일 공격에 대비하기 위한 업포드 파일 확장자 제한.((.exe .zip .aiz, 특정 크기 이상 파일) = 첨부x)
	// 함수 선언
	// 정규식을 이용하여 확장자 제한
	var reg = new RegExp("(.*?)\.(exe|zip|alz)$")
	// 최대크기를 설정하여 그 이상이면 제한
	var maxSize = 5242880; // 5MB
	// 파일이름, 파일 크기
	function checkExtension(filename, fileSize) {
		// 파일크기 제한
		// 실제파일의 크기 > 최대 크기
		if (fileSize > maxSize) {
			alert("파일 사이즈 초과")
			return false;
		}
		// 확장자 제한
		// 실제파일명의 확장자와 정규식 비교
		if (reg.test(filename)) { // 정규식이면
			alert("해당 종류의 파일은 업로드 할 수 없습니다.")
			return false;
		}
		return true;
	}

	// 파일 전송버튼을 클릭하면
	$("#uploadBtn").on("click", function() {
		// 파일 업로드 관련 로직 처리
		// .jsp에 form태그를 대체 (FormData함수)
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;

		for (var i = 0; i < files.length; i++) {
			// 함수 호출(checkExtension)
			if (!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			// .jsp 파일선택을 통해 선택한 파일들을 form태그에 추가
			formData.append("uploadFile", files[i]);
		}
		
		// ajax를 통해서 shopController에 파일관련 데이터 전송
		$.ajax({
			type : "post",
			url : "/shop_boardajax",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(result){
				console.log(result)
				
				var str = "";
				var input = "";
				$(result).each(function(i, obj){			
					 input += "<input type='text' name='attach["+i+"].product_name' value ='" + obj.product_name + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_image' value ='" + obj.product_image + "'><br>";					 					 
					 input += "<input type='text' name='attach["+i+"].product_upload' value ='" + obj.product_upload + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_uid' value ='" + obj.product_price + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_uid' value ='" + obj.product_color + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_uid' value ='" + obj.product_size + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_uid' value ='" + obj.product_type + "'><br>";
					 input += "<input type='text' name='attach["+i+"].product_uid' value ='" + obj.product_Quantity + "'><br>";
					 // 만약 image 결과가 ture이면
					 // obj.image == true or
					 if(obj.product_image){
							// 아래에 있는거 실행					
							var filePath=encodeURIComponent(obj.product_upload+"/s_"+obj.product_uid+"_"+obj.product_name)
							console.log(filePath)
							
							str += "<li><img src='/display?filename="+filePath+"'></li>"
						}else{// 그렇지 않으면
							// 다운로드 할 수 있도록 실행
							var filePath=encodeURIComponent(obj.product_upload+"/"+obj.product_uid+"_"+obj.product_name)
							str += "<li><a href='/download?filename="+filePath+"'>"+obj.product_name+"</a></li>"
						 }
				})
				$("#uploadResult ul").html(str);
				$("#form").append(input).submit();
			}
		})

	})
})