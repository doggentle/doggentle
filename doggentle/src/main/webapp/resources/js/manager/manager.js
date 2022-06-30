$(document).ready(function(){
	$('#mkbtn').click(function() {
		$(location).attr('href', '/www/manager/market.dog');
	});
	
	$('#mbbtn').click(function() {
		$(location).attr('href', '/www/manager/member.dog');
	});
	
	$('#slbtn').click(function() {
		$(location).attr('href', '/www/manager/sales.dog');
	});
	
	$('#stbtn').click(function() {
		$(location).attr('href', '/www/manager/stock.dog');
	});
	
	$('#iqbtn').click(function() {
		$(location).attr('href', '/www/manager/inquiry.dog');
	});
	
	$('#sorder').click(function() {
	
		if($('#orderlist').css('display') == 'none') {
			$('#orderlist').css('display', 'block');
		} else {
			$('#orderlist').css('display', 'none');		
		}
		
	
	});
});