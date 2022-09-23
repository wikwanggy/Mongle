/**
 * 상품 등록 js
 */
$(document).ready(function() {
	var input = "";
	var multi = "";
	var t = 1;
	// 상품등록 체크
	$("#uploadBtn").click(function(){
		// 상품 이름
		var product_name_chk = false;
		// 상품 가격
		var product_price_chk = false;
		// 삼풍 색상
		var product_color_chk = false;
		// 상품 종류
		var product_type_chk = false;
		// 상품 수량
		var product_Q_chk = false;
		
		/* 체크대상변수 */
		// 상품 이름
		var product_name = $("input[name='w_name']").val();
		// 상품 가격
		var product_price = $("input[name='w_price']").val();
		// 삼풍 색상
		var product_color = $("input[name='w_color']").val();
		// 상품 종류
		var product_type = $("input[name='w_type']").val();
		// 상품 수량
		var product_Q = $("input[name='w_Quantity']").val();
		
		/* 입력란 공백 체크 */
		if(product_name.length>0){
			$(".shop_name").css('display','none');
			product_name_chk=true;
		}else{
			$(".shop_name").css('display','block');
			product_name_chk=false;
		}
		if(product_price.length>0){
			$(".shop_price").css('display','none');
			product_price_chk=true;
		}else{
			$(".shop_price").css('display','block');
			product_price_chk=false;
		}
		if(product_price.length>0){
			$(".shop_color").css('display','none');
			product_color_chk=true;
		}else{
			$(".shop_color").css('display','block');
			product_color_chk=false;
		}
		if(product_price.length>0){
			$(".shop_type").css('display','none');
			product_type_chk=true;
		}else{
			$(".shop_type").css('display','block');
			product_type_chk=false;
		}
		if(product_price.length>0){
			$(".shop_Q").css('display','none');
			product_Q_chk=true;
		}else{
			$(".shop_Q").css('display','block');
			product_Q_chk=false;
		}
		if(product_name_chk && product_price_chk && product_color_chk && product_type_chk && product_Q_chk){
			alert('통과');
			$("#shop_form").append(input).submit();
		}else{
			return false;
		}
	});
	
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
	// 버튼 클리시
	$("#multi").click(function(){
		$(".multi").addend("<td><input type="text" class="shop_color" name="w_color" placeholder="색상">"+ t +"</td>")
		t++;
	})
	// 파일 전송버튼을 클릭하면 mian 이미지
	$("#imagemain").on("change", function(e) {
		e.stopPropagation();
		// .jsp에 form태그를 대체 (FormData함수)
		var formData = new FormData();
		var inputFile = $("input[name='main']");
		var files = inputFile[0].files;
		console.log("inputFile1="+inputFile);
		console.log("files1="+files);

		for (var i = 0; i < files.length; i++) {
			// 함수 호출(checkExtension)
			if (!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			// .jsp 파일선택을 통해 선택한 파일들을 form태그에 추가
			formData.append("main", files[i]);
		}		
		// ajax를 통해서 shopController에 파일관련 데이터 전송
		$.ajax({
			type : "post",
			url : "/shop_board_main",
			data : formData,
			contentType : false,
			processData : false,
			dataType : "json",
			success : function(result){
				console.log("result1 = "+result)
				
				var str = "";				
				//$(result).each(function(i, obj){					 
					 input += "<input type='text' name='attach["+0+"].p_image' value ='" + result.p_image + "'><br>";					 					 
					 input += "<input type='text' name='attach["+0+"].p_upload' value ='" + result.p_upload + "'><br>";				 
					 input += "<input type='text' name='attach["+0+"].p_uid' value ='" + result.p_uid + "'><br>";
					 input += "<input type='text' name='attach["+0+"].p_name' value ='" + result.p_name + "'><br>";
					 input += "<input type='text' name='attach["+0+"].vision' value ='" + result.vision + "'><br>";
					 // 만약 image 결과가 ture이면
					 // obj.image == true or
					 if(result.p_image){
							// 아래에 있는거 실행
							var filePath=encodeURIComponent(result.p_upload+"\\"+result.p_uid+"_"+result.p_name)
							console.log("filePath="+filePath)
							
							str += "<li><img src='/display?filename="+filePath+"'></li>"
						}else{// 그렇지 않으면
							// 다운로드 할 수 있도록 실행
							var filePath=encodeURIComponent(result.p_upload+"\\"+result.p_uid+"_"+result.p_name)
							str += "<li><a href='/download?filename="+filePath+"'>"+result.p_name+"</a></li>"
						 }
				//})				
				$("#uploadResult ul").html(str);	
		   }
	    })
    })
	
	// sub이미지
	$("#imagesub").on("change",function(e){
		e.preventDefault()
		// .jsp에 form태그를 대체 (FormData함수)
		var formData = new FormData();
		var inputFile = $("input[name='sub']");
		var files = inputFile[0].files;
		console.log("inputFile2="+inputFile);
		console.log("files2="+files);
		
		for (var i = 0; i < files.length; i++) {
			// 함수 호출(checkExtension)
			if (!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			// .jsp 파일선택을 통해 선택한 파일들을 form태그에 추가
			formData.append("sub", files[i]);
		}
		// ajax를 사용하여 서버를 전송
		$.ajax({
			url:'/shop_board_sub',
			data:formData,
			contentType:false,
			processData:false,
			dataType:"json",
			type:"POST",
			success:function(result){
				console.log("result2="+result);
				
				var str="";
				$(result).each(function(i,obj){
					console.log("obj2="+obj)
					console.log("obj2.filename="+obj.filename)
					 input += "<input type='text' name='attach["+(i+1)+"].p_image' value ='" + obj.p_image + "'><br>";					 					 
					 input += "<input type='text' name='attach["+(i+1)+"].p_upload' value ='" + obj.p_upload + "'><br>";				 
					 input += "<input type='text' name='attach["+(i+1)+"].p_uid' value ='" + obj.p_uid + "'><br>";
					 input += "<input type='text' name='attach["+(i+1)+"].p_name' value ='" + obj.p_name + "'><br>";
					 input += "<input type='text' name='attach["+(i+1)+"].vision' value ='" + obj.vision + "'><br>";
					 // 만약 image 결과가 ture이면
					 // obj.image == true or
					 if(obj.p_image){
							// 아래에 있는거 실행
							var filePath=encodeURIComponent(obj.p_upload+"\\"+obj.p_uid+"_"+obj.p_name)
							console.log("filePath="+filePath)
							
							str += "<li><img src='/display?filename="+filePath+"'></li>"
						}else{// 그렇지 않으면
							// 다운로드 할 수 있도록 실행
							var filePath=encodeURIComponent(obj.p_upload+"\\"+obj.p_uid+"_"+obj.p_name)
							str += "<li><a href='/download?filename="+filePath+"'>"+obj.p_name+"</a></li>"
						 }
				})
				$("#uploadResult2 ul").html(str);
				console.log(input);
			}
		})
	})		
})