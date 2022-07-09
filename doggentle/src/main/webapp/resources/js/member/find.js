$(document).ready(function(){
	$('#fnidbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnidProc.dog').submit();
	});
	$('#fnpwbtn').click(function(){
		$('#frm').attr('action', '/www/member/fnpwProc.dog').submit();
	});
});