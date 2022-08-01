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
	
	$('.qtyplus').click(function(){
		var clickedCno = $(this).prev().prev().attr('id');
		$('.qty').prop('disabled', true);
		$('.qtyV').prop('readonly', true)
		qtyCon(clickedCno, '+1');
		
		totalPxqRefresh2();
	});
	$('.qtyminus').click(function(){
		if($(this).prev().val()<=1){
			$(this).prev().val(1);
			return;
		}
		var clickedCno = $(this).prev().attr('id');
		$('.qty').prop('disabled', true);
		$('.qtyV').prop('readonly', true)
		qtyCon(clickedCno, '-1');
		
		totalPxqRefresh2();
	});
	$('.qtyV').change(function(){
		if($(this).val()<=1){
			$(this).val(1);
			return;
		}
		var changedCno = $(this).attr('id');
		var changedVal = $(this).val();
		$('.qty').prop('disabled', true);
		$('.qtyV').prop('readonly', true)
		qtyCon(changedCno, changedVal)
		
		totalPxqRefresh2();
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

function totalPxqRefresh2(){
	var newTotalPxq = 0;
	$('.qtyV').each(function(){
		var eachPxq = $(this).parent().next().next().children().first().html();
		eachPxq = eachPxq.substr(0,eachPxq.length-2);
		newTotalPxq = newTotalPxq + Number(eachPxq);
	})
	$('.totalPrice').html(newTotalPxq+' ￦');
	$('.totalPxQ').html(newTotalPxq+' ￦');
	
	$('.qty').prop('disabled', false);
	$('.qtyV').prop('readonly', false)
}

function qtyCon(cno, pnm){
	$.ajax({
		url:'/www/order/cartQtyControl.dog',
		dataType:'json',
		data:{
			cno: cno,
			pnm: pnm
		},
		success:function(data){
			if(data.result=='OK'){
				if(pnm=='+1'){
					var value = Number($('#'+cno).val())+1;
					$('#'+cno).val(value);
				}else if(pnm=='-1'){
					var value = Number($('#'+cno).val())-1;
					$('#'+cno).val(value);
				}else{
					$('#'+cno).val(pnm);
				}
				var newP = Number($('#'+cno).parent().next().children().first().html().substring(0,$('#'+cno).parent().next().children().first().html().length-2));
				var newQ = Number($('#'+cno).val());
				var newPxq =  newP * newQ;
				$('#'+cno).parent().next().next().children().first().html(newPxq+' ￦');
			}else{
				alert('다시 시도해 주세요');
			}
		},
		error:function(error){
			alert(error);
		}
	});
}

