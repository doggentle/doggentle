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
	<link rel='stylesheet' href="/www/css/test.css"/>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
	<script src="/www/js/bootstrap.min.js"></script>

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
				<a href=/www/qna/qnaWrite.dog>문의하기</a>
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
	         					<dd><a href="/www/myPage/myOrderList.dog">주문내역</a></dd>
	         					<dd><a href="/www/order/cart.dog">장바구니</a></dd>
	         					<dt class="w3-block">회원활동</dt>
	         					<dd><a href="/www/myPage/QnaList.dog">문의 내역</a></dd>
	         					<dd><a href="/www/review/reviewList.dog">리뷰관리</a></dd>
	         					<dd><a href="/www/myPage/myattend.dog">출    석</a></dd>
	         					<dt class="w3-block">회원정보</dt>
	         					<dd><a href="">프로필 정보</a></dd>
	         					<dd><a href="/www/myPage/memberinfopwck.dog">회원정보 수정</a></dd>
	         	 				<dd><a href="/www/myPage/addressList.dog">주소록 관리</a></dd>
	         					<dd><a href="/www/myPage/myPoint.dog">포인트</a></dd> 
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
	            	<div class="w3-col" style="margin: 15px 0px;">
	            		<div class="w3-col m2">
	            			<button class="btn w3-padding-large w3-large" id="allbtn">전체내역</button>	
	            		</div>
	            		<div class="w3-col m2">
	            			<button class="btn w3-padding-large w3-large" id="apbtn">적립내역</button>	
	            		</div>
            				<button class="btn w3-margin w3-right" id="seldate">조회</button>
	            		<div class="w3-col m5 w3-right w3-center w3-margin-top">
            				<input class="w3-col m4 w3-left date" type="date" id="startDate" >
            				~
            				<input class="w3-col m4 w3-right date" type="date" id="endDate" >
	            		</div>
	            	</div>
	            	<div class="w3-col w3-padding w3-card w3-round w3-white w3-center">
	            		<div class="w3-col m1">
	            			<h3>분류</h3>	
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
	          <c:forEach  var="data" items="${LIST}">
	            	<div class="w3-col w3-padding w3-center w3-border-bottom">
	            	 <c:choose>
	            	 	<c:when test="${data.upno eq 200}">
		            		<div class="w3-col m1 w3-red">
		            			<h5 class="w3-large">사용</h5>
		            		</div>
	            	 	</c:when>
	            	 	<c:when test="${data.upno eq 100}">
		            		<div class="w3-col m1 w3-green">
		            			<h5 class="w3-large">적립</h5>
		            		</div>
	            	 	</c:when>
	            	 	<c:otherwise>
		            	 	<div class="w3-col m1 w3-gray">
		            			<h5 class="w3-large">오류</h5>
		            		</div>
	            	 	</c:otherwise>
	            	 </c:choose>
	            		<div class="w3-col m7">
	            			<h5>${data.body}</h5> 
	            		</div>
	            		<div class="w3-col m2 w3-right">
	            			<h3>${data.odate}</h3>
	            		</div>
	            		<div class="w3-col m2  w3-right">
	            			<h3>${data.pvalue}</h3>
	            		</div>
	            	</div>
	            </c:forEach>
	            	<div class="w3-center">
						<div class="w3-bar w3-border w3-round-medium w3-card w3-margin-top w3-margin-bottom">
				<c:if test="${PAGE.startPage eq 1}">
							<div class="w3-bar-item w3-light-grey">&laquo;</div>
				</c:if>
				<c:if test="${PAGE.startPage ne 1}">
							<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.startPage - 1}">&laquo;</div>
				</c:if>
				<c:forEach var="page" begin="${PAGE.startPage}" end="${PAGE.endPage}">
						<c:if test="${page eq PAGE.nowPage}">
							<div class="w3-bar-item w3-orange">${page}</div>
						</c:if>
						<c:if test="${page ne PAGE.nowPage}">
							<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${page}">${page}</div>
						</c:if>
				</c:forEach>
						<c:if test="${PAGE.endPage eq PAGE.totalPage}">
							<div class="w3-bar-item w3-light-grey">&raquo;</div>
						</c:if>
						<c:if test="${PAGE.endPage ne PAGE.totalPage}">
							<div class="w3-bar-item w3-button w3-hover-blue pbtn" id="${PAGE.endPage + 1}">&raquo;</div>
						</c:if>
						</div>
					</div>	
	            </div> 
	        </div>
	      </div>
	  </div>

<!-- Middle Column end -->
	   	</div>
<!-- Page Container end -->
	  </div>

<form method="POST" action="/www/myPage/myPoint.dog" id="frm" name="frm">
		<input type="hidden" name="nowPage" id="nowPage" value="${PAGE.nowPage}">
		<input type="hidden" name="supno" id="supno" value="${DATE.supno}">
		<input type="hidden" name="startdate" id="startdate" value="${DATE.startdate}">
		<input type="hidden" name="enddate" id="enddate" value="${DATE.enddate}">
</form>
	  
<!-- Footer -->
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