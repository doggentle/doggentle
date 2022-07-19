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
	<title>포인트</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/myPage.css'>	
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
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
				<a href="/www/">마이페이지</a>
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
	         					<dd><a href="">회원정보 수정</a></dd>
	         					<dd><a href="">주소록 관리</a></dd>
	         					<dd><a href="">포인트</a></dd> 
	         				</dl>
	         			</div>
	        		</div>
	      		</div>
	   		 </div>
<!-- Middle Column -->
	  <div class="w3-col m9">
	  	<div class="w3-row-padding">
	       	<div class="w3-col m12">
	          	<div class="w3-container w3-card w3-round w3-white">
	            	<div class="w3-col m9 w3-padding">
	            		<img src="/www/img/mailContent.png" class="w3-left w3-margin-right w3-padding" style="width:150px">
	            		<div>
	            			<h3>아이디 : ${SID}</h3>
	            			<h3>${MyInfo.mail}</h3>
							<button class="btn w3-padding-large w3-large">회원정보 수정</button>	            		
						</div>
	            	</div>
	            		<div class="w3-col m3 w3-right w3-center" style="margin-top:40px;">
	            			<div class="w3-col m6">
		            			<h3>${MyInfo.isshow}</h3>
		            			<h5>회원등급</h5>
	            			</div>
	            			<div class="w3-col m6 w3-border-left">
		            			<h3>${MyInfo.money}P</h3>
		            			<h5>포인트</h5>
	            			</div>
	            		</div>
	          	</div>
	        </div>
	      </div>
	      
	      <div class="w3-row-padding"><br> 
	       	<div class="w3-col m12">
	          	<div class="w3-container w3-card w3-round w3-white">
	            	<div class="w3-col w3-padding">
	            		<div class="w3-col m2">
	            			<button class="btn w3-padding-large w3-large">전체내역</button>	
	            		</div>
	            		<div class="w3-col m2">
	            			<button class="btn w3-padding-large w3-large">적립내역</button>	
	            		</div>
	            		<div class="w3-col m5 w3-right w3-center w3-margin-top">
            				<input class="w3-col m5 w3-left date" type="date" id="startDate" >
            				<span> ~ </span>
            				<input class="w3-col m5 w3-right date" type="date" id="endDate" >	
	            		</div>
	            	</div>
	            	<div class="w3-col w3-padding w3-card w3-round w3-white w3-center">
	            		<div class="w3-col m1">
	            			<select class="w3-select w3-border" name="pList" id="pList">
								<option disabled selected>분류</option>
								<option class="w3-center" value="100">적립</option>
								<option class="w3-center" value="200">사용</option>
							</select>	
	            		</div>
	            		<div class="w3-col m7">
	            			<h3>내용</h3> 
	            		</div>
	            		<div class="w3-col m2 w3-right">
	            			<h3>일자</h3>
	            		</div>
	            		<div class="w3-col m2  w3-right">
	            			<h3>금액</h3>
	            		</div> 
	            	</div>
	            	<div class="w3-col"> 
	            		<hr style="border-top: 2px solid #eee"> 
	            	</div>
	          <c:forEach  var="data" items="${POINT}">
	            	<div class="w3-col w3-padding w3-center w3-border-bottom">
	            		<div class="w3-col m1 w3-red">
	            			<h5 class="w3-large">사용</h5>
	            		</div>
	            		<div class="w3-col m7">
	            			<h5>이벤트 당첨</h5> 
	            		</div>
	            		<div class="w3-col m2 w3-right">
	            			<h3>2022-07-17</h3>
	            		</div>
	            		<div class="w3-col m2  w3-right">
	            			<h3>500</h3>
	            		</div>
	            	</div>
	            </c:forEach>	
	            </div> 
	        </div>
	      </div>
	  </div>

<!-- Middle Column end -->
	   	</div>
<!-- Page Container end -->
	  </div>
	  
	  
<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>GenTleDog</h5>
</footer>

</body>
</html>