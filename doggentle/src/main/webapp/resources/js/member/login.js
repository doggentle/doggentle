$(document).ready(function() {
	$('#bbtn').click(function() {
		window.history.back();
	});
	
	$('#lbtn').click(function() {
		var bir = $('#birth').val();
		var tmp = bir.replace(/-/gi, "/");
		var tmp2 = tmp.substring(2, 10);
		
		$('#bdate').val(tmp2);
	});
	
	$('#jbtn').click(function(){
		$(location).attr(href, '/www/member/join.dog')
	});
	
	$('#kabtn').click(function(){
		loginWithKakao();
	});
	
	$('#test').click(function(){
		unlinkApp();
	});
	
	
	Kakao.init('f603e5ca480d29a16da9bf0bb94cf55e'); //고유 키값을 입력해야 한다
		console.log(Kakao.isInitialized()); 			//초기화가 잘 되었을 경우 콘솔에 'true' 출력
		
		function loginWithKakao() {
			Kakao.Auth.login({
			      success: function(authObj) {
			        alert(JSON.stringify(authObj))
			      },
			      fail: function(err) {
			        alert(JSON.stringify(err))
			      },
			    })
		  }
		
		function unlinkApp() {
		    Kakao.API.request({
		      url: '/v1/user/unlink',
		      success: function(res) {
		        alert('success: ' + JSON.stringify(res))
		      },
		      fail: function(err) {
		        alert('fail: ' + JSON.stringify(err))
		      },
		    })
		  }
});