$(document).ready(function(){
	
	$('.del').click(function(){
		var cno = $(this).attr('id');
		$(location).attr('href', '/www/order/cartDel.dog?cno='+cno);
	});
	
	$('#goPayment').click(function(){
		/*var arr = [];

		$("input[name=checkList]:checked").each(function() {
			arr.push($(this).val());
		});
		
		for(i=0;i<arr.length;i++){
			var cont = '<input type="hidden" name="cnoArr" value="'+
						arr[i]+
						'">';
			$('#frm').append(cont);
		}*/
		
		$('#frm').submit();
	});
	
	
});