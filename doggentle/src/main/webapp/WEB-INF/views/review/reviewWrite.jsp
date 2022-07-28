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
	<link rel='stylesheet' href="/www/css/test.css"/>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/tmddus.js"></script>
	<script type="text/javascript" src="/www/js/qna/qna.js"></script>
	<script type="text/javascript" src="/www/js/myPage/myPage.js"></script>
	<script type="text/javascript" src="/www/js/review/review.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
	<script src="/www/js/bootstrap.min.js"></script>
	
	
	
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
				<a href="/www/qna/qnaWrite.dog">문의하기</a>
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

<form name="frm" id="frm" method="POST" action="/www/review/reviewWriteProc.dog" enctype="multipart/form-data">

	  <div class="w3-col m9">
	  	<div class="w3-row-padding">
	       	<div class="w3-col m12">
	          	<div class="w3-container">
	          	  <div class="w3-content mxw700">

  <div class="titbox"><h2>리뷰 작성</h2></div>
  <div class="conboxbg">
    <div class="conbox">
      <table class="pop_write" >
        <col width=50>
      <tr>
         <th class="rvlb">아이디</th>
         <td class="rvval">${SID}</td>
      </tr>
      <tr>
         <th class="rvlb">별점</th>
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
         <th class="rvlb">상품명</th>
         <td class="rvval">${GNAME}</td>
      </tr>
      <tr>
         <th class="rvlb">제목</th>
         <td><input type=text id="title" name="title" class="w3-col m10 w3-input w3-border" value="" required></td>
      </tr>
      <tr>
         <th class="rvlb">내용</th>
         <td>
         <textarea id="body" name="body" style="resize: none;" class="w3-col w3-input w3-padding w3-border m10" rows="7" required></textarea>
      </td>
      </tr>
      <tr>
         <th class="rvlb">이미지</th>
         <td id="filebox">
            <input value="" type="file" id="file" name="file" class="w3-col w3-input w3-border m10 upfile">
         </td>
      </tr>      
      <tr style="display: none;" id="previewbox">
      	 <th class="rvlb">리뷰사진</th>
         <td style="overflow: hidden;" id="preview">
 			<div class="inblock pdAll10 picbox w3-card">
                <div class="w3-center m10 w3-col w3-border w3-margin-right" style="overflow: hidden;">
                   <img src="" height="300px" width="auto" id="img" class="infoAvtBox">
                </div>
             </div>
         </td>
      </tr>

</table>
</div>
  <div class="btnbox2">
    <div class="cen bootstrap">
		<button type="button" id="reviewbtn" class="w3-margin btn-default btn-lg btn-primary">글쓰기</button>
    </div>
  </div>
  <input type="hidden" id="score" name="score" value="3">
  <input type="hidden" id="tno" name="tno" value="${TNO}">
  
   <!-- submit -->

	  </div>
	  </div>
	  </div>
	  </div>
	  </div>
	  </div>
</form>
	  </div>
	  </div>
</body>
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
</html>