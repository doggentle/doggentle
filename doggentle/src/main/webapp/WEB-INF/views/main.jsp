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

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/category/category.js"></script>
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
			<!-- 제품 리스트 페이지... -->
		<form method="POST" action="/www/cate/productDetail.dog" name="frm" id="frm">
			<input type="hidden" name="gno" >
		</form>
		<div class="w3-col w3-margin-top" id="gPanel">
		</div>
    <br/>
<div class="container">
	<div class="box65 w3-center">
    <br/>
                     <form class="">
                        <div class="w3-container">
                                 <i class="fas fa-search h4 text-body"></i>
                             <!--end of col-->
                                 <input class="search" type="search" placeholder="찾으시는 상품을 입력해주세요">
                             <!--end of col-->
                                 <button class="schbtn btn btn-lg btn-success w3-hover-green" type="submit">Search</button>
                             <!--end of col-->
                        </div>
                     </form>
	</div>
</div>

<!-- 슬라이드 -->

<div class="container">
	<hr>
	<div class="row">
	<div>
		<h1>새로운 상품</h1>
	</div>
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
            <div class="MultiCarousel-inner">
  
                <div class="item">
                    <div class="pad15">
                <a href="">
                        <img src="/www/img/test.png" width="100px" height="auto">
                        <p>상품이름</p>
                        <p>30,000원</p>
                </a>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15">
                        <p class="lead">Multi Item Carousel</p>
                        <p>₹ 1</p>
                        <p>₹ 6000</p>
                        <p>50% off</p>
                    </div>
                </div>
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

<div class="container">
         <div class="row">
         </div>
         <div class="portfolio-item row">
            <div class="item selfie col-lg-3 col-md-4 col-6 col-sm w3-center">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="/www/img/test.png" width="200px" height="auto" alt="">
               <p>제목</p>
               <p>얼마얼마</p>
               </a>
            </div>
           <div class="item selfie col-lg-3 col-md-4 col-6 col-sm w3-center">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="/www/img/test.png" width="200px" height="auto" alt="">
               <p>제목</p>
               <p>얼마얼마</p> 
               </a>
            </div>
    <div class="item selfie col-lg-3 col-md-4 col-6 col-sm w3-center">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="/www/img/test.png" width="200px" height="auto" alt="">
               <p>제목</p>
               <p>얼마얼마</p>
               </a>
            </div>
    <div class="item selfie col-lg-3 col-md-4 col-6 col-sm w3-center">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="/www/img/test.png" width="200px" height="auto" alt="">
               <p>제목</p>
               <p>얼마얼마</p>
               </a>
            </div>
           <div class="item selfie col-lg-3 col-md-4 col-6 col-sm">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" alt="">
               </a>
            </div>
          <div class="item selfie col-lg-3 col-md-4 col-6 col-sm">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" alt="">
               </a>
            </div>
           <div class="item selfie col-lg-3 col-md-4 col-6 col-sm">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" alt="">
               </a>
            </div>
         <div class="item selfie col-lg-3 col-md-4 col-6 col-sm">
               <a href="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" class="fancylight popup-btn" data-fancybox-group="light"> 
               <img class="img-fluid" src="https://image.freepik.com/free-photo/stylish-young-woman-with-bags-taking-selfie_23-2147962203.jpg" alt="">
               </a>
            </div>
         </div>
      </div>
</div>
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