$(document).ready(function(){
	$('#kakaopay').click(function(){
		
			var partner_user_id = $('#partner_user_id').val();
			var item_name = $('#item_name').val();
			var quantity = $('#quantity').val();
			var total_amount = $('#total_amount').val();

		$.ajax({
			url:'/www/order/kakaopay.blp',
			dataType:'json',
			data:{
				partner_user_id : partner_user_id,
				item_name : item_name,
				quantity : quantity,
				total_amount : total_amount
			},
			success:function(data){
				var url = data.next_redirect_pc_url;
				var tid = data.tid;
				window.open(url, "_parent");
			},
			error:function(error){
				alert(error);
			}
		});

	});
	
	
});
