<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.gentle.www.util.MyCalendar"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>출석</title>
	
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
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/myPage/attend.js"></script>
	<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
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
	
<style type="text/css">
/* 기본스타일  */	
	table{ background-color: white;}
	
	tr{height: 60px;}
	td{width: 100px; height: 100px; text-align: left; font-size: 15pt; font-family: D2coding;} 
/* 타이틀 스타일 */
	th#title {font-size: 20pt; font-weight: bold; color: white; font-family: D2coding; }

/* 요일 스타일 */
	td.sunday{ text-align: center; font-weight: bold; color: red; font-family: D2coding; }
	td.saturday{ text-align: center; font-weight: bold; color: blue; font-family: D2coding; }
	td.etcday{ text-align: center; font-weight: bold; color: black; font-family: D2coding; }

/* 날짜 스타일 */
	td.sun{ font-size: 15pt; color: red; font-family: D2coding; vertical-align: top;}
	td.sat{ font-size: 15pt; color: blue; font-family: D2coding; vertical-align: top;}
	td.etc{ font-size: 15pt; color: black; font-family: D2coding; vertical-align: top;}
	
	td.redbefore{ text-align: right; font-size: 12pt; color: red; font-family: D2coding; vertical-align: top;}
	td.before{ text-align: right; font-size: 12pt; color: gray; font-family: D2coding; vertical-align: top;}
</style>
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
				<a href="/www/myPage/qnaWrite.dog">문의하기</a>
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
	       	<div class="w3-col m12 w3-cneter">
	          	<div class="w3-container w3-center">
	            	
	            	<!-- 달력 만들기 -->
						<table class="w3-col w3-center" border ="1" cellpadding="5" cellspacing="0">
							<tr style="background-color: #389de0;">
						<!-- 이전달 버튼 만들기 --> 
								<th class="w3-left " style="border: none; margin: 1em auto; padding-bottom: 10px;">
									<input type="button" class="w3-large w3-blue" style="border-color: white" value="이전 달" id="prev">
								</th>
								 
						<!-- 제목 만들기 -->
								<th class="w3-center"id = "title" colspan = "5">
									${ATTEND.year}년  ${ATTEND.month}월
								</th>
								 
						<!-- 다음달 버튼 만들기 -->
								<th class="w3-right " style="border: none; margin: 1em auto; padding-bottom: 10px;">
									<input type="button" class="w3-large w3-blue" style="border-color: white" value="다음 달" id="next">
								</th>
							</tr>
						<!-- 요일 표시칸 만들어주기(단, 토,일요일은 색을 다르게 하기위해 구분해주기) -->
							<tr>
								<td class = "sunday">일</td>
								<td class = "etcday">월</td>
								<td class = "etcday">화</td>
								<td class = "etcday">수</td>
								<td class = "etcday">목</td>
								<td class = "etcday">금</td>
								<td class = "saturday">토</td>
							</tr>
							
						<!-- 날짜 집어 넣기 -->
						
							<tr id="setcalendar">
						<c:forEach var="beforeDay" items="${ATTEND.sDate}" varStatus="status">
							<c:choose>
								<c:when test="${status.count == 1 && beforeDay != 1}">
									<td class ="redbefore" id="redbefore">${beforeDay}</td>
								</c:when>
								<c:when test="${status.count == 1 && beforeDay == 1}">
									<td class ="sun w3-center" id="${beforeDay}"><h5 class='w3-left-align'>${beforeDay}</h5></td>
								</c:when>
								<c:when test="${(status.count % 7) == 1}">
									<td class ="sun w3-center" id="${beforeDay}"><h5 class='w3-left-align'>${beforeDay}</h5></td>
									<c:choose>
										<c:when test="${status.last == true}">
											<c:choose>
												<c:when test="${status.count <= 35}">
													<c:forEach var="pullday" begin="${status.count + 1}" end="35" step="1">
														<td></td>
													</c:forEach>
												</c:when>
												<c:when test="${status.count > 35}">
													<c:forEach var="pullday" begin="${status.count + 1}" end="42" step="1">
														<td></td>
													</c:forEach>
												</c:when>
											</c:choose>
										</c:when> 
									</c:choose>
								</c:when>
								<c:when test="${(status.count % 7 ) == 0}">
									<td class ="sat w3-center" id="${beforeDay}"><h5 class='w3-left-align'>${beforeDay}</h5></td>
									<c:choose> 
										<c:when test="${status.last == true}">
											 
										</c:when> 
										<c:otherwise> 
											</tr><tr>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<c:choose> 
										<c:when test="${beforeDay > 7 && status.count < 7}">
											<td class ="before" id="before">${beforeDay}</td>
										</c:when>
										<c:otherwise>
											<td class ="etc w3-center" id="${beforeDay}"><h5 class='w3-left-align'>${beforeDay}</h5></td>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${status.last == true}">
											<c:choose>
												<c:when test="${status.count <= 35}">
													<c:forEach var="pullday" begin="${status.count + 1}" end="35" step="1">
														<td></td>
													</c:forEach>
												</c:when>
												<c:when test="${status.count > 35}">
													<c:forEach var="pullday" begin="${status.count + 1}" end="42" step="1">
														<td></td>
													</c:forEach>
												</c:when>
											</c:choose>
										</c:when>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:forEach>
							</tr>
						</table>
	            	</div>
	            	
	            </div>
            </div>
       	</div> 
<!-- Middle Column end -->
	   	</div>
<!-- Page Container end -->	 
	  </div>
	  
	  <form method="POST" action="/www/myPage/myattend.dog" id="frm" name="frm">
	  	<input type="hidden" id="year" name="year" value="${ATTEND.year}">
	  	<input type="hidden" id="month" name="month" value="${ATTEND.month}">
	  </form>
	  <input type="hidden" id="myattend" value="${MYATTEND}">
<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>GenTleDog</h5>
</footer>
	<div id="msgWin" class="w3-modal">
	    <div class="w3-modal-content w3-animate-top w3-card-4">
			<header class="w3-container w3-blue"> 
		        <span class="w3-button w3-display-topright" id="msgClose">&times;</span>
		        <h2>알림 메세지</h2>
			</header>
	    	<div class="w3-container">
	        	<h3 class="w3-center w3-margin-top w3-margin-bottom" id="msg">출석이 완료 되었습니다. 100포인트 지급되었습니다.</h3>
	    	</div>
	    </div>
 	</div>
</body>
</html>