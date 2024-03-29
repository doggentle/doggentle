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
	<link rel='stylesheet' href="/www/css/test.css"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/gDetail/gDetail.js"></script>
	<script type="text/javascript" src="/www/js/category/category.js"></script>
	<script type="text/javascript" src="/www/js/category/search.js"></script>
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
		<a href="#hero" class="navbar-brand"><img src="/www/img/logo.png" width="250px" height="auto"><span></span></a>
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
		<a href="/www/order/cart.dog">장바구니</a>
		</li>
		<li>
		<a href="/www/qna/qnaWrite.dog">문의하기</a>
		</li>
</c:if>
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
<div class="container">
	<div class="w3-content">
		<div class="w3-col w3-center w3-padding w3-margin-bottom">
			<h1>물품 카테고리 선택</h1>
		</div>
		<div class="w3-col w3-center w3-margin-bottom">
			<div class="w3-col">
				<div class="w3-third">
					<select class="w3-col w3-select w3-border w3-center" id="cate1">
						<option disabled selected>카테고리1</option>
		<c:forEach var="data" items="${LIST}">
					<option value="${data.cano}">${data.caname}</option>
		</c:forEach>
					</select>
				</div>
				<div class="w3-third" style="padding-left: 5px;">
					<select class="w3-col w3-select w3-border w3-center" id="cate2">
						<option disabled selected>카테고리2</option>

					</select>
				</div>
				<div class="w3-third" style="padding-left: 5px;">
					<select class="w3-col w3-select w3-border w3-center" id="cate3">
						<option disabled selected>카테고리3</option>
					</select>
				</div>
			</div>

		</div>

	</div>
	</div>

    <br/>
<div class="container">
	<div class="box65 w3-center">
    <br/>
                        <div class="w3-container">
                                 <i class="fas fa-search h4 text-body"></i>
                             <!--end of col-->
                                 <input class="search" type="search" id="keyword" name="keyword" placeholder="찾으시는 상품을 입력해주세요">
                             <!--end of col-->
                             	<input type="hidden" name="gname" id="gname" >
                             <!--end of col-->
                                 <button class="schbtn btn btn-lg btn-success w3-hover-green" id="srcbtn">Search</button>
                        </div>
	</div>
</div>

<!-- 슬라이드 -->

<div class="container">
	<hr>
	<div class="row">
	  			<!-- 제품 리스트 페이지... -->
		<div>
			<h1>검색된 상품</h1>
			<hr>
		</div>
		<form method="POST" action="/www/gDetail/gDetail.dog" name="frm" id="frm">
			<input type="hidden" name="gno"  id="gno" value="">
			<input type="hidden" id="schstr" name="schstr" value="">
		</form>

		<div class="w3-col w3-margin-top" id="gPanel"></div>
		<div class="w3-col w3-margin-top" id="sPanel"></div>
		<div>
			<h1>새로운 상품</h1>
		</div>
			<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
	            <div class="MultiCarousel-inner">
	<c:forEach var="data" items="${NEW}">
	                <div class="item" style="width:500px;">
	                    <div class="pad15" style="height: 245px;">
					<a href="/www/gDetail/gDetail.dog?gno=${data.gno}">
	                        <img src="${data.dir}${data.savename}" width="auto" height="100px">
	                        <div style="height: 80px;">
		                        <h5>${data.gname}</h5>
	                        </div>
                      	    <h5>${data.label}원</h5>
	                </a>
	                    </div>
	                </div>
	</c:forEach>
			</div>
				<button class="btn-primary leftLst arrow"><</button>
	            <button class="btn-primary rightLst arrow">></button>
		</div>
	</div>
<hr>
<div>
	<h1>
		인기상품
	</h1>
</div>

			<div class="w3-col m12 w3-center w3-margin">
<c:forEach var="data" items="${HIT}" begin = "0" end="7">
				<div class="w3-col m3 w3-margin-top">
					<a href="/www/gDetail/gDetail.dog?gno=${data.gno}">
			               <img class="img-fluid" src="${data.dir}${data.savename}" width="auto" height="200px" alt="">
			               	<h5 class="w3-margin" style="height:45px;">${data.gname}</h5>
	              			<h6>판매량 : ${data.hit}개</h6>
		               		<h6>${data.label}원</h6>
					</a> 
				</div>
</c:forEach>
			</div>
      </div>
      
      
<footer style="margin-top: 100px;">
		<div class="bottom section-padding">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<div class="copyright">
							<p>© <span>2022</span> <a href="#" class="transition">doggentle</a> All rights reserved.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
</footer>

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