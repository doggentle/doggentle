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
	<title>Thank you!</title>
	
	<!-- Styles -->
	<!-- <link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	JavaScript
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js//order/cart.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous"> -->
	<link rel='stylesheet' href="/www/css/test.css"/>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" src="/www/js/pay/payAfter.js"></script>
	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>

	<link rel="shortcut icon" href="/www/img/favicon.ico">
	
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
	
	<header id="header" class="navbar navbar-inverse navbar-fixed-top" role="banner" style="display:contents;">
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
	<a class="navbar-brand" style="font-size: 20pt; padding-top: 30px;">주문/결제</a>
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
				<a href="/www/qna/qnaWrite.dog">문의하기</a>
				</li>
			</ul>
	</nav>
</div>
</header>


	<div class="container">
	    <div class="row">
	        <div class="col-sm-12 col-md-10 col-md-offset-1">
	            <table class="table table-hover">
	                <thead>
	                    <tr>
	                        <th></th>
	                        <th><h4>주문이 정상적으로 완료 되었습니다.</h4></th>
	                        <th class="text-center"></th>
	                        <th class="text-center"></th>
	                        <th> </th>
	                    </tr>
	                </thead>
	                <tbody>
						
	                    <tr>
	                        <td>   </td>
	                        <td>
	                        	<a class="thumbnail pull-left" href="#"> <img class="media-object" src="" onerror="this.onerror=null; this.src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png';" style="width: 72px; height: 72px;"> </a>
	                        </td>
	                        <td class="col-sm-2 col-md-2"><h5>주문번호</h5></td>
	                        <td>
	                        	<h5 id="tid"></h5>
	                        	<h5 id="aid"></h5>
	                        	<h5 id="partner_order_id"></h5>
	                        	<h5 id="tno"></h5>
	                        </td>
	                        <td class=""></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h5>배송지 정보</h5></td>
	                        <td>
	                        	<h5 id="who"></h5>
	                        	<h5 id="contact"></h5>
	                        	<h5 id="pno"></h5>
	                        	<h5 id="adrs"></h5>
	                        </td>
	                        <td class="text-right"></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>
	                        	<h5>받을 수 있는 포인트</h5>
	                        	<h6 class="text-right">구매 완료 시</h6>
	                        	<h6 class="text-right">리뷰 작성 시</h6>
	                        </td>
	                        <td>
	                        	<h6 class="text-right" style="margin-top:36px;">0000</h6>
	                        	<h6 class="text-right" style="margin-bottom:5px;">0000</h6>
	                        </td>
	                        <td class="text-right"></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>
	                        <button type="button" class="btn btn-default" id="goMainPage" >
	                            <span class="glyphicon glyphicon-shopping-cart"></span> 메인으로 돌아가기
	                        </button></td>
	                        <td>
	                        <button type="button" class="btn btn-success" id="goMyPage" style="background-color:#428bca; border-color:#428bca;">
	                            리뷰 작성하러 가기 <span class="glyphicon glyphicon-play"></span>
	                        </button></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
						<input type="hidden" id="pgtkn" value="${pg_token}">
						<input type="hidden" id="partner_user_id" value="${partner_user_id}">
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