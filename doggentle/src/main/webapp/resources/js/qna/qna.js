$(document).ready(function(){


	//주문목록 선택하기
	$('#okbtn').click(function(){
		 var stno = $('[name="seltno"]:checked').val();
		 
		 $('#ordno').attr('value', stno);
		 $('#ordno').submit();
		 
		 $('#id01').css('display', 'none');
	});
	
	$('#okbtn').click(function(){
		var stno = $('#ogtno').val();
		
		$.ajax({
			url: '/www/qna/getOrderGoodsList.dog',
			type: 'post',
			data: {
				tno : stno,
			},
			success: function(arr){
				for(var i = 0 ; i < arr.length ; i++ ){
					var data = arr[i];
					var gno = data.gno;
					var name = data.name;
					
					$('#name').append('<option class="w3-center" value="' +gno + '">' + name + '</option>');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});
	
	$('#btn_save').click(function() {
		$('#frm').attr('action', '/www/qna/QnaList.dog');
		$('#frm').submit();
	});
});