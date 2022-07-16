$(document).ready(function(){
	var msg = $('#msg').val();
	alert(msg);
	$('#fnidbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnidProc.dog').submit();
	});
	$('#fnpwbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnpwProc.dog').submit();
	});
});