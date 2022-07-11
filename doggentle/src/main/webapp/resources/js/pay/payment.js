$(document).ready(function(){
	$('#kakaopay').click(function(){
		$.ajax({
			url:'/www/order/pay.blp',
			dataType:'json',
			success:function(data){
				alert(data.tid);
				alert(data);
				var box = data.next_redirect_pc_url;
				window.open(box);
			},
			error:function(error){
				alert(error);
			}
		});
	});
	
	
});
