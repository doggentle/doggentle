$(document).ready(function(){
	var msg = $('#msg').val();
	$('#fnidbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnidProc.dog').submit();
	});
	$('#fnpwbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnpwProc.dog').submit();
	});
});