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
	<link rel='stylesheet' href="/www/css/test.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/manager.js"></script>
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
		<a href="/www/manager/main.dog"><h1>회원 관리</h1></a>
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
<c:forEach var="data" items="${LIST}">
<hr class="w3-col">
		<div class="w3-col w3-center w3-hover-blue minfo" id="${data.mno}">
			<div class="w3-col m3">
				<label for="${data.mno}" class="w3-col m5 w3-border-right">${data.mno}</label>
				<label for="${data.mno}" class="w3-col m7 w3-border-right">${data.id}</label>
			</div>
			<label for="${data.mno}" class="w3-col m3 w3-border-right">${data.mail}</label>
			<label for="${data.mno}" class="w3-col m3 w3-border-right">${data.jdate}</label>
			<label for="${data.mno}" class="w3-col m1 w3-border-right">${data.tcnt}</label>
			<label for="${data.mno}" class="w3-col m1 w3-border-right">${data.rcnt}</label>
			<label for="${data.mno}" class="w3-col m1">${data.spoint}</label>
		</div>
				
		<div class="o${data.mno}" id="o${data.mno}" style="margin: 50px; display: none;">
		</div>
</c:forEach>

	<!-- 페이지 처리 시작 -->
		<div class="w3-center">
			<div class="w3-bar w3-border w3-margin-bottom" style="margin-top: 100px;">
	<c:if test="${PAGE.startPage eq 1}">
				<div class="w3-bar-item w3-light-grey">&laquo;</div>
	</c:if>
	<c:if test="${PAGE.startPage ne 1}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
	</c:if>
	<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
			<c:if test="${page eq PAGE.nowPage}">
				<div class="w3-bar-item w3-orange">${page}</div>
			</c:if>
			<c:if test="${page ne PAGE.nowPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${page}">${page}</div>
			</c:if>
	</c:forEach>
			<c:if test="${PAGE.endPage eq PAGE.totalPage}">
				<div class="w3-bar-item w3-light-grey">&raquo;</div>
			</c:if>
			<c:if test="${PAGE.endPage ne PAGE.totalPage}">
				<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
			</c:if>
			</div>
		</div>
		<!-- 페이지 처리 태그 끝 -->
		


<!-- 리뷰 추가할지 말지 -->
	</div>
	
		<form method="POST" action="/www/manager/member.dog" id="frm" name="frm">
		<input type="hidden" id="nowPage" name="nowPage" value="${PAGE.nowPage}">
		</form>
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
