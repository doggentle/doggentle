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
	<title>payment</title>
	
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
	<script type="text/javascript" src="/www/js/pay/payment.js"></script>
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
	<a class="navbar-brand" style="font-size: 20pt; padding-top: 30px;">결제하기</a>
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
	                        <th class="text-center"></th>
	                        <th>Product</th>
	                        <th>Orderer</th>
	                        <th class="text-center">Total</th>
	                        <th> </th>
	                    </tr>
	                </thead>
	                <tbody>
						
	                    <tr>
	                        <td class="col-sm-1 col-md-1 text-center"><strong></strong></td>
	                        <td class="col-sm-8 col-md-6">
		                        <div class="media">
		                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
		                            <div class="media-body">
<c:if test="${not empty ONE}">
		                                <h4 class="media-heading"><a href="#">${ONE.gname} 외 ${ONE.gdsCount - 1}개 품목</a></h4>
</c:if>
		                                <h5 class="media-heading"> by <a href="#">(주)독신사 리테일</a></h5>
		                            </div>
		                        </div>
	                        </td>
	                        <td class="col-sm-3 col-md-3" style="text-align: left">
	                        	<strong>${INFO.id}</strong>
	                        	<h5>${INFO.mail}</h5>
	                        </td>
	                        <td class="col-sm-1 col-md-1 text-center" style="padding:10px; padding-top:30px;">
<c:if test="${not empty ONE}">
	                        	<strong>${ONE.ttlPrice} ￦</strong>
</c:if>
	                        </td>
	                        <td class="col-sm-1 col-md-1">
	                        </td>
	                    </tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
	                    <tr style="margin-top:10px;">
	                        <td>   </td>
	                        <td><h4>받으시는 분</h4></td>
	                        <td><h4>주소</h4></td>
	                        <td><h4>연락처</h4></td>
	                        <td class="text-right"><h4>우편번호</h4></td>
	                    </tr>
	                    <tr>
	                        <td class="text-center col-sm-1 col-md-1">
<c:forEach var="addr" items="${ADDLIST}">
									<h6><input class="adnoCheckBox" type="checkbox" value="${addr.adno}" style="margin:0px;"></h6>
</c:forEach>
	                        </td>
	                        <td>
<c:forEach var="addr" items="${ADDLIST}">
									<h5>${addr.who}</h5>
</c:forEach>
	                        </td>
	                        <td style="padding-top:20px; padding-bottom:20px;">
<c:forEach var="addr" items="${ADDLIST}">
	                        	<p style="display:none;" class="${addr.adno} adno adrs">${addr.adrs}</p>
</c:forEach>
	                        </td>
	                        <td style="padding-top:20px; padding-bottom:20px;">
<c:forEach var="addr" items="${ADDLIST}">
	                        	<p style="display:none;" class="${addr.adno} adno contact">${addr.contact}</p>
</c:forEach>
	                        </td>
		                    <td class="text-right" style="padding-top:20px; padding-bottom:20px;">
<c:forEach var="addr" items="${ADDLIST}">
		                        <p style="display:none;" class="${addr.adno} adno pno">${addr.pno}</p>
</c:forEach>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h4>결제예정금액</h4></td>
<c:if test="${not empty ONE}">
	                        <td class="text-right"><h4><strong>${ONE.ttlPrice} ￦</strong></h4></td>
</c:if>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>
	                        <button type="button" class="btn btn-default" id="goShopping" >
	                            <span class="glyphicon glyphicon-shopping-cart"></span> 장보러 가기
	                        </button></td>
	                        <td>
	                        <button type="button" class="btn btn-success" id="kakaopay" style="color:#232429; background-color:#f7e600; border-color:#f7e600;"> 
	                        	Kakao Pay <span class="glyphicon glyphicon-play"></span>
	                        </button></td>
	                    </tr>
	                </tbody>
	            </table>
						<form id="frm" method="post" name="frm" action="">
							<input id="partner_user_id" name="partner_user_id" type="hidden" value="${INFO.id}">
							<input id="adno" name="adno" type="hidden" value="">
<c:if test="${not empty ONE}">
							<input id="item_name" name="item_name" type="hidden" value="${ONE.gname}">
							<input id="quantity" name="quantity" type="hidden" value="${ONE.gdsCount}">
							<input id="total_amount" name="total_amount" type="hidden" value="${ONE.ttlPrice}">
</c:if>
<c:if test="${not empty LIST}">
<c:forEach var="data" items="${LIST}">
							<input id="${data.cno}" name="cnoArr" type="hidden" value="${data.cno}">
</c:forEach>
</c:if>			
						</form>
	        </div>
	    </div>
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