/**
 * 
 */
$(document).ready(function(){ /*탭메뉴*/
	
	$('.service_main_kategori').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('.service_main_kategori').removeClass('current');
		$('.service_faqlist').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});

function onoffDisplay(){ /*클릭시 글 내용 평쳐지게하기*/
	$("dt").off().click(function(){
		$(this).toggleClass("on");
		$(this).siblings().removeClass("on");
		$("dt").not(this).next().css("display","none");

		if($(this).hasClass("on")) {
			$(this).next().css("display","block");
		}else {
			$(this).next().css("display","none");
		}
	});
}
