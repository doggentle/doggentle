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
	<title>관리자 페이지</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/test.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/manager.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
<!-- Begin Hero Bg -->
<div id="parallax">
</div>
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
		<a href="/www/manager/main.dog" class="navbar-brand"><img src="/www/img/logo.png" width="250px" height="auto"><span></span></a>
	</div>
	<!-- Start Navigation -->
	<nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
	<ul class="nav navbar-nav">
<c:if test="${not empty MID}">
		<li> 
		<a href="/www/member/logout.dog">로그아웃</a>
		</li>
</c:if>
		<li>
		<a href="/www/manager/market.dog">마켓통계</a>
		</li>
		<li>
		<a href="/www/manager/member.dog">회원관리</a>
		</li>
		<li>
		<a href="/www/manager/sales.dog">매출관리</a>
		</li>
		<li>
		<a href="/www/manager/goods.dog">상품관리</a>
		</li>
		<li>
		<a href="/www/manager/inquiry.dog">문의관리</a>
		</li>
	</ul>
	</nav>
</div>
</header>

<!-- Intro
	================================================== -->
<div class="container">
	<div class="box65 w3-center w3-margin-bottom" style="margin-top: 120px;">
	<p class="w3-margin">관리자 페이지</p>

	</div>
	<div class="w3-margin w3-padding">
		<div class="w3-col w3-light-grey w3-center w3-border">
			<div class="w3-col m3 w3-border-right"><h4>오늘 로그인한 회원 수</h4></div>
			<div class="w3-col m3 w3-border-right"><h4>오늘 판매 건수</h4></div>
			<div class="w3-col m3 w3-border-right"><h4>오늘 판매 금액</h4></div>
			<div class="w3-col m3 w3-border-right"><h4>판매 총액</h4></div>
		</div>
		<div class="w3-col w3-center w3-border">
			<div class="w3-col m3 w3-border-right"><h4>${TODAY}</h4></div>
			<div class="w3-col m3 w3-border-right"><h4>${SUM.data}</h4></div>		
			<div class="w3-col m3 w3-border-right"><h4>${SUM.sum}</h4></div>
			<div class="w3-col m3 w3-border-right"><h4>${SUM.total}</h4></div>
		</div>
	</div>
	
	
	<div class="w3-center">
		<h3 style="margin-top: 100px;">로그인 횟수<span style="font-size: 12pt"> (단위:일)</span></h3>
		<canvas id="myChart"></canvas>
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


<script>
const ctx = document.getElementById('myChart');

const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['${DAY[0]}', '${DAY[1]}', '${DAY[2]}', '${DAY[3]}', '${DAY[4]}', '${DAY[5]}'],
        datasets: [{
            label: '로그인 횟수',
            data: [${DATA[0]}, ${DATA[1]}, ${DATA[2]}, ${DATA[3]}, ${DATA[4]}, ${DATA[5]}], 
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

</html>