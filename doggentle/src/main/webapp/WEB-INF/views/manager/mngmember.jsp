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
	<title>관리자 회원관리</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/manager.js"></script>
	
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
		<h1>회원 관리</h1>
		<hr>
		<div class="w3-col w3-light-grey w3-center w3-border">
			<div class="w3-col m3">
				<div class="w3-col m5 w3-border-right">회원번호</div>
				<div class="w3-col m7 w3-border-right">아이디</div>
			</div>
			<div class="w3-col m3 w3-border-right">메일</div>
			<div class="w3-col m3 w3-border-right">가입일</div>
			<div class="w3-col m1 w3-border-right">주문횟수</div>
			<div class="w3-col m1 w3-border-right">리뷰갯수</div>
			<div class="w3-col m1">포인트</div>
		</div>

<!-- 데이터 -->	
<hr class="w3-col">
		<div class="w3-col w3-center w3-hover-blue" id="sorder">
			<div class="w3-col m3">
				<div class="w3-col m5">1001</div>
				<div class="w3-col m7">tmddus</div>
			</div>
			<div class="w3-col m3">tmddus2123@gmail.com</div>
			<div class="w3-col m3">22/06/30</div>
			<div class="w3-col m1">2</div>
			<div class="w3-col m1">1</div>
			<div class="w3-col m1">500</div>
		</div>
		
		<div id="orderlist" style="display: none">
			<h3 class="w3-left">주문내역</h3>
			<div class="w3-col w3-light-grey w3-center w3-border">
				<div class="w3-col m2 w3-border-right">주문번호</div>
				<div class="w3-col m3 w3-border-right">img</div>
				<div class="w3-col m4 w3-border-right">상품이름</div>
				<div class="w3-col m2 w3-border-right">가격</div>
				<div class="w3-col m1">갯수</div>
			</div>
		</div>
<!-- 리뷰 추가할지 말지 -->
	</div>
</div>
</body>
</html>
