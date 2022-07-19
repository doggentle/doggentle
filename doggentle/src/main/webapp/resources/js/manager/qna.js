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
		var txt = $(this).parent().parent().attr('id');
		alert($('#title').val());

		$('#upqno').val(txt);
		
		$('#frm').submit();
	});
});