<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css"/>
<link rel="stylesheet" type="text/css" href="/www/css/login.css"/>
<link rel="stylesheet" type="text/css" href="/www/css/base.css"/>
<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/www/js/member/login.js"></script>	
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
	<div class="w3-content w3-center">
	<a href="/www/" ><img src="/www/img/logo.png" class="blogo"></a>
		<div class="container w3-center w3-padding">
			<div class="box mx650 w3-margin-top w3-padding">
				<h2>로그인</h2>
				<form method="POST" action="/www/member/loginProc.dog" style="border:none;" id="frm" name="frm">
					<div class="container">
						<label for="id"><b>ID</b></label>
						<input type="text" placeholder="아이디를 입력해주세요" id="id" name="id" required>
									
						<label for="pw"><b>PW</b></label>
						<input type="password" placeholder="비밀번호를 입력해주세요" id="pw" name="pw" required>
									
						<button class="w3-blue" type="submit" 	id="lbtn">Login</button>
						<button class="w3-half"  				id="nabtn">네이버아이디로 로그인</button>
						<button class="w3-half w3-yellow"  		id="kabtn" >카카오아이디로 로그인</button>
					</div>
					<div class="cpntainer w3-margin-top">
						<div id="naverIdLogin" style="display: none;"></div>
						<a class="box ml10" href="/www/member/join.dog">회원가입</a>
					    <a class="box ml10" href="/www/member/findid.dog">아이디 찾기</a>
					    <a class="box ml10" href="/www/member/findpw.dog">비밀번호 찾기</a>
					</div>	
					<div class="cpntainer w3-margin-top">
						<a class="box ml10" id="test">kakaoloUnlink</a>
						<a class="custpage1" href="${pageContext.request.contextPath}/logout">로그아웃<a href="${deleteTokenUrl}"></a></a>
					</div>	
				</form>
			</div>
		</div>
	</div>
<footer style="margin-top: 100px;">
	<div class="bottom section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="copyright">
						<p>© <span>2022</span> <a href="/www/main.dog" class="transition">doggentle</a> All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<c:if test="${not empty MSG}">
<div id="msgWin" class="w3-modal" style="display: block;">
	    <div class="w3-modal-content w3-animate-top w3-card-4">
			<header class="w3-container w3-blue"> 
		        <span class="w3-button w3-display-topright" id="msgClose">&times;</span>
		        <h2>알림 메세지</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-margin-top w3-margin-bottom" id="msg">${MSG}</h3>
	    	</div>
	    </div>
 	</div>
</c:if>

	
<script>
Kakao.init('f603e5ca480d29a16da9bf0bb94cf55e'); //고유 키값을 입력해야 한다
console.log(Kakao.isInitialized()); 			//초기화가 잘 되었을 경우 콘솔에 'true' 출력

function loginWithKakao() {
	Kakao.Auth.login({
	    success: (auth) =>{
	    	Kakao.Auth.setAccessToken(auth.access_token);
	    	Kakao.API.request({
	    		url: '/v2/user/me',
	    		data:{
	    			property_keys: [ 'properties.nickname',
	    							'kakao_account.email',
	    							'kakao_account.birthday',
	    							'kakao_account.gender',],
	    		},
	    		success: function(response){
	    				if(response.id != ''){
		    				//var knickname = response.properties.nickname;
		    				var kid = response.id;
		    				var kmail = response.kakao_account.email;
		    				var kbirth = response.kakao_account.birthday;
		    				var kgen = response.kakao_account.gender;
		    				$.ajax({
		    					url:'/www/member/kakaoIdCheck.dog',
		    					type:'post',
		    					dataType:'json',
		    					data:{
		    						//nick: knickname,
		    						id: kid,
		    						mail: kmail,
		    						gen: kgen,
		    						bdate: kbirth
		    					},
		    					success:function(data){
		    						if(data.result=='OK'){
		    							$(location).attr('href', '/www/');
		    						}
		    					},
		    					error:function(error){
		    						alert('통신에러, 다시 시도해 주세요.');
		    					}
		    				});
	    				}
	    		},
	    		fail: function(error){
	    			console.log(error);
	    		},
	    	});
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
      	},
    	fail: function(err) {
    	},
    })
  }
</script>

<script>
var naverLogin = new naver.LoginWithNaverId({
	 clientId: 'J5d8Kl_bk22FQjyptPRT', //클라이언트ID
	 callbackUrl: 'http://localhost/www/',
	 isPopup: false,
	 loginButton: {color: "green", type: 3, height: 50}
	 
});

naverLogin.init(); //initialize Naver Login Button

$(document).on("click", "#nabtn", function(){ //네이버로그인버튼 커스텀작업
	var btnNaverLogin = document.getElementById("naverIdLogin").firstChild;
	btnNaverLogin.click();
});

</script>
</body>
</html>