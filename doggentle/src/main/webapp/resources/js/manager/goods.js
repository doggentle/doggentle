$(document).ready(function() {
	$('.item').click(function() {
		var txt = $(this).attr('id');
		
		$('#gno').val(txt);
		$('#frm').submit();
	});
	
	$('#sel').change(function() {
		if($('#sel').is(':checked')) {

		} else {

		}
	});
});