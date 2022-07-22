$(document).ready(function() {
	$('.qnalist').click(function() {
		var txt = $(this).attr('id');
	
		if($('#d' + txt).css('display') == 'none'){
			$('#d' + txt).show();
		} else {
			$('#d' + txt).hide();
		}
	});
	
	$('.add').click(function() {
		var tt = $(this).prev().val();
		if(!tt) {
			$(this).prev().focus();
			return;
		}
		
		var txt = $(this).parent().attr('id');
		
		$('#title').val('답변');
		$('#body').val(tt);
		$('#upqno').val(txt);
		
		$('#frm').submit();
	}); 
	var qno;
	
	$('.edit').click(function() {
		var tt = $(this).parent().parent().attr('id');
		qno = tt;
		var txt = $(this).prev().text();
		
		$('#a' + tt).hide();
		$('#btn' + tt).show();
		$('.e'+ tt).append('<textarea class="w3-input w3-border w3-padding" name="body" rows="3" style="resize: none" require></textarea>'
				+ '<div class="w3-orange w3-button w3-right w3-margin-top w3-margin-bottom edit" id="ebtn">수정</div>');
		
	
	});
	
	$('#btn' + qno).click(function() {
		$('#frm').submit();
	});
});