$(document).ready(function(){
	totalPxqRefresh();
	$('.cnoCheckBox').change(function(){
		totalPxqRefresh();
	});
	$('.cnoCheckBoxController').change(function(){
		totalPxqRefresh();
	});
	
	$('.cartDel').click(function(){
		var cno = '/www/order/cartDel.dog?cno='+$(this).val();
		$(location).attr('href', cno);
	});
	
	$('#goPayment').click(function(){
		$('#frm').attr('action', '/www/order/payment.dog');
		var arr2 = [];
		$(".cnoCheckBox:checked").each(function() {
			arr2.push($(this).val());
		});
		for(i=0;i<arr2.length;i++){
			var cont = '<input type="hidden" name="cnoArr" value="'+
						arr2[i]+ '">';
			$('#frm').append(cont);
		}
		$('#frm').submit();
	});
	
	$('.cnoCheckBoxController').click(function() {
		if($('.cnoCheckBoxController').is(':checked')){
			$('.cnoCheckBox').prop('checked', true);
		}else{
			$('.cnoCheckBox').prop('checked', false);
		}
	});

	$('.cnoCheckBox').click(function() {
		var totalCnoCheckBox = $('.cnoCheckBox').length;
		var checked = $('.cnoCheckBox:checked').length;
		if(totalCnoCheckBox != checked){
			$('.cnoCheckBoxController').prop('checked', false);
		}else if(totalCnoCheckBox == checked){
			$('.cnoCheckBoxController').prop('checked', true); 
		}
	});
	
	$('#goShopping').click(function(){
		$(location).attr('href', '/www/');
	});
});

function totalPxqRefresh(){
	var arr = [];
	var totalPxQ = 0;
	$('.cnoCheckBox:checked').each(function() {
		var pxqValue = $(this).parent().next().next().next().next().children().first().html();
		pxqValue = pxqValue.substring(0,pxqValue.length-2);
		arr.push(pxqValue);
	});
	for(i=0;i<arr.length;i++){
		totalPxQ = Number(totalPxQ) + Number(arr[i]);
	}
	
	$('.totalPxQ').html(totalPxQ+' ￦');
	if(arr.length > 0 && arr.length < 3){
		$('.deliveryPrice').html('3000 ￦');
		$('.totalPrice').html(Number(totalPxQ)+Number(3000)+' ￦');
	}else if(arr.length >= 3){
		$('.deliveryPrice').html('3종 이상 구매시 무료');
		$('.totalPrice').html(Number(totalPxQ)+' ￦');
	}else if(arr.length == 0){
		$('.deliveryPrice').html('0 ￦');
		$('.totalPrice').html('0 ￦');
	}
}

