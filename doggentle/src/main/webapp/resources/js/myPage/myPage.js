// 비밀번호 변경시에 사용되는 이벤트 함수
var close = function(spw){
	$('#pw').val(spw);
	$('#newpw').val('');
	$('#checkpw').val('');	
	$('#chpw').css('display', 'block');
	$('#pwfr').stop().slideUp(300);
	$('#pw').attr('readonly', true);
};

// 오늘 날짜로 달력에 심어주지
var today = new Date(); 
var year = today.getFullYear();
var tmonth = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
// 오늘 날짜
var toDate = year + '-' + tmonth + '-' + day;

// 오늘날짜로 부터 3개월전까지 날짜 검색 가능하게한 기능
today.setMonth(today.getMonth() - 3);
var year = today.getFullYear();
var tmonth = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var startminDate = year + '-' + tmonth + '-' + day;


$(document).ready(function(){
	// 모달창 닫기 처리
	$('#msgClose').click(function(){
		$('#msgWin').css('display', 'none');
	});
	
	// 회원수정 페이지전에 회원 확인
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
	
	
	// 회원정보 수정 비밀번호 수정
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
			var spw = $('#change').val();
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
	
	// 시간관련 및 포인트 페이징처리
	
	// 시간규칙
	$('#startDate').val(toDate);
	$('#startDate').attr('max', toDate);
	$('#startDate').attr('min', startminDate);
	$('#endDate').val(toDate);
	$('#endDate').attr('max', toDate);
	$('#endDate').attr('min', toDate);
	
	$('#startDate').change(function(){
		$('#endDate').attr('min', $('#startDate').val());
	});
	
	$('#endDate').change(function(){
		$('#startDate').attr('max', $('#endDate').val());
	});
	
	// 시간으로 조회
	$('#seldate').click(function(){
		$('#nowPage').val(1);
		$('#startdate').val($('#startDate').val());
		var edate = new Date($('#endDate').val());
		if(day == edate.getDate()){
			edate.setDate(edate.getDate() + 1);
		}
		var enddate = edate.getFullYear() + '-' + (edate.getMonth() + 1) + '-' + edate.getDate(); 
		$('#enddate').val(enddate);
		$('#frm').submit();
	});
	
	//모든 포인트 조회
	$('#allbtn').click(function(){
		$('#nowPage').val(1);
		$('#startdate').val("");
		$('#enddate').val("");
		$('#supno').val(0);
		$('#frm').submit();
	});
	
	// 적립포인트만 조회
	$('#apbtn').click(function(){
		$('#nowPage').val(1);
		$('#startdate').val("");
		$('#enddate').val("");
		$('#supno').val(100);
		$('#frm').submit();
	});
	
	// 페이징처리
	$('.pbtn').click(function(){
		var spage = $(this).attr('id');
		$('#nowPage').val(spage);
		$('#frm').submit();
	});
	
});