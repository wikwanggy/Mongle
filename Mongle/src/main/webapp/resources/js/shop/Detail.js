/*상품 상세페이지 관련 js*/
$(document).ready(function() {
	$('#tab-titles li').click(function() {
		$('#tab-titles li').removeClass('active');
		$(this).addClass('active');
	});
});
