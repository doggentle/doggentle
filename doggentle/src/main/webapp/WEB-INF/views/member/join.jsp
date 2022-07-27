<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Page</title>
<link rel="stylesheet" type="text/css" href="/www/css/w3.css"/>
<link rel="stylesheet" type="text/css" href="/www/css/login.css"/>
<link rel="stylesheet" type="text/css" href="/www/css/base.css"/>
<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/www/js/member/login.js"></script>	
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
	});

</script>
</head>
<body>
	<div class="w3-content w3-center">
		<a href="/www/" ><img src="/www/img/logo.png" class="blogo"></a>
		<div class="container w3-center w3-padding">
	 <div class="w600 w3-margin-top w3-border w3-padding">
    <h2>로그인</h2>
	<form method="POST" action="/www/member/joinProc.dog" id="frm" name="frm">
  <div class="container">
    <label for="id"><b>ID</b></label>
    <input type="text" placeholder="아이디를 입력해주세요" id="id" name="id" required>

    <label for="pw"><b>PW</b></label>
    <input type="password" placeholder="비밀번호를 입력해주세요" id="pw" name="pw" required>
    
    <label for="pwck"><b>PWCK</b></label>
    <input type="password" placeholder="비밀번호를 입력해주세요" id="pwck" required>

    <label for="mail"><b>MAIL</b></label>
    <input type="text" placeholder="비밀번호를 입력해주세요" id="mail" name="mail" required>

    <label for="birth"><b>BIRTH</b></label>
    <input type="date" id="birth" required>

    <label for="gen"><b>GEN</b></label>
    <input type="radio" id="mgen" name="gen" value="M" required><label for="mgen">남자</label>
    <input type="radio" id="fgen" name="gen" value="F" required><label for="fgen">여자</label>
	<div>
    <button class="w3-half w3-light-gray" id="bbtn">뒤로가기</button>
    <button class="w3-half" type="submit" id="lbtn">JOIN</button>
	</div>
  </div>
  <input type="hidden" id="bdate" name="bdate" value="">
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
</body>
</html>