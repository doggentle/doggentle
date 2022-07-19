$(document).ready(function(){

	//페이지 버튼
	/*$('.pbtn').click(function(){
		// 클릭된 버튼의 아이디 읽고
		var spage = $(this).attr('id');
		
		$('#nowPage').val(spage);
		$('#bno').prop('disabled', true);
		
		// action 속성 변경하고
		$('#frm').attr('action', '/www/qna/qnaWrite.dog');
		$('#frm').submit();
		
	});*/
	//주문목록 선택하기
	$('#okbtn').click(function(){
		 var stno = $('[name="seltno"]:checked').val();
		 
		 $('#ordno').attr('value', stno);
		 $('#ordno').submit();
		 
		 $('#id01').css('display', 'none');
	});
	
	//문의글 등록 버튼처리
	$('#okbtn').click(function(){
		$('#frm').attr('action', '/www/qna/qnaWrite.dog');
		$('#frmo').submit();
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
					
					$('#glist').append('<option class="w3-center" value="' +gno + '">' + name + '</option>');
				}
			},
			error: function(){
				alert('### 통신 오류 ###');
			}
		});
	});
});