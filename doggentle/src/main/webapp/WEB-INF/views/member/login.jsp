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
</head>
<body>
	<div class="w3-content w3-center">
		<a href="/www/" ><img src="/www/img/logo.png" class="blogo"></a>
		<div class="container w3-center w3-padding">
	 <div class="box w600 w3-margin-top w3-border w3-padding">
    <h2>로그인</h2>
	<form method="POST" action="/www/member/loginProc.dog" id="frm" name="frm">
  <div class="container">
    <label for="id"><b>ID</b></label>
    <input type="text" placeholder="아이디를 입력해주세요" id="id" name="id" required>

    <label for="pw"><b>PW</b></label>
    <input type="password" placeholder="비밀번호를 입력해주세요" id="pw" name="pw" required>

    <button type="submit" id="lbtn">Login</button>
 
  </div>
    <a href="/festival/member/join.fes">회원가입</a>
    <a href="/festival/member/findid.fes">아이디 찾기</a>
    <a href="/festival/member/findpw.fes">비밀번호 찾기</a>
  <div>
  </div>
</form>
</div>
</div>
</div>
</body>
</html>