/*상품 상세페이지 관련 js*/
$(document).ready(function() {
	$('#tab-titles li').click(function() {
		$('#tab-titles li').removeClass('active');
		$(this).addClass('active');
	});
	var result = '${main.w_Quantity}'
	$('#minus').click(function(){
		var num = 0;
		num--;
		if(num < result){
			
		}
		$('#Quantity').val(num);
	});
	$('#plus').click(function(){
		var num = 0;
		num++;
        if(num > result){
			
		}
        $('#Quantity').val(num);
	});
	console.log("result="+result);
})
