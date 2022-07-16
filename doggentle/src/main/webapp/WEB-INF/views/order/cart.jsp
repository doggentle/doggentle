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
	<title>Cart</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js//order/cart.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
	
	
	
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
		<a href="/www/" class="navbar-brand"><img src="/www/img/logo.png" width="250px" height="auto"><span></span></a>
	</div>
	<a class="navbar-brand" style="font-size: 20pt; padding-top: 30px;">장바구니</a>
	<!-- Start Navigation -->
	<nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	<ul class="nav navbar-nav">
		<li>
		<a href="/www/member/logout.dog">로그아웃</a>
		</li>
		<li>
		<a href="/www/myPage/mypagemain.dog">마이페이지</a>
		</li>
		<li>
		<a href="/www/myPage/myattend.dog">출석</a>
		</li>
		<li>
		<a href="/www/order/cart.dog">장바구니</a>
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
	<div class="w3-content">
		<div class="w3-col w3-center w3-padding w3-margin-bottom">
			<h>장바구니</h1>
		</div>
		<div class="w3-col w3-center w3-margin-bottom">

		</div>
	</div>
    <br/>
<div class="container">
	<div class="box65">
    <br/>
	<form id="frm" method="post" name="frm" action="/www/order/payment.dog" style="margin-top: 80px; max-width: 900px;">
<c:forEach var="data" items="${LIST}"><!--  -->
		<div class="w3-container w3-border w3-round w3-white" style="padding:7.5px; height:115px;">
			<div class="w3-col m3 w3-border-right" style="height: 100px; padding-left: 25px; padding-top: 0px;">
				<input class="w3-margin-right" type="checkbox" name="cnoArr" value="${data.cno}" checked>
				<div style="display:inline-block; width:130px; height:100px;">
					<img src="${data.dir}"
							class="w3-round" style="width:120px; height:100px;">
				</div>
			</div>
			<div class="w3-col m3 w3-center w3-border-right" style="height:100px">
				<div class="">
					<h5>제품이름</h5>
					<h3>${data.gname}</h3>
				</div>
			</div>
			<div class="w3-col m2 w3-center w3-border-right" style="height:100px">
				<div class="">
					<h5>구매수량 및 가격</h5>
					<h3>${data.quant}</h3>
					<h3 class="price">${data.price}</h3>
				</div>
			</div>
			<div class="w3-col m3 w3-center w3-border-right" style="height:100px">
				<div class="">
					<h5>전체가격</h5>
					<h3>${data.quant * data.price}</h3>
				</div>
			</div>
			<div class="w3-col m1 w3-center" style="height:100px">
				<button id="${data.cno}" class="w3-light-gray w3-padding del" style="margin-top: 25px; border:0px;">삭제</button>
			</div>
		</div>
</c:forEach>
	</form>
	</div>
</div>
<hr>
<div>
	<p>총 제품가격</p>
	<button id="goPayment">총 몇 건 주문하기</button>
</div>
<!-- 슬라이드 -->

<script src="/www/js/jquery.min.js"></script>
<script src="/www/js/bootstrap.min.js"></script>
<script src="/www/js/waypoints.min.js"></script>
<script src="/www/js/jquery.scrollTo.min.js"></script>
<script src="/www/js/jquery.localScroll.min.js"></script>
<script src="/www/js/jquery.magnific-popup.min.js"></script>
<script src="/www/js/validate.js"></script>
<!-- 
<script src="/www/js/common.js"></script>
 -->
</body>
</html>