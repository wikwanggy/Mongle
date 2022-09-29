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
	/*$('#minus').click(function(){
		var stat = $('#Quantity').val();
		var num = parseInt(stat. 10);
		num--;
		if (num <= 0){
			num = 1;
		}
		$('#Quantity').val(num);
	})
	$('#plus').click(function(){
		var stat = $('#Quantity').val();
		var num = parseInt(stat, 10);
		num++;
		if(num > 5){
			num = 5;
		}
		$('#Quantity').val(num);
	})*/
})
