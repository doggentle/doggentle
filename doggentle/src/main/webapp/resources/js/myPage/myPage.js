$(document).ready(function(){
	$('#check').click(function(){
		var sid = $('#id').val();
		var spw = $('#pw').val();
		$.ajax({
			url: '/www/myPage/memberinfopwckProc.dog',
			type: 'post',
			data: {
				id: sid,
				pw: spw
			},
			success: function(result){
				if(result == "OK"){
					$('#result').val(result);
					$('#frm').submit();
				} else {
					$('#msgWin').css('display', 'block');
				}
			},
			error:function(){
				alert("통신 오류");
			}
		});
	});
	
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
	});
	
	$('#chpw').click(function(){
		$('#pw').attr('readonly', false);
		$('#pw').val('');
		$('#chpw').css('display', 'none');
		$('#pwfr').stop().slideDown(300);
	});
	 
		$('#avtfr').stop().slideUp(300, function(){
			if(sgen == 'M'){
				$('#favt').css('display', 'none');
				$('#mavt').css('display', 'block');
			} else {
				$('#mavt').css('display', 'none');
				$('#favt').css('display', 'block');
			}
			
			$('#avtfr').stop().slideDown(300);
		});
});