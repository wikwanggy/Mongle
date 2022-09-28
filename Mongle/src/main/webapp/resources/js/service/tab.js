/**
 * 
 */
$(document).ready(function(){ /*탭메뉴*/
		var url = location.href;
		var getAr0 = url.indexOf("bgno=1");
		var getAr1 = url.indexOf("bgno=2");
		var getAr2 = url.indexOf("bgno=3");
		var getAr3 = url.indexOf("bgno=4");
		var getAr4 = url.indexOf("bgno=5");
		var getAr5 = url.indexOf("bgno=6");
		var getAr6 = url.indexOf("bgno=7");
		
		console.log(url);
		console.log(getAr3);
		console.log(getAr4);
		console.log(getAr5);
		
		if(getAr0 != -1) {
			$('#service_aside_list1').addClass("a_on");
		}
		
		if(getAr1 != -1) {
			$('#service_aside_list2').addClass("a_on");
			$('.service_main_kategori:eq(0)').addClass("current");
			$('.service_faqlist:eq(0)').addClass('current');
		}
		
		
		if(getAr2 != -1) {
			$('#service_aside_list3').addClass("a_on");
		}
		
		if(getAr3 != -1) {
			$('#service_aside_list2').addClass("a_on");
			$('.service_main_kategori:eq(1)').addClass("current");
			$('.service_faqlist:eq(1)').addClass('current');
		}
		
		if(getAr4 != -1) {
			$('#service_aside_list2').addClass("a_on");
			$('.service_main_kategori:eq(2)').addClass("current");
			$('.service_faqlist:eq(2)').addClass('current');
		}
		
		if(getAr5 != -1) {
			$('#service_aside_list2').addClass("a_on");
			$('.service_main_kategori:eq(3)').addClass("current");
			$('.service_faqlist:eq(3)').addClass('current');
		}
		
		if(getAr6 != -1) {
			$('#service_aside_list2').addClass("a_on");
			$('.service_main_kategori:eq(4)').addClass("current");
			$('.service_faqlist:eq(4)').addClass('current');
		}
		

		
	$('.service_main_kategori').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('.service_main_kategori').removeClass('current');
		$('.service_faqlist').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
	

	/*if( (Trim(wti)=="")||(wti==null) ) {
		alert("제목써주");
		return;
		var wti=document.fw.title.value;
		console.log(wti); 
	}*/
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

const test = function(bgno,pageNum) {
	  const URLSearch = new URLSearchParams(location.search);
	  URLSearch.set('bgno', String(bgno));
	  URLSearch.set('pageNum', String(pageNum));
	  const newParam = URLSearch.toString();

	  window.open(location.pathname + '?' + newParam, '_self');
	};
