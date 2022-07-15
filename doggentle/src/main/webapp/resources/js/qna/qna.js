	$('.pbtn').click(function(){
		// 클릭된 버튼의 아이디 읽고
		var spage = $(this).attr('id');
		
		$('#nowPage').val(spage);
		$('#bno').prop('disabled', true);
		
		// action 속성 변경하고
		$('#frm').attr('action', '/www/qna/qnaWrite.dog');
		$('#frm').submit();
		
	});