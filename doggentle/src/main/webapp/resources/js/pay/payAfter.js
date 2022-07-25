$(document).ready(function(){
	var sidLen = $('#partner_user_id').val().length
	console.log(sidLen);
	
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
			console.log(data);
			console.log(data.partner_user_id);
			var tno = data.partner_user_id
			tno = tno.substr(sidLen);
			
			$.ajax({
				url:'/www/order/payTrDone.dog',
				dataType:'json',
				contentType : "application/json; charset:UTF-8",
				data:{
					tno: tno
					},
				success:function(data2){
					if(data2.result=='OK'){
						$('#tid').html(data.tid);
						$('#aid').html(data.aid);
						$('#partner_order_id').html(data.partner_order_id);
						$('#tno').html(tno);
						$('#who').html(data2.who);
						$('#contact').html(data2.contact);
						$('#pno').html(data2.pno);
						$('#adrs').html(data2.adrs);
					}else{
						$(location).attr('href', '/www/error.dog');
					}
				},
				error:function(error){
					alert(error);
					$(location).attr('href', '/www/error.dog');
				}
			});
		},
		error:function(error){
			alert(error.result);
			$(location).attr('href', '/www/error.dog');
		}
	});
});