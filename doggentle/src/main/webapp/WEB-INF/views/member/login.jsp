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
						<button class="w3-half w3-yellow"  		id="kabtn" onclick="loginWithKakao()" >카카오아이디로 로그인</button>
					</div>
					<div class="cpntainer w3-margin-top">
						<a class="box ml10" href="/www/member/join.dog">회원가입</a>
					    <a class="box ml10" href="/www/member/findid.dog">아이디 찾기</a>
					    <a class="box ml10" href="/www/member/findpw.dog">비밀번호 찾기</a>
					</div>	
				</form>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
		Kakao.init('f603e5ca480d29a16da9bf0bb94cf55e'); //고유 키값을 입력해야 한다
		console.log(Kakao.isInitialized()); 			//초기화가 잘 되었을 경우 콘솔에 'true' 출력

		/* function unlinkApp() {
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
		
		function loginWithKakao() {
		    Kakao.Auth.authorize({
		        redirectUri: 'http://localhost/',
		        scope: 'profile_nickname'
		    })
			
		}
		
		function getToken() {
			const token = getCookie('authorize-access-token')
			if(token) {
				Kakao.Auth.setAccessToken(token)
				document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()
			}
		}
		function getCookie(name) {
			const value = "; " + document.cookie;
			const parts = value.split("; " + name + "=");
			if (parts.length === 2) {
				return parts.pop().split(";").shift();
			}
		} */
		
		Kakao.Auth.authorize({				//Kakao.Auth.createLoginButton / Kakao.Auth.authorize
		    container: '#kabtn',
		    success: function(authObj) {
		      Kakao.API.request({
		        url: '/v2/user/me',
		        success: function(result) {
		        	
		        	
		        	
		    				var userID = result.id;
		    				var useEmail = result.kakao_account.email;
		    				var useNickName = result.properties.nickname;
		    				var thumbnail = result.properties.thumbnail_image_url;
		    				var gen = result.gender;
		    				var ages = result.age_range;
		    				var birthDay = result.birthday;
		
		    				var ex1 = result.properties;
		    				var ex2 = result.kakao_account;
		    				
		    				console.log("userID", userID);
		    				console.log("useEmail", useEmail);
		    				console.log("useNickName", useNickName);
		    				console.log("thumbnail", thumbnail);
		    				console.log("gender", gen);
		    				console.log("age_range", ages);
		    				console.log("birthday", birthDay);
		    				
		    				console.log("ex1", ex1);
		    				console.log("ex2", ex2);
		        	
		        	
		         /*  $('#result').append(result);
		          		alert(JSON.stringify(result));
		          id = result.id
		          connected_at = result.connected_at
		          kakao_account = result.kakao_account
		          $('#result').append(kakao_account);
		          		alert(JSON.stringify(kakao_account));
		          resultdiv="<h2>로그인 성공 !!"
		          resultdiv += '<h4>id: '+id+'<h4>'
		          resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
		          email ="";
		          gender = "";
		          if(typeof kakao_account != 'undefined'){
		        	  email = kakao_account.email;
		        	  gender = kakao_account.gender;
		          }
		          resultdiv += '<h4>email: '+email+'<h4>'
		          resultdiv += '<h4>gender: '+gender+'<h4>'
		          $('#result').append(resultdiv);
		           */
		           
		        },
		        fail: function(error) {
		          alert(
		            'login success, but failed to request user information: ' +
		              JSON.stringify(error)
		          )
		        },
		      })
		    },
		    fail: function(err) {
		      alert('failed to login: ' + JSON.stringify(err))
		    },
		  })
</script>
	
</body>
</html>