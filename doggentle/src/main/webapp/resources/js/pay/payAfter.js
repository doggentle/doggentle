$(document).ready(function(){
	var sidLen = $('#partner_user_id').val().length
	
	$('#goHome').click(function(){
		$(location).attr('href', '/www/');
	});
	$('#goMyPage').click(function(){
		$(location).attr('href', '/www/myPage/mypagemain.dog');
	});
	
	var pgtkn = $('#pgtkn').val();
	
	$.ajax({
		url:'/www/order/payAfter.dog',
		dataType:'json',
		data:{
			pg_token : pgtkn
		},
		success:function(data){
			var tno = data.partner_user_id
			tno2 = tno.substr(sidLen);
			
			$.ajax({
				url:'/www/order/payTrDone.dog',
				dataType:'json',
				contentType : "application/json; charset:UTF-8",
				data:{
					tno: tno2
					},
				success:function(data2){
					if(data2.result=='OK'){
						$('#tid').html(data.tid);
						$('#aid').html(data.aid);
						$('#partner_order_id').html(data.partner_order_id);
						$('#tno').html(tno2);
						$('#who').html(data2.who);
						$('#contact').html(data2.contact);
						$('#pno').html(data2.pno);
						$('#adrs').html(data2.adrs);

						if(data2.dir != 'null') {
							var dir = data2.dir;
							var img = dir + data2.savename;
							$('.media-object').attr('src', img);							
						} else {
							$('.media-object').attr('src', data2.savename);							
						}
					}else{
						//alert('오류1');
						$(location).attr('href', '/www/error.dog');
					}
				},
				error:function(error){
					//alert('오류2');
					$(location).attr('href', '/www/error.dog');
				}
			});
		},
		error:function(error){
			//alert('오류3');
			$(location).attr('href', '/www/error.dog');
		}
	});
	
	$('#goMainPage').click(function(){
		$(location).attr('href', '/www/');
	});
	$('#goMyPage').click(function(){
		$(location).attr('href', '/www/myPage/mypagemain.dog');
	});
});