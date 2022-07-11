$(document).ready(function(){
	$('#goPayment').click(function(){
		$('#frm').attr('action', '/www/order/payment.dog').submit();
	});
});