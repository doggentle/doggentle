$(document).ready(function() {
	$('#bbtn').click(function() {
		window.history.back();
	});
	
	$('#lbtn').click(function() {
		var bir = $('#birth').val();
		var tmp = bir.replace(/-/gi, "/");
		var tmp2 = tmp.substring(2, 10);
		
		$('#bdate').val(tmp2);
	});
	
	$('#jbtn').click(function(){
		$(location).attr(href, '/www/member/join.dog')
	});
	
	$('#kabtn').click(function(){
		loginWithKakao();
	});
	
	$('#test').click(function(){
		unlinkApp();
	});
	
	
});
	
