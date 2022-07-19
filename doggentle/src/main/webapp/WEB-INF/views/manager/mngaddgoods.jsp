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
	<title>관리자 페이지</title>
	
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
	<script type="text/javascript" src="/www/js/manager/category.js"></script>
	
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
		<h1>상품 등록</h1>
	</div>
	
	<div>
		<form method="POST" action="/www/board/boardWriteProc.blp" encType="multipart/form-data"
				id="frm" name="frm" class="w3-col w3-border w3-padding">
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">카테고리</label>
			
				<select class="w3-border w3-center" id="cate1">
					<option disabled selected># 대분류 #</option>
		<c:forEach var="data" items="${LIST}">
					<option value="${data.cano}">${data.caname}</option>
		</c:forEach>
				</select>
					
				<select class="w3-border w3-center" id="cate2">
					<option disabled selected># 중분류 #</option>
				</select>
				
				<select class="w3-border w3-center" id="cate3">
					<option disabled selected># 소분류 #</option>
				</select>
			
			</div>
			
			<div class="w3-col w3-margin-bottom">
				<label for="title" class="w3-col s2 w3-margin-top">상품명</label>
				<input type="text" id="gname" name="gname" class="w3-col m10 w3-input w3-border"><span>${INFO.gname}</span>
			</div>
			
			<div class="w3-col">
				<label for="gbody" class="w3-col s2 w3-margin-top">상품설명</label>
				<div class="w3-col m10">
					<textarea class="w3-col w3-input w3-padding w3-border w3-margin-bottom" 
							id="gbody" name="gbody" rows="7" style="resize: none;">${INFO.gdetail}</textarea>
				</div>
			</div>
			
			<div class="w3-col w3-margin-bottom">
				<label class="w3-col s2 w3-margin-top">이미지 업로드</label>
				<div class="w3-col m10" id="filebox">
					<input type="file" name="file" class="w3-input w3-border w3-margin-bottom upfile">
				</div>
			</div>
			
			<div class="w3-col w3-margin-bottom" id="previewbox" style="display: none;">
				<label class="w3-col s2 w3-margin-top">상품이미지</label>
				<div class="w3-col m10 w3-center" id="preview">
				</div>
			</div>

			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2 w3-margin-top">가격</label>
				<input type="text" id="gname" name="gname" class="w3-col m10 w3-input w3-border">
			</div>
			
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2 w3-margin-top">재고</label>
				<input type="text" id="gname" name="gname" class="w3-col m10 w3-input w3-border">
			</div>
			
			
			<div class="w3-col w3-margin-top w3-margin-bottom">
				<label for="title" class="w3-col s2">판매여부</label>
				<div>
					<input type="radio" id="sell" name="issell" class=""><label for="sell">판매</label>
					<input type="radio" id="stop" name="issell" class=""><label for="stop">중지</label>
				</div>
			</div>

		</form>
		
		<div class="w3-col w3-margin-top">
			<div class="w3-half w3-button w3-light-gray" id="bbtn">뒤로가기</div>
			<div class="w3-half w3-button w3-blue" id="addbtn">상품등록</div>
		</div>
	</div>
</div>
</body>
</html>