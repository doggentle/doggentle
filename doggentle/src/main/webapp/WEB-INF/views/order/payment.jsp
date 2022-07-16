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
	<script type="text/javascript" src="/www/js/pay/payment.js"></script>
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

			<form id="frm" name="frm" method="post" action="">
				<input id="partner_user_id" name="partner_user_id" type="hidden" value="${INFO.id}">
				<input id="item_name" name="item_name" type="hidden" value="${ONE.gname}">
				<input id="quantity" name="quantity" type="hidden" value="${ONE.gdsCount}">
				<input id="total_amount" name="total_amount" type="hidden" value="${ONE.ttlPrice}">
				
<c:forEach var="data" items="${LIST}">
				<input id="${data.cno}" name="cnoArr" type="hidden" value="${data.cno}">
</c:forEach>

<div class="w3-content" style="max-width:1200px;">
	<div class="w3-col w3-right w3-border" style="margin-top: 150px; min-height: 200px;">
		<div class="w3-col m4 w3-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>주문자 정보</h3>
				<div class="w3-margin-left">
					<p>아이디: ${INFO.id}</p>
					<p>메일: ${INFO.mail}</p>
				</div>
			</div>
		</div>
		<div class="w3-col m8 w3-border-right" style="display:inline-block; min-height:200px;">
			<div class="w3-margin">
				<h3>상품 정보</h3>
				<div class="w3-margin-left" style="text-align: center;">
					<div class="w3-col m3 w3-padding" style="height:200px;">
						<img src="${ONE.dir}"
								class="w3-round" style="width:120px; height:100px;">
					</div>
					<div class="w3-col m3 w3-padding w3-border-right" style="height:200px;">
						<h4>상품이름</h4>
						<p>${ONE.gname} 외 ${ONE.gdsCount - 1}개 품목</p>
					</div>
					<div class="w3-col m3 w3-padding w3-border-right" style="height:200px;">
						<h4>총상품가격</h4>
						<p>${ONE.ttlPrice}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<c:forEach var="data" items="${LIST}">
				<div class="w3-container w3-border w3-round w3-white" style="padding:7.5px; height:115px;">
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
								<h3>${data.price}</h3>
							</div>
						</div>
						<div class="w3-col m3 w3-center w3-border-right" style="height:100px">
							<div class="">
								<h5>물품전체가격</h5>
								<h3>${data.quant * data.price}</h3>
							</div>
						</div>
				</div>
</c:forEach>
<c:forEach var="addr" items="${ADDLIST}">
				<div class="w3-container w3-border w3-round w3-white" style="padding:7.5px; height:115px;">
						<div class="w3-col m3 w3-center w3-border-right" style="height:100px">
							<input class="w3-margin-right" type="checkbox" name="adno" value="${addr.adno}">
							<div style="display:inline-block; width:130px; height:100px;">
									<h4>받는사람 : ${addr.who}</h4>
									<h4>우편번호 : ${addr.pno}</h4>
									<h4>상세주소 : ${addr.adrs}</h4>
							</div>
						</div>
				</div>
</c:forEach>
</div>

			</form>

<button id="kakaopay">카카페이로결제하기</button>
<!-- Intro================================================== -->

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