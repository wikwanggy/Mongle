/**
 * 
 */

$(document).ready(function(){
	
	$('.event-kategorie').click(function(){
		var tab_id = $(this).attr('data-tab');
		
		$('.event-kategorie').removeClass('current');
		$('.event-mainlist').removeClass('current');
		
		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
});