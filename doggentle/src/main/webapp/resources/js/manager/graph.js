$(document).ready(function() {
	$('#month').hide();
	
	$('#type').change(function() {
		var result = $('#type option:selected').val();
		if(result == 'daily') { 
			$('#day').show();
			$('#month').hide();
		} else {
			$('#month').show();
			$('#day').hide();
		}
	});

	
});