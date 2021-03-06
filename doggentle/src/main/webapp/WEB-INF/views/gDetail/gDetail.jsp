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
	<link rel='stylesheet' href="/www/css/test.css"/>
	<script src="/www/js/bootstrap.min.js"></script>

<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/gDetail/gDetail.js"></script>	
	
	
	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
			
	<!-- Favicon -->
	<link rel="shortcut icon" href="/www/img/favicon.ico">
<style type="text/css">   

      	  .star {
  position: relative;
  font-size: 2rem;
  color: #ddd;
}

.star input {
  width: 100%;
  height: 100%;
  position: absolute;
  left: 0;
  opacity: 0;
  cursor: pointer;
}

.star span {
  width: 0;
  position: absolute; 
  left: 0;
  color: red;
  overflow: hidden;
  pointer-events: none;
}
      </style>
	
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
	 <form method="POST" action="" id="frm" name="frm">
	 	<input type="hidden" name="sgno" id="sgno" value="${sgno}">
	 	<input type="hidden" name="gno" id="gno" value="${DATA.gno}">
	 </form>
<div class="container">
		<div class="gcard">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="${DATA.dir}${DATA.savename}" height="400px" width="auto"/></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">

						</ul>
						
					</div>
					
					<div class="gdetails col-md-6">
					
						<h3 class="product-title" id="gname">????????? : ${DATA.gname}</h3>
					<span class="w3-right mgb10 ft10">
   					</span>
				<div class="wrap-star">
					<h2>?????? : ${DATA.score}</h2>
					<div class='star-rating2'>
						<span style="width: ${DATA.score*20}%"></span>
					</div>
				</div>
						<h4 class="price">???????????? : ${DATA.gno}</h4>						
						<p class="product-description">??????</p>
						<h4 class="price">?????? : <span id="price" name="price">${DATA.price}???</span></h4>
						<h5 class="gsizes">?????? ?????? : <span id="stock" name="stock" >${DATA.stock}</span></h5>
                    <div class="qsection" style="padding-bottom:20px;">
                        <h6 class="title-attr"><small>??????</small></h6>                    
                        <div>
                            <div class="btn-minus"><span class="glyphicon glyphicon-minus"></span></div>
                            <input id="quantity" value="1" />
                            <div class="btn-plus"><span class="glyphicon glyphicon-plus"></span></div>
                        </div>
                    </div>                
       
						<div class="action">
							<button class="add-to-cart btn btn-default" type="button" id="cbtn">????????????</button>
							<button class="add-to-cart btn btn-default" type="button" id="bbtn">????????????</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="view_con">
		<a name="viewtab1"></a> 
		<!-- ?????? ??????s -->
		<div class="tab_list">
			<ul>
				<li class="ov first"><a href="#viewtab1">??????????????????</a></li>
				<li><a href="#viewtab2">????????????</a></li>
				<li><a href="#viewtab3">?????? ??????</a></li>
				<li><a href="#viewtab4">?????? ??? ????????????</a></li>
							</ul>
		</div>
		<div class="view_detail" id=contents>
			<table width=100%>
				<tr>
					<td>
					<div class="w3-center">${DATA.gdetail}</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- ?????? ??????e --> 
		<!-- ???????????? --> 
		<a name="viewtab2" id="viewtab2"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">??????????????????</a></li>
				<li class="ov"><a href="#viewtab2">????????????</a></li>
				<li><a href="#viewtab3">?????? ??????</a></li>
				<li><a href="#viewtab4">?????? ??? ????????????</a></li>
			</ul>
		</div>
		<div>
			<hr>
				<h1>?????? ??????</h1>
			<hr>
		</div>
<c:forEach var="test" items="${LIST}">
        	<div class="w3-center w3-quarter product w3-padding">
        	<a href="/www/gDetail/gDetail.dog?gno=${test.gno}">
        	<div class="w3-margin-bottom w3-col w3-border">
        	<img src="${test.dir}${test.savename}" alt="Product" style="width:30%; height: 100px;">
        	<div class="w3-col" style="height: 92px;">
	        	<div>????????? : ${test.gname}</div>
	        	<div>???  ??? : ${test.price}???</div>
	        	<div>${test.caname}</div>
        	</div>
        	</div>
        	</a>
        	</div>
</c:forEach>

		<div class="w3-col w3-margin-top" id="gPanel"></div>
 
		<!-- ???????????? --> 
		<a name="viewtab3"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">??????????????????</a></li>
				<li><a href="#viewtab2">????????????</a></li>
				<li class="ov"><a href="#viewtab3">?????? ??????</a></li>
				<li><a href="#viewtab4">?????? ??? ????????????</a></li>
							</ul>
		</div>

<div class="w3-col m9">
<!-- ???????????? ?????? -->
	   	 	<h1 class="w3-margin-left">?????? ??????</h1>
	   	 	<hr>
<c:forEach var="rdata" items="${RLIST}">
		<div class="w3-col w3-round-large w3-card-2 w3-margin-bottom w3-padding" style="margin-left: 40px; width: 80%; display: flex; align-items: center;">
			<div class="w3-col m3">
				<img src="${rdata.dir}${rdata.savename}" class="w3-border w3-border-grey w3-margin-right">
			</div>
			<div class="w3-rest w3-padding">
				<div class="w3-col w3-border-bottom">
					<span class="mgb10 ft10">????????? : ${rdata.rdate}</span>
							<span class="w3-button w3-border ft10 w3-red w3-right" id="rdelbtn"><small>??????</small></span>
							<span class="w3-button w3-border ft10 w3-gray w3-right" id="reditbtn"><small>??????</small></span>
				</div>
				<div class="w3-col">
					<span class="mgb10 ft10"><b class="w3-margin-top">????????? : ${rdata.gname}</b></span>
					<div class="w3-right mgb10 ft10">   
						<div class="wrap-star">
							<div class='star-rating1'>
								<span style="width: ${rdata.score*20}%;"></span>
							</div>
						</div>
  					</div>
				<div class="w3-col w3-margin-top">
					<span class="w3-col ft12 w3-border-bottom">?????? : ${rdata.title}</span>
				</div>
				<div class="w3-col">
					<span class="w3-col ft12">?????? : ${rdata.body}</span>
				</div>
				</div>
			</div>
		</div>
</c:forEach>		
		
	</div>

		<a name="viewtab4"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">??????????????????</a></li>
				<li><a href="#viewtab2">????????????</a></li>
				<li><a href="#viewtab3">?????? ??????</a></li>
				<li class="ov"><a href="#viewtab4">?????? ??? ????????????</a></li>
							</ul>
		</div>
		<div class="tab_box">
			<div class="con">
				<span class="tit">??????/?????? ??????</span>
				<ul>
					<li>?????? ???????????? ??????????????? ?????? ???????????? ?????? 7??? ?????? ?????????.</li>
					<li>?????? ???(tag)?????? ?????? ???????????? ?????? ?????? ?????? ????????? ??? ???????????? ?????? ??? ????????? ??????????????????.</li>
					<li>????????? ??????, ?????? ?????? ????????? ?????? ????????? ?????? ??????, ????????? ???????????? ???????????? ??????????????? ?????????(????????? ??????,??????????????? ??????)</li>
					<li>?????? ????????? ????????? ??????, ???????????? ?????? ??? ????????? ???????????? ????????? ????????? ??? ????????????.</li>
					<li></li>
					<li>?????? ????????? ?????? ?????? ????????? ????????? ????????? ?????? ???(??????/?????? ??? ???????????? ??????) ?????? ??? ????????? ???????????????.</li>
				    <li>????????? ?????? ??????, ?????? ?????????(?????? ??????, ??????, ?????? ???)??? ???????????? ???????????? ???????????? ?????? ?????? ??? ????????? ????????? ??? ????????????.</li>
				    <li>?????????/???????????? ????????? ?????? ??? ????????? ??????(?????? ???)?????? ???????????? ???????????? ?????? ?????? ??? ????????? ????????? ??? ????????????.</li>
				    <li>???????????? ?????? ?????? ??? ????????? ??????????????? ????????? ???????????? ???????????? ???????????? ?????? ?????? ??? ????????? ????????? ??? ????????????.</li>
				    <li>????????? ????????? ?????????(?????? ?????? ??? ?????? ??????, ?????????, ????????? ???)??? ????????? ?????? ?????? ??? ????????? ????????? ??? ????????????.</li>
				</ul>
				<span class="tit">??????/????????? ???????????? ??????</span>
				<ul>
					<li>????????? ??????, ???????????? ?????????????????? ??????????????? ?????? ???????????? ??????/?????? ??????????????? ?????? ??? ????????? ????????? ?????????.</li>
					<li>????????? ??? ?????? ??????????????????(?????????,??????,????????? ??????)??? ???????????? ????????????, ?????? ????????? ??????/????????????????????? ?????? ??? ????????? ????????? ?????????.</li>
					<li>??????,?????? ????????? ??????, ?????? ??? ??? ????????? ?????? ??????, ?????? ????????? ?????? ?????? ?????? ?????? ??? ?????? ??? ????????? ????????? ?????????, ?????? ????????????.</li>
					<li>?????? ?????? ????????? ??????, ?????? ????????? ?????? ????????? ???????????? ????????? ????????? ???????????? ??????????????? ?????? ??????, ????????? ???????????? ??? ????????????, ??? ????????? ????????????????????? ??? ??????????????????. </li>
				</ul>
			</div>
		</div>
			</div>
	</div>
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