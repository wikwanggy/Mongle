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
const tabcustom = function(bgno,pageNum) {
	  const URLSearch = new URLSearchParams(location.search);
	  URLSearch.set('bgno', String(bgno));
	  URLSearch.set('pageNum', String(pageNum));
	  const newParam = URLSearch.toString();

	  window.open(location.pathname + '?' + newParam, '_self');
	};

const tabcustom2 = function(bgno,pageNum,bno) {
	  const URLSearch2 = new URLSearchParams(location.search);
	  URLSearch2.set('bgno', String(bgno));
	  URLSearch2.set('pageNum', String(pageNum));
	  URLSearch2.set('bno', bno);
	  const newParam2 = URLSearch2.toString();	  
	  
	  if($('input[name=faqbno]'==bno)) {
		  $(this).hasClass("on");
		  $(this).next().css("display","block");
		  alert(faq.bno);
	  }
	  
		$("dt").off().click(function(){
			$(this).toggleClass("on");
			$(this).siblings().removeClass("on");
			$("dt").not(this).next().css("display","none");

			if($(this).hasClass("on")) {
				// BNO값이 100이면
				$(this).next().css("display","block");
			}else {
				$(this).next().css("display","none");
			}
		});

	  window.open(location.pathname + '?' + newParam2, '_self');
	};