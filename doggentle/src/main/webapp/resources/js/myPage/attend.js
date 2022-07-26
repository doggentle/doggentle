$(document).ready(function(){
	var now = new Date();
	var nowmonth = now.getMonth() + 1;
	var nowday = now.getDate();
	
	var my = $('#myattend').val();
	my = my.substring(1, my.length-1).replace(/\s/gi, '');
	var arr = [];
	arr = my.split(',');
	if(nowmonth == $('#month').val()){
		$('#'+nowday).append("<button class='w3-red w3-padding' id='attendbtn'> 출석 </button>");
	}
	if(arr[0] != null && arr[0] != ''){
		for(var i in arr){
			if(nowday != arr[i]){
				$('#'+arr[i]).append("<h3 class='w3-blue w3-margin' id='attended'> 출석 </h3>"); 
			} else {
				$('#attendbtn').remove();
				$('#'+arr[i]).append("<h3 class='w3-blue w3-margin' id='attended'> 출석 </h3>");
			}
		}
	}
	
	$('#prev').click(function(){
		$('#month').val(Number($('#month').val()) - 1);
		$('#frm').submit();
	});
	$('#next').click(function(){
		$('#month').val(Number($('#month').val()) + 1);
		$('#frm').submit();
	});
	
	$('#attendbtn').click(function(){
		$.ajax({
			url: '/www/myPage/attendProc.dog',
			type: 'post',
			data: {
				supno: 104,
				pvalue: 100
			},
			success: function(result){
				if(result == "OK"){
					$('#msgWin').css('display', 'block');
				} else {
					$('#msg').html('출석을 실패하셨습니다.');
					$('#msgWin').css('display', 'block');
				}
			},
			error:function(){
				alert("통신오류");
			}
		});
	});
	
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
		$('#frm').submit();
	});
	
});