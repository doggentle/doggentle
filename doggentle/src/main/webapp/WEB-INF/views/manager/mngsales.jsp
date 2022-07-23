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
	<title>관리자 매출관리</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script src="/www/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/graph.js"></script>
	
	
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
	<div class="box65 w3-center" style="margin-top: 100px;">
		<a href="/www/manager/main.dog"><h1>매출 관리</h1></a>
	</div>
	<div class="w3-center w3-margin w3-padding">
		<div style="display: flex; justify-content: end;">
		<select id="type">
			<option value="daily" selected>일 단위</option>
			<option value="monthly">월 단위</option>
		</select>
		</div>
		<div>
		<div id="day">
			<h3>일별 매출</h3>
			<canvas id="myChart1"></canvas>
		</div>
		<div id="month">
			<h3>월별 매출</h3>
			<canvas id="myChart2"></canvas>
		</div>
		<h3>카테고리별 매출</h3>
		<canvas id="myChart3"></canvas>
		</div>
	</div>
</div>
</body>
<script>
const ctx1 = document.getElementById('myChart1');

const myChart1 = new Chart(ctx1, {
    type: 'line', 
    data: {
        labels: ['${DAY[0].label}','${DAY[1].label}','${DAY[2].label}','${DAY[3].label}','${DAY[4].label}','${DAY[5].label}'],
        datasets: [{
            label: '금액',
            data: [${DAY[0].data}, ${DAY[1].data}, ${DAY[2].data}, ${DAY[3].data}, ${DAY[4].data}, ${DAY[5].data}],
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
const ctx2 = document.getElementById('myChart2');

const myChart2 = new Chart(ctx2, {
    type: 'line', 
    data: {
        labels: ['${MONTH[0].month}','${MONTH[1].month}','${MONTH[2].month}','${MONTH[3].month}','${MONTH[4].month}','${MONTH[5].month}'],
        datasets: [{
            label: '금액',
            data: [${MONTH[0].data}, ${MONTH[1].data}, ${MONTH[2].data}, ${MONTH[3].data}, ${MONTH[4].data}, ${MONTH[5].data}],
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


const ctx3 = document.getElementById('myChart3');

const myChart3 = new Chart(ctx3, {
    type: 'bar', 
    data: {
        labels: ['${CATE[0].label}','${CATE[1].label}','${CATE[2].label}','${CATE[3].label}'],
        datasets: [{
            label: '총액',
            data: [${CATE[0].data}, ${CATE[1].data}, ${CATE[2].data}, ${CATE[3].data}],
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