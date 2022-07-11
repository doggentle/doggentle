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
	<title>Payment</title>
	
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
	<a class="navbar-brand" style="font-size: 20pt; padding-top: 30px;">결제하기</a>
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
<div class="w3-content" style="max-width:1200px;">
	<div class="w3-col w3-right w3-border" style="margin-top: 150px; min-height: 200px;">
		<div class="w3-col m4 w3-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>주문자 정보</h3>
				<div class="w3-margin-left">
					<p>아이디: XXXX</p>
					<p>메일: XXXXX</p>
					<p>아이디: XXXX</p>
					<p>메일: XXXXX</p>
				</div>
			</div>
		</div>
		<div class="w3-col m8 w3-border-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>상품 정보</h3>
				<div class="w3-margin-left" style="text-align: center;">
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<img src="https://www.w3schools.com/w3css/img_snowtops.jpg"
								class="w3-round" style="width:120px; height:100px;">
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>상품이름</h4>
						<p>무슨무슨 제품</p>
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>상품가격</h4>
						<p>얼마얼마</p>
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>구매수량</h4>
						<p>몇 개</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="w3-col w3-right w3-border" style="margin-top: 10px; min-height: 200px;">
		<div class="w3-col m4 w3-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>결제 상세정보</h3>
				<div class="w3-margin-left">
					<h4>주문금액</h4>
					<div class="w3-margin-left">
						<p>상품금액: XXXXX</p>
						<p>배송비: XXXX</p>
						<p>포인트 사용: XXXXX</p>
					</div>
				</div>
			</div>
		</div>
		<div class="w3-col m8 w3-border-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>배송지 정보</h3>
				<div class="w3-margin-left" style="text-align: center;">
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<img src="https://www.w3schools.com/w3css/img_snowtops.jpg"
								class="w3-round" style="width:120px; height:100px;">
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>상품이름</h4>
						<p>무슨무슨 제품</p>
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>상품가격</h4>
						<p>얼마얼마</p>
					</div>
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<h4>구매수량</h4>
						<p>몇 개</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Intro
	================================================== -->

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