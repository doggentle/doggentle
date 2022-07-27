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
	<title>마이페이지</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/myPage.css'>	
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/test.css"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>	
	
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
			<!-- Start Navigation -->
			<nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
			<ul class="nav navbar-nav">
		<c:if test="${empty SID}">
				<li>
				<a href="/www/member/login.dog">로그인</a>
				</li>
				<li>
				<a href="/www/member/join.dog">회원가입</a>
				</li>
		</c:if>
		<c:if test="${not empty SID}">
				<li>
				<a href="/www/member/logout.dog">로그아웃</a>
				</li>
				<li>
				<a href="/www/myPage/mypagemain.dog">마이페이지</a>
				</li>
				<li>
				<a href="/www/">출석</a>
				</li>
				<li>
				<a href="/www/">장바구니</a>
				</li>
		</c:if>
				<li>
				<a href="/www/">문의하기</a>
				</li>
			</ul>
			</nav>
		</div>
	</header>
<!-- Intro
	================================================== -->
<section id="hero" class="section">
	<div class="test">
		<div class="row">
			<div class="col-md-5">
				
			</div>
			<div class="col-md-7">
			</div>
		</div>
	</div>
	</section>
	
	
<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1500px;margin-top:40px">    
		<!-- The Grid -->
	  	<div class="w3-row">
	   	 	<!-- Left Column -->
	    	<div class="w3-col m3">
	      		<!-- Profile -->
	      		<div class="w3-card w3-round w3-white">
	        		<div class="w3-container">
	         			<h1 class="w3-center w3-margin-top" style="font-weight: bold">마이페이지</h1>
	         			<div class="w3-container w3-left-align" style="margin-top: 20px">
	         				<dl>
	         					<dt class="w3-block">쇼핑정보</dt>
	         					<dd><a href="">주문내역</a></dd>
	         					<dd><a href="">장바구니</a></dd>
	         					<dt class="w3-block">회원활동</dt>
	         					<dd><a href="">문의 내역</a></dd>
	         					<dd><a href="">리뷰관리</a></dd>
	         					<dd><a href="">출    석</a></dd>
	         					<dt class="w3-block">회원정보</dt>
	         					<dd><a href="">프로필 정보</a></dd>
	         					<dd><a href="/www/myPage/memberinfopwck.dog">회원정보 수정</a></dd>
	         	 				<dd><a href="/www/myPage/addressList.dog">주소록 관리</a></dd>
	         					<dd><a href="/www/myPage/myPoint.dog">포인트</a></dd> 
	         				</dl>
	         			</div>
	        		</div>
	      		</div>
	   		 </div>
	    
	<!-- Middle Column -->
	<div class="w3-col m9">
<!-- 주문내역 영역 -->
	   	 	<h1 class="w3-margin-left">내가 작성한 리뷰</h1>
	   	 	<hr>
<c:forEach var="data" items="${LIST}">
		<div class="w3-col w3-round-large w3-card-2 w3-margin-bottom w3-padding" style="margin-left: 40px; width: 80%; display: flex; align-items: center;">
			<div class="w3-col m3">
				<img src="${data.dir}${data.savename}" class="w3-border w3-border-grey w3-margin-right">
			</div>
			<div class="w3-rest w3-padding">
				<div class="w3-col w3-border-bottom">
					<span class="mgb10 ft10">작성일 : ${data.rdate}</span>
							<span class="w3-button w3-border ft10 w3-red w3-right" id="rdelbtn"><small>삭제</small></span>
							<span class="w3-button w3-border ft10 w3-gray w3-right" id="reditbtn"><small>수정</small></span>
				</div>
				<div class="w3-col">
					<span class="mgb10 ft10"><b class="w3-margin-top">상품명 : ${data.gname}</b></span>
				<div class="wrap-star">
					<div class='star-rating1'>
						<span style="width: ${data.score*20}%;"></span>
					</div>
				</div>
   			
				<div class="w3-col w3-margin-top">
					<span class="w3-col ft12 w3-border-bottom">제목 : ${data.title}</span>
				</div>
				<div class="w3-col">
					<span class="w3-col ft12">내용 : ${data.body}</span>
				</div>
				</div>
			</div>
		</div>
</c:forEach>		
		
	</div>
</div>
</div>
	
<footer style="margin-top: 100px;">
		<div class="bottom section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="copyright">
							<p>© <span>2018</span> <a href="/www/main.dog" class="transition">doggentle</a> All rights reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>
</body>
</html>