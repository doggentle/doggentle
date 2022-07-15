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
	<title>DogGentle</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/gDetail.css"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/gDetail/gDetail.js"></script>
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
		<a href="/www/myPage/myattend.dog">출석</a>
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
	 <form method="POST" action="" id="frm" name="frm">
	 	<input type="hidden" name="sgno" id="sgno" value="${sgno}">
	 </form>
<div class="container">
		<div class="gcard">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="/www${DATA.dir}${DATA.savename}" style="height:400px;"/></div>
						  <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="http://placekitten.com/200/126" /></a></li>
						</ul>
						
					</div>
					
					<div class="gdetails col-md-6">
					
						<h3 class="product-title" id="gname">상품명 : ${DATA.gname}</h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<h4 class="price">제품코드 : ${DATA.gno}</h4>						
						<p class="product-description">${DATA.gdetail}</p>
						<h4 class="price">가격 : <span id="price" name="price">${DATA.price}</span></h4>
						<h5 class="gsizes">남은 수량 : <span id="stock" name="stock" >${DATA.stock}</span></h5>
                    <div class="qsection" style="padding-bottom:20px;">
                        <h6 class="title-attr"><small>수량</small></h6>                    
                        <div>
                            <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                            <input id="quantity" value="1" />
                            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                        </div>
                    </div>                
       
						<div class="action">
							<button class="add-to-cart btn btn-default" type="button" id="cbtn">장바구니</button>
							<button class="add-to-cart btn btn-default" type="button" id="bbtn">구매하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detail_col">
                    <ul class="gmenu-items">
                        <li class="gactive">상품상세</li>
                        <li class="gactive">상품리뷰</li>
                        <li class="gactive">QnA</li>
                    </ul>
                    <div style="width:100%;border-top:1px solid silver">
                        <p style="padding:15px;">
								<span id="gDetail">${DATA.gdetail}</span>
                        </p>
                        <small>
                            <ul>
<img src="https://img.junglebook.co.kr/scm/desc/vNrKvQjBMyoKFWMri1sJOKi77U3rIkbYSULPTdOF.jpeg">
                            </ul>  
                        </small>
                    </div>
                </div>		
	</div>
<!-- Intro
	================================================== -->

<!-- Bootstrap core JavaScript
	================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<!-- Bootstrap core JavaScript
	================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
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