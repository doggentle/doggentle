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
});