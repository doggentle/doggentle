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
	<title>관리자 마켓통계</title>
	
	<!-- Styles -->
	<link rel='stylesheet' href='/www/css/bootstrap.min.css'>
	<link rel='stylesheet' href='/www/css/animate.min.css'>
	<link rel='stylesheet' href="/www/css/font-awesome.min.css"/>
	<link rel='stylesheet' href="/www/css/style.css"/>
	<link rel='stylesheet' href="/www/css/tmddus.css"/>
	<link rel='stylesheet' href="/www/css/w3.css"/>
	<link rel='stylesheet' href="/www/css/manager.css"/>
	
	
	<!-- JavaScript -->
	<script type="text/javascript" src="/www/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="/www/js/manager/graph.js"></script>
	
	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Raleway:200,300,400,500,600,700,800' rel='stylesheet' type='text/css'>

	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
	<![endif]-->
			
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
			
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
		<a href="/www/member/main.dog">관리자</a>
		</li>
		<li>
		<a href="/www/member/logout.dog">로그아웃</a>
		</li>
</c:if>
		<li>
		<a href="/www/">카테고리</a>
		</li>
		<li>
		<a href="/www/">마켓정보</a>
		</li>
		<li>
		<a href="/www/">문의하기</a>
		</li>
	</ul>
	</nav>
</div>
</header>

<!-- Intro
	================================================== -->
<div class="container">
	<div class="box65 w3-center" style="margin-top: 100px;">
		<h1>마켓 통계</h1>
	</div>
	<div class="w3-center w3-margin w3-padding">
		<h3>가입한 회원 수<span style="font-size: 10pt;"> (단위:월)</span></h3>
		<canvas id="myChart1"></canvas>
	</div>
	<div class="w3-center">
		<div style="width:500px; height: auto; display: inline-block;">
		<h3>성비</h3>
			<canvas id="myChart2"></canvas>
		</div>
		<div style="width:500px; height: auto; display: inline-block;">
		<h3>카테고리 별 판매율</h3>
			<canvas id="myChart3"></canvas>
		</div>
	</div>
</div>


</body>

<script>
const ctx1 = document.getElementById('myChart1');
const myChart = new Chart(ctx1, {
    type: 'bar',
    data: {
        labels: ['${LIST[0].month}','${LIST[1].month}','${LIST[2].month}','${LIST[3].month}','${LIST[4].month}','${LIST[5].month}'],
        datasets: [{
            label: '가입한 회원 수',
            data: [${LIST[0].data}, ${LIST[1].data}, ${LIST[2].data}, ${LIST[3].data}, ${LIST[4].data}, ${LIST[5].data}],
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
    	plugins: {
	    	legend: {
	    	    display: false
	    	}
    	}	
	}
});

const ctx2 = document.getElementById('myChart2');
let chart = new Chart(ctx2, {
    type: 'pie',
    data:{
        labels: ['남자', '여자'],
        datasets: [{
            label: '# of Votes',
            data: [${DATA[0].data}, ${DATA[1].data}],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 99, 132, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(255, 99, 132, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        plugins: {
            legend: {
                labels: {
                    // This more specific font property overrides the global property
                    font: {
                        size: 14
                    }
                }
            }
        }
    } 
});
    
const ctx3 = document.getElementById('myChart3');
let chart2 = new Chart(ctx3, {
    type: 'pie',
    data:{
        labels: ['${CATE[0].label}', '${CATE[1].label}', '${CATE[2].label}', '${CATE[3].label}'],
        datasets: [{
            label: '# of Votes',
            data: [${CATE[0].data}, ${CATE[1].data}, ${CATE[2].data}, ${CATE[3].date}],
            backgroundColor: [
            	'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
    	plugins: {
	    	legend: {
	    	    display: false
	    	}
    	}	
	}
});
</script>
</html>