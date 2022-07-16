$(document).ready(function(){
	$('#goHome').click(function(){
		$(location).attr('href', '/www/order/payExecute.dog');
	});
	$('#goMyPage').click(function(){
		$(location).attr('href', '/www/myPage/mypagemain.dog');
	});
});