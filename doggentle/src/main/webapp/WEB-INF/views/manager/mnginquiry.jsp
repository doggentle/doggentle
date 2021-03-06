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
	<link rel='stylesheet' href="/www/css/test.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/qna.js"></script>
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
		<a href="/www/manager/main.dog"><h1>문의 관리</h1></a>
	</div>
	
		<div class="w3-col w3-light-grey w3-center w3-border">
			<div class="w3-col m2 w3-border-right qna">답변상태</div>
			<div class="w3-col m5 w3-border-right qna">제목</div>
			<div class="w3-col m2 w3-border-right qna">작성자</div>
			<div class="w3-col m3 qna">작성일</div>
		</div>
		
<c:forEach var="data" items="${LIST}">
	
		<div class="w3-col w3-center w3-hover-light-blue qnalist" id="${data.qno}">
<c:if test="${data.ano eq 0}">
			<div class="w3-col m2 w3-border-right qna">미답변</div>
</c:if>
<c:if test="${data.ano ne 0}">
			<div class="w3-col m2 w3-border-right qna">답변완료</div>
</c:if>
			<div class="w3-col m5 w3-border-right qna tt" id="${data.title}">${data.title}</div>
			<div class="w3-col m2 w3-border-right qna">${data.id}</div>
			<div class="w3-col m3 qna">${data.qdate}</div>
		</div>

	
		<div class="w3-col w3-light-gray" id="d${data.qno}" style="display:none">
	
			<div class="qnabody">${data.body}</div>
	
			<hr class="bar">	
			<div class="qna w3-margin e${data.qno}" id="${data.qno}">

<c:if test="${data.ano eq 0}">
				<textarea class="w3-input w3-border w3-padding" id="b${data.qno}" name="body" rows="3" style="resize: none"></textarea>
				<div class="w3-blue w3-button w3-right w3-margin-top w3-margin-bottom add" id="abtn">등록</div>
</c:if>
	
<c:if test="${data.ano ne 0}">
			<div id="a${data.qno}">
				<div class="w3-right">${data.adate}</div>
				<div class="abody ${data.qno}">${data.abody}</div>
				<div class="w3-orange w3-button w3-right w3-margin-top w3-margin-bottom edit">수정</div>
			</div>
</c:if>
			
			</div>			
		</div>
</c:forEach>
	</div>
	
<form method="POST" id="frm" name="frm" action="/www/manager/addAnswerProc.dog">
	<input type="hidden" name="body" id="body" name="body">
	<input type="hidden" name="id" value="${MID}">
	<input type="hidden" name="upqno" id="upqno" value="">
	<input type="hidden" name="title" id="title" value ="">
</form>

<c:if test="${MSG eq 'OK'}">
<div id="modal" class="w3-modal" style="display: block;">
	    <div class="w3-modal-content mxw650 w3-animate-top w3-card-4">
	      <header class="w3-container w3-blue"> 
	        <span class="w3-button w3-display-topright" id="modalClose">&times;</span>
	        <h2>GITHRD Message</h2>
	      </header>
	      <div class="w3-container w3-center">
	        <h4>${MSG}</h4>
	      </div>
	    </div>
	</div>
</c:if>
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