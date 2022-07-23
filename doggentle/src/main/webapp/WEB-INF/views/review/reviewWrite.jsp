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
	<title>출석</title>
<!-- 모달용 -->

	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/myPage.css'>	
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/qna.css"/>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/qna/qna.js"></script>
	<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
	<script type="text/javascript" src="/www/js/review/review.js"></script>
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
	         					<dd><a href="/www/myPage/QnaList.dog">문의 내역</a></dd>
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
<form name="fm" id="frm" method="POST" action="">
	<input type="hidden" name="id" value="${SID}">	
</form>

	  <div class="w3-col m9">
	  	<div class="w3-row-padding">
	       	<div class="w3-col m12">
	          	<div class="w3-container">
	          	  <div class="w3-content mxw700">

  <div class="titbox"><h2>리뷰 작성</h2></div>
  <div class="conboxbg">
    <div class="conbox">
      <table width=500 cellpadding=4 cellspacing=0 border=0 class="pop_write" >
        <col width=50>
      <tr>
         <th>아이디</th>
         <td>${SID}</td>
      </tr>
      <tr>
         <th>별점</th>
<td class="form-group">
   <p class="star-rating">
      <a class="fas fa-star" id="star1" onclick="add(this,1)"></a>
      <a class="fas fa-star" id="star2" onclick="add(this,2)"></a>
      <a class="fas fa-star" id="star3" onclick="add(this,3)"></a>
      <a class="far fa-star" id="star4" onclick="add(this,4)"></a>
      <a class="far fa-star" id="star5" onclick="add(this,5)"></a>
   </p>
</td>
      </tr>
      
      <tr>
         <th>후기 상품</th>
         <td>상품명</td>
      </tr>

      <tr>
         <th>제목</th>
         <td><input type=text id="title" style="width:80%" label="제목" class="dsmform" value=""></td>
      </tr>
      
      <tr>
         <th>내용</th>
         <td>

         <textarea id="contents" style="width:80%;height:100px;" class="dsmform" label="내용" value=""></textarea>

      </td>
      </tr>
      
      <tr>
         <th>이미지</th>
         <td>
            <input value="" type="file" name="file" style="width:80%;" "class="w3-input w3-border w3-margin-bottom upfile" required>
         </td>
      </tr>
      
<c:if test="${empty INFO}">
      <tr style="display: none;" id="previewbox">
      <th>상품이미지</th>
         <td style="overflow: hidden;" id="preview">
              <img src="" height="300px" width="auto" id="img" class="infoAvtBox">
         </td>
      </tr>
</c:if>
<c:if test="${empty INFO}">
      <tr style="display: none;" id="previewbox">
      <th>상품이미지</th>
         <td style="overflow: hidden;" id="preview">
              <img src="" height="300px" width="auto" id="img" class="infoAvtBox">
         </td>
      </tr>
</c:if>
</table>
</div>
  <div class="btnbox2">
    <div class="cen bootstrap">
		<button type="button" id="btn_save" style="width:20%" class="btn-default btn-lg btn-block btn-primary">글쓰기</button>
    </div>
  </div>
   <!-- submit -->

	  </div>
	  </div>
	  </div>
	  </div>
	  </div>
	  </div>
	  </div>
<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>GenTleDog</h5>
</footer>

</body>
</html>