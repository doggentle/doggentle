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
	<title>Cart</title>
	
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
	<script type="text/javascript" src="/www/js/order/cart.js"></script>
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
	<a class="navbar-brand" style="font-size: 20pt; padding-top: 30px;">????????????</a>
	<!-- Start Navigation -->
	<nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
			<ul class="nav navbar-nav">
		<c:if test="${empty SID}">
				<li>
				<a href="/www/member/login.dog">?????????</a>
				</li>
				<li>
				<a href="/www/member/join.dog">????????????</a>
				</li>
		</c:if>
		<c:if test="${not empty SID}">
				<li>
				<a href="/www/member/logout.dog">????????????</a>
				</li>
				<li>
				<a href="/www/myPage/mypagemain.dog">???????????????</a>
				</li>
				<li>
				<a href="/www/myPage/myattend.dog">??????</a>
				</li>
				<li>
				<a href="/www/order/cart.dog">????????????</a>
				</li>
		</c:if>
				<li>
				<a href="/www/qna/qnaWrite.dog">????????????</a>
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
	                        <th style="text-align: center"><input class="cnoCheckBoxController" type="checkbox" name="" value="" style="margin-top:50%;" checked></th>
	                        <th>Product</th>
	                        <th>Quantity</th>
	                        <th class="text-center">Price</th>
	                        <th class="text-center">Total</th>
	                        <th>??</th>
	                    </tr>
	                </thead>
	                <tbody>
						
<c:forEach var="data" items="${LIST}">
	                    <tr>
	                    	<td class="col-sm-1 col-md-1" style="text-align: center">
	                    		<input class="cnoCheckBox" type="checkbox" value="${data.cno}" style="margin-top:50%;" checked>
	                    	</td>
	                        <td class="col-sm-8 col-md-6">
		                        <div class="media">
		                            <a class="thumbnail pull-left" href="#">
		                            	<img class="media-object" src="${data.dir}${data.savename}" onerror="this.onerror=null; this.src='http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png';" style="width: 72px; height: 72px;"> </a>
		                            <div class="media-body">
		                                <h4 class="media-heading"><a href="#">${data.gname}</a></h4><!-- ??? ?????????????????? ????????? ??? ????????? ???????????? -->
		                                <h5 class="media-heading"> by <a href="#">(???)????????? ?????????</a></h5>
		                                <span>?????? : </span><span class="text-success"><strong>${data.stock}</strong></span> <!-- ??? ?????????????????? ????????? ??? ????????? ?????? -->
		                            </div>
		                        </div>
	                        </td>
	                        <td class="col-sm-1 col-md-1" style="text-align: center">
	                        	<input type="email" class="qtyV form-control"  id="${data.cno}" value="${data.quant}"><!--id="??? ??????????????? cno" value="??? ??????????????? quantity"-->
		                        <input type="button" class="qty qtyminus" value="-" style="margin-top:10px; border:0px;"><!-- ?????? ????????? ?????? -->
		                        <input type="button" class="qty qtyplus" value="+" style="margin-top:10px; border:0px;"><!-- ??????   ?????? ?????? -->
	                        </td>
	                        <td class="col-sm-1 col-md-1 text-center"><strong>${data.price} ???</strong></td><!-- ????????????????????? ????????? ??? ????????? price -->
	                        <td class="col-sm-1 col-md-1 text-center"><strong class="${data.cno}">${data.price * data.quant} ???</strong></td><!-- ????????????????????? ????????? ??? ????????? quantity * price -->
	                        <td class="col-sm-1 col-md-1">
		                        <button type="button" class="btn btn-danger cartDel" value="${data.cno}">
		                            <span class="glyphicon glyphicon-remove"></span> Remove
		                        </button>
	                        </td>
	                    </tr>
</c:forEach>
<c:if test="${empty LIST}">
						<tr>
							<td></td>
							<td></td>
							<td>
								<strong>??????????????? ???????????? ????????? ????????????.</strong>
							</td>
							<td></td>
						</tr>
</c:if>
	                    <tr>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td><h5>????????????</h5></td>
	                        <td class="text-right"><h5><strong class="totalPxQ"></strong></h5></td>
	                        <td> ?? </td>
	                    </tr>
	                    <tr>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td><h5>?????????</h5></td>
	                        <td class="text-right"><h5><strong class="deliveryPrice"></strong></h5></td>
	                        <td> ?? </td>
	                    </tr>
	                    <tr>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td><h4>Total</h4></td>
	                        <td class="text-right"><h3><strong class="totalPrice"></strong></h3></td>
	                        <td> ?? </td>
	                    </tr>
	                    <tr>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td> ?? </td>
	                        <td>
	                        <button type="button" class="btn btn-default" id="goShopping" >
	                            <span class="glyphicon glyphicon-shopping-cart"></span> ????????? ??????
	                        </button></td>
	                        <td>
	                        <button type="button" class="btn btn-success" id="goPayment" style="background-color:#428bca; border-color:#428bca;">
	                            ???????????? ?????? <span class="glyphicon glyphicon-play"></span>
	                        </button></td>
	                        <td> ?? </td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	    </div>
	</div>
						<form id="frm" method="post" name="frm" action="">
						</form>
<footer style="margin-top: 100px;">
	<div class="bottom section-padding">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<div class="copyright">
						<p>?? <span>2022</span> <a href="/www/main.dog" class="transition">doggentle</a> All rights reserved.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
</body>
</html>