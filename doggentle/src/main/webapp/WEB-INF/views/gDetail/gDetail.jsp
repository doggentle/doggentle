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
	 	<input type="hidden" name="gno" id="gno" value="${gno}">
	 </form>
<div class="container">
		<div class="gcard">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="/www${DATA.dir}${DATA.savename}" style="height:400px;"/></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">

						</ul>
						
					</div>
					
					<div class="gdetails col-md-6">
					
						<h4 class="product-title" id="gname">상품명 : ${DATA.gname}</h4>
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
		<div class="view_con">
		<a name="viewtab1"></a> 
		<!-- 상세 설명s -->
		<div class="tab_list">
			<ul>
				<li class="ov first"><a href="#viewtab1">상품상세정보</a></li>
				<li><a href="#viewtab2">관련상품</a></li>
				<li><a href="#viewtab3">배송정보</a></li>
				<li><a href="#viewtab4">교환 및 반품안내</a></li>
							</ul>
		</div>
		<div class="view_detail" id=contents>
			<table width=100%>
				<tr>
					<td> <p><img src="https://img.junglebook.co.kr/scm/desc/pQulJuxrxZElcEvp26FJcT21dM2XRBN8yWPqxt4H.jpeg" style="width: 860px;" class="fr-fic fr-dib"></p>
					</td>
				</tr>
			</table>
		</div>
		<!-- 상세 설명e --> 
		<!-- 관련상품 --> 
		<a name="viewtab2" id="viewtab2"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">상품상세정보</a></li>
				<li class="ov"><a href="#viewtab2">관련상품</a></li>
				<li><a href="#viewtab3">배송정보</a></li>
				<li><a href="#viewtab4">교환 및 반품안내</a></li>
			</ul>
		</div>
		<div>
			<hr>
				<h1>관련 상품</h1>
			<hr>
		</div>
<c:forEach var="DATA" items="${LIST}">
        	<div class="w3-center w3-quarter product w3-padding">
        	<div class="w3-margin-bottom w3-col w3-border">
        	<img class="gbtn" src="/www${DATA.dir}${DATA.savename}" alt="Product" style="width:30%; height: 100px; cursor: pointer;">
        	<div class="w3-col" style="height: 92px;">
	        	<div>상품명 : ${DATA.gname}</div>
	        	<div>가  격 : ${DATA.price}</div>
        	</div>
        	</div>
        	</div>
</c:forEach>

		<div class="w3-col w3-margin-top" id="gPanel"></div>
 
		<!-- 배송안내 --> 
		<a name="viewtab3"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">상품상세정보</a></li>
				<li><a href="#viewtab2">관련상품</a></li>
				<li class="ov"><a href="#viewtab3">배송정보</a></li>
				<li><a href="#viewtab4">교환 및 반품안내</a></li>
							</ul>
		</div>
		<div class="tab_box">
			<div class="con">
				<ul>
					<li>기본배송료는 박스수량 관계 없이 3,500원 입니다. (도서,산간,오지 일부지역은 배송비가 추가될 수 있습니다)</li>
					<li>본 상품의 평균 배송일은 3 일입니다.(입금 확인 후) 설치 상품의 경우 다소 늦어질수 있습니다.[배송예정일은 주문시점(주문순서)에 따른 유동성이 발생하므로 평균 배송일과는 차이가 발생할 수 있습니다.]</li>
				    <li>반품 배송비: 2,500원</li>
				    <li>교환 배송비: 5,000원 (왕복 택배비)</li>
				    <li>고객님의 단순 변심으로 인한 반품 시 반품택배비는 고객님이 부담해야 합니다.</li>
				    <li>단, 교환/반품 상품 중 상품불량 또는 상품정보 상이로 인한 반송비는 독신사에서 부담합니다.</li>
				    
				</ul>
				</hr>
		        <ul> 
				<h4>퀵배송</h4>
      			<h2>퀵배송 주문가능 시간내 주문건은 당일배송</h2>
		        <li>서울지역에서 서비스를 이용하실 수 있습니다.</li> 
		        <li>월~금 00:00 ~ 13:59 주문건에 대해 당일 퀵배송이 가능합니다.</li>
		        <li>토요일/일요일/휴일 퀵배송 주문이 불가능 합니다.</li> 
        </ul>
			</div>
		</div>
		<a name="viewtab4"></a>
		<div class="tab_list">
			<ul>
				<li class="first"><a href="#viewtab1">상품상세정보</a></li>
				<li><a href="#viewtab2">관련상품</a></li>
				<li><a href="#viewtab3">배송정보</a></li>
				<li class="ov"><a href="#viewtab4">교환 및 반품안내</a></li>
							</ul>
		</div>
		<div class="tab_box">
			<div class="con">
				<span class="tit">교환/반품 안내</span>
				<ul>
					<li>상품 청약철회 가능기간은 상품 수령일로 부터 7일 이내 입니다.</li>
					<li>상품 택(tag)제거 또는 개봉으로 상품 가치 훼손 시에는 일 이내라도 교환 및 반품이 불가능합니다.</li>
					<li>저단가 상품, 일부 특가 상품은 고객 변심에 의한 교환, 반품은 고객께서 배송비를 부담하셔야 합니다(제품의 하자,배송오류는 제외)</li>
					<li>일부 상품은 신모델 출시, 부품가격 변동 등 제조사 사정으로 가격이 변동될 수 있습니다.</li>
					<li></li>
					<li>단순 변심의 경우 최초 배송된 상품의 상태와 다를 시(세탁/착용 후 외출하신 경우) 교환 및 반품이 불가합니다.</li>
				    <li>상품의 택과 라벨, 기타 부속품(신발 박스, 단추, 벨트 등)이 훼손되어 재판매가 불가능할 경우 교환 및 반품이 불가할 수 있습니다.</li>
				    <li>주얼리/언더웨어 상품은 착용 후 상품이 훼손(오염 등)되어 재판매가 불가능할 경우 교환 및 반품이 불가할 수 있습니다.</li>
				    <li>화장품은 상품 개봉 후 상품을 사용하거나 상품이 훼손되어 재판매가 불가능할 경우 교환 및 반품이 불가할 수 있습니다.</li>
				    <li>구매한 상품의 구성품(세트 상품 중 일부 상품, 사은품, 증정품 등)이 누락된 경우 교환 및 반품이 불가할 수 있습니다.</li>
				</ul>
				<span class="tit">교환/반품이 불가능한 경우</span>
				<ul>
					<li>신발의 경우, 실외에서 착화하였거나 사용흔적이 있는 경우에는 교환/반품 기간내라도 교환 및 반품이 불가능 합니다.</li>
					<li>수제화 중 개별 주문제작상품(굽높이,발볼,사이즈 변경)의 경우에는 제작완료, 인수 후에는 교환/반품기간내라도 교환 및 반품이 불가능 합니다.</li>
					<li>수입,명품 제품의 경우, 제품 및 본 상품의 박스 훼손, 분실 등으로 인한 상품 가치 훼손 시 교환 및 반품이 불가능 하오니, 양해 바랍니다.</li>
					<li>일부 특가 상품의 경우, 인수 후에는 제품 하자나 오배송의 경우를 제외한 고객님의 단순변심에 의한 교환, 반품이 불가능할 수 있사오니, 각 상품의 상품상세정보를 꼭 참조하십시오. </li>
				</ul>
			</div>
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