$(document).ready(function(){
	
	$("input[name='search']").on("click",function(){
		// pageNum에 1을 초기화
		$("input[name='pageNum']").val("1");
		// form 태그를 submit
		$("#searchForm").submit();
	})
})