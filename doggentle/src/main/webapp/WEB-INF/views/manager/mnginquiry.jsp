<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>관리자 문의관리</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	
	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
			
	<!-- Favicon -->
	<link rel="shortcut icon" href="/www/img/favicon.ico">
</head>
<body>
<!-- Begin Hero Bg -->
<div id="parallax">
</div>
<!-- End Hero Bg
	================================================== -->
<!-- Start Header
	================================================== -->
<header id="header" class="navbar navbar-inverse navbar-fixed-top" role="banner">
<div class="container">
	<div class="navbar-header">
		<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		</button>
		<!-- Your Logo -->
		<a href="/www/manager/main.dog" class="navbar-brand"><img src="/www/img/logo.png" width="250px" height="auto"><span></span></a>
	</div>
	<!-- Start Navigation -->
	<nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	<ul class="nav navbar-nav">
<c:if test="${not empty MID}">
		<li>
		<a href="/www/member/main.dog">관리자</a>
		</li>
		<li>
		<a href="/www/member/logout.dog">로그아웃</a>
		</li>
</c:if>
		<li>
		<a href="/www/">카테고리</a>
		</li>
		<li>
		<a href="/www/">마켓정보</a>
		</li>
		<li>
		<a href="/www/">문의하기</a>
		</li>
	</ul>
	</nav>
</div>
</header>

<!-- Intro
	================================================== -->
<div class="container">
	<div class="box65 w3-center" style="margin-top: 100px;">
		<h1>문의 관리</h1>
	</div>
	
		<div class="w3-col w3-light-grey w3-center w3-border">
			<div class="w3-col m2 w3-border-right qna">답변상태</div>
			<div class="w3-col m6 w3-border-right qna">제목</div>
			<div class="w3-col m2 w3-border-right qna">작성자</div>
			<div class="w3-col m2 qna">작성일</div>
		</div>
		<div class="w3-col w3-center">
			<div class="w3-col m2 w3-border-right qna">미답변</div>
			<div class="w3-col m6 w3-border-right qna">테이블 재입고 언제되나요???</div>
			<div class="w3-col m2 w3-border-right qna">tmddus</div>
			<div class="w3-col m2 qna">2022.07.10</div>
		</div>
		<div class="w3-col w3-light-gray">
			<div class="qna">제곧내 어쩌구 저쩌구</div>
			<hr>
			<div class="qna w3-margin">
				<textarea class="w3-input w3-border w3-padding" rows="3" style="resize: none"></textarea>
				<div class="w3-button">등록</div>
			</div>
		</div>
	</div>