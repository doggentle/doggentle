$(document).ready(function(){
	$('#kakaopay').click(function(){
		var oVO = $('#frm').serialize();
		var partner_user_id = $('#partner_user_id').val();
		var item_name = $('#item_name').val();
		var quantity = $('#quantity').val();
		var total_amount = $('#total_amount').val();
		var gno = $('#gno').val();
		$.ajax({
			url:'/www/order/trReady.dog',
			dataType:'json',
			data: oVO,
			success:function(trdata){
				if(trdata.result=='OK'){
					var tno = trdata.tno;
					console.log(tno);
					partner_user_id = partner_user_id+tno;
					$.ajax({
						url:'/www/order/kakaopay.dog',
						dataType:'json',
						data:{
							partner_user_id : partner_user_id,
							item_name : item_name,
							quantity : quantity,
							total_amount : total_amount
						},
						success:function(data){
//		console.log(data);
							console.log(data.tid);
							var url = data.next_redirect_pc_url;
							var tid = data.tid;
							window.open(url, "_parent");
						},
						error:function(error){
							alert(error);
						}
					});
				}else if(trdata.result=='NO'){
					console.log('NO');
				}
			},
			errorfunction(error){
				alert(error.result);
			}
		});

	});
	
	$('#goShopping').click(function(){
		$(location).attr('href', '/www/');
	});
	
	$('input[type="checkbox"].adnoCheckBox:eq(0)').prop('checked', true);
	
	$('#adno').val($('input[type="checkbox"].adnoCheckBox:checked').val());
	addressView();
	
	$('[type="checkbox"].adnoCheckBox').click(function(){
		  if($(this).prop('checked')){
		     $('input[type="checkbox"].adnoCheckBox').prop('checked',false);
		     $(this).prop('checked',true);
		    }
		  addressView()
		  $('#adno').val($(this).val());
	});
	
	
	
});

function addressView(){
	$('.adno').attr('style', 'display: none;');
	var adnoV = $('input[type="checkbox"].adnoCheckBox:checked').val();
	$('.'+adnoV).attr('style', 'display: block;');
}
