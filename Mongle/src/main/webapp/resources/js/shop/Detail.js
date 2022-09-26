/*상품 상세페이지 관련 js*/
$(document).ready(function(){
	/* 해당 요소 클릭시 마다 
	$("#tab-titles li").click(function(){
		$(this).toggleClass('on');
		if($(this).hasClass("on")){
			$(this).addclass('active')
		}else if(!$(this).hasClass("on"){		
			$(this).removeclass('active')
		}
	})*/
	$("#tab-titles").each(function(){
		if($(this).hasClass("on")){
			$(this).parent().addclass('active')
		}else{
			$(this).parent().removeclass('active')
		}
	})
})