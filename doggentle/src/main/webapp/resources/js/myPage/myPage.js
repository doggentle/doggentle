var close = function(spw){
	$('#pw').val(spw);
	$('#newpw').val('');
	$('#checkpw').val('');	
	$('#chpw').css('display', 'block');
	$('#pwfr').stop().slideUp(300);
	$('#pw').attr('readonly', true);
};

var today = new Date();
var year = today.getFullYear();
var tmonth = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
// 오늘 날짜
var toDate = year + '-' + tmonth + '-' + day;


today.setMonth(today.getMonth() - 3);
var year = today.getFullYear();
var tmonth = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var startminDate = year + '-' + tmonth + '-' + day;

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
	
	$('#changepw').click(function(){ 
		$('#change').attr('name', 'spw');
		$('#exist').val($('#pw').val());
		if($('#newpw').val() == $('#checkpw').val()){
			$('#change').val($('#checkpw').val());
		}
		if($('#change').val() != null){
			var pw = $('#exist').val();
			alert("pw : "+pw)
			var spw = $('#change').val();
			alert("spw : "+spw)
		$.ajax({
			url: '/www/myPage/memberinfoProc.dog',
			type: 'post',
			data: {
				pw : pw,
				spw : spw
			},
			success: function(result){
				if(result == "OK"){
					$('#msgWin').css('display', 'block');
					$('#msg').html('비밀번호 변경이 완료 되었습니다.');
					close(spw);
				} else if(result == "NO") {
					$('#msgWin').css('display', 'block');
					$('#msg').html('비밀번호 변경이 실패 되었습니다.');
					close(spw);
				} else if(result == "NON"){
					$('#msgWin').css('display', 'block');
					$('#msg').html('비밀번호가 틀리셨습니다.');
					close(spw);
				}
			},
			error:function(){
				alert("통신 오류");
			}
		});
		} else if($('#change').val() == null) {
			$('#msgWin').css('display', 'block');
			$('#msg').html('확인 비밀번호가 같지 않습니다.');
		} 
	});
	
	$('#startDate').val(toDate);
	$('#startDate').attr('max', toDate);
	$('#startDate').attr('min', startminDate);
	$('#endDate').val(toDate);
	$('#endDate').attr('max', toDate);
	$('#endDate').attr('min', toDate);
	
	$('#startDate').change(function(){
		var sdate = $('#startDate').val();
		alert(sdate);
		$('#endDate').attr('min', $('#startDate').val());
		
		/*var edate = new Date($('#endDate').val());
		edate.setDate(edate.getDate() + 1);
		var enddate = edate.getFullYear() + '-' + (edate.getMonth() + 1) + '-' + edate.getDate(); 
		alert(enddate);*/
	});
	
	
	
});