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
	<title>관리자 상품관리</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/test.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/manager.js"></script>
	<script type="text/javascript" src="/www/js/manager/goods.js"></script>
		<script src="/www/js/bootstrap.min.js"></script>
	
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
		<a href="/www/member/logout.dog">로그아웃</a>
		</li>
</c:if>
		<li>
		<a href="/www/manager/market.dog">마켓통계</a>
		</li>
		<li>
		<a href="/www/manager/member.dog">회원관리</a>
		</li>
		<li>
		<a href="/www/manager/sales.dog">매출관리</a>
		</li>
		<li> 
		<a href="/www/manager/goods.dog">상품관리</a>
		</li>
		<li>
		<a href="/www/manager/inquiry.dog">문의관리</a>
		</li>
	</ul>
	</nav>
</div>
</header>

<!-- Intro
	================================================== -->
<div class="container">
	<div class="box65 w3-center" style="margin-top: 100px;">
		<a href="/www/manager/main.dog"><h1>상품 관리</h1></a> 
	</div>
	<div>
		<div class="w3-button w3-blue" id="agbtn">상품 등록</div>
		<div class="w3-right">
			<input type="checkbox" name="sel" id="sel"><label for="sel">판매중인 상품만 보기</label>
		</div>
	</div>
	<div>
		<div class="w3-col w3-light-grey w3-center w3-border w3-padding-top w3-padding-bottom">
			<div class="w3-col m7">			
				<div class="w3-col m3 w3-border-right">카테고리</div>
				<div class="w3-col m5 w3-border-right">상품명</div>
				<div class="w3-col m4 w3-border-right">이미지</div>
			</div>
			<div class="w3-col m5">						
				<div class="w3-col m4 w3-border-right">가격</div>
				<div class="w3-col m3 w3-border-right">판매량</div>
				<div class="w3-col m3 w3-border-right">재고</div>
				<div class="w3-col m2">판매여부</div>
			</div>
		</div>
<c:forEach var="data" items="${LIST}">
		<div class="w3-col w3-center w3-border w3-padding-top w3-padding-bottom goods w3-hover-light-blue item" id="${data.gno}">
			<div class="w3-col m7 goods">			
				<div class="w3-col m3">${data.caname}</div>
				<div class="w3-col m5">${data.gname}</div>
				<div class="w3-col m4">
					<div class="w3-col"><img src="${data.dir}${data.savename}" height="100px" width="auto"></div>
				</div>
			</div>
			<div class="w3-col m5">						
				<div class="w3-col m4">${data.price}</div>
				<div class="w3-col m3">${data.hits}</div>
				<div class="w3-col m3">${data.stock}</div>
				<div class="w3-col m2">${data.issell}</div>
			</div>
		</div>
</c:forEach>
	</div>
	<form method="POST" id="frm" name="frm" action="/www/manager/addgoods.dog">
		<input type="hidden" id="gno" name="gno" value="">
	</form>
</div>
</body>
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
</html>