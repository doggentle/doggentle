   $(document).ready(function(){
   
   //물건 클릭 했을때
   	$('.gbtn').click(function(){
		var sgno = $(this).attr('id');
		$('#gno').val(sgno);
		$('#frm').submit();
	});
   
   
    //-- 수량버튼 이벤트처리
    $(".btn-minus").click(function(){
        var now = $('#quantity').val();
        if ($.isNumeric(now)){
            if (parseInt(now) -1 > 0){ now--;}
            $('#quantity').val(now);
        }else{
            $('#quantity').val("1");
        }
    });          
      
    $(".btn-plus").click(function(){
        var now = $('#quantity').val();
        if ($.isNumeric(now)){
            $('#quantity').val(parseInt(now)+1);
        }else{
            $('#quantity').val("1");
        }
    });
    
    $('#cbtn').click(function(){
    	var gno = $('#gno').val();
    	var quantity = $('#quantity').val();
    	if(confirm('추가 하시겠습니까 ?')){
    		$.ajax({
    			url:'/www/order/addCart.dog',
    			dataType:'json',
    			data:{
    				gno: gno,
    				quantity: quantity
    			},
    			success:function(data){
    				console.log(data.result);
    				alert('추가 되었습니다.')
    			},
    			error:function(error){
    				alert(error)
    			}
    		});
    	}
    });
    
    $('#bbtn').click(function(){
    	$('#sgno').prop("disabled", true);
    	$('#frm').append(
    		'<input type="hidden" name="quantity" value="' +$('#quantity').val()+ '">'
    	);
    	$('#frm').attr('action', '/www/order/payment.dog');
    	$('#frm').submit();
    });
            
}); 