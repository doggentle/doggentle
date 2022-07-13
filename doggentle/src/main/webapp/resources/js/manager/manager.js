$(document).ready(function(){
	var one = false;


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
	
	$('.minfo').click(function() {
		var txt = $(this).attr('id');
		if($('.o' + txt).css('display') == 'block'){
			$('.o'+txt).css('display', 'none').html('');			
			return;
		}
		$.ajax({
			url: '/www/manager/orderList.dog',
			type: 'POST',
			dataType: 'json',
			async : false,
			data: {
				mno: txt
			},
			success: function(arr) {			
				$('.o'+txt).css('display', 'none').html('');			
				
				$('.o'+txt).append(
				'<h3 class="w3-left w3-margin">주문내역</h3>' +			
				'<div class="w3-col w3-light-grey w3-center w3-border">' +
				'<div class="w3-col m2 w3-border-right">주문번호</div>' +
				'<div class="w3-col m3 w3-border-right">img</div>' +
				'<div class="w3-col m4 w3-border-right">상품이름</div>' +
				'<div class="w3-col m2 w3-border-right">가격</div>' +
				'<div class="w3-col m1">갯수</div>'); 

				for(var i=0; i<arr.length; i++) {
					$('.o'+txt).append(
					'<div class="w3-col w3-center w3-border">' +
					'<div class="w3-col m2 w3-border-right">' + arr[i].tno + '</div>' +
					'<div class="w3-col m3 w3-border-right">' + arr[i].ino + '</div>' +
					'<div class="w3-col m4 w3-border-right">' + arr[i].gname + '</div>' +
					'<div class="w3-col m2 w3-border-right">' + arr[i].price + '</div>' +
					'<div class="w3-col m1">' + arr[i].quantity + '</div>'); 
				}				
				$('#o'+txt).css('display', 'block');
				$('.o'+txt).css('display', 'block');
			},
			error: function() {
				alert('오류');
			}
		});

	
	});
	
});