attachlist.filename
$(document).ready(function() {
	$.getJSON("/placeattachlist",{bno:bno},function(attachlist){
		var filename=attachlist.filename;
		alert(filename);
		
		
	}
	
	
	
} 