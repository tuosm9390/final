<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오우쒜에에에엣</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- 데이트피커 -->
<link href="${ contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${ contextPath }/resources/js/datepicker.min.js"></script>

<!-- Korean language -->
<script src="${ contextPath }/resources/js/datepicker.kr.js"></script>
<style>
.top-bar {
	top: 0;
	display: inline-flex;
	height: 42px !important;
}
.title_image{
	top: 0;
	width: 100%;
}

.site-navigation {
	padding-top: 0.3%;
	float: right;
	z-index: auto;
}

.site-navigation:hover {
	cursor: pointer;
}

.navigation--main{
	position: fixed;
	height: 300px;
	background: rgba(0, 0, 0, .5);
    top: 40px;
    right: 0;
    width: 260px;
    min-height: 300px;
    margin-left: 0;
    list-style: none;
    list-style-type: none;
    list-style-position: initial;
    list-style-image: initial;
    z-index: 4;
	display: none;
}

.navigation--main .sub-menu.sub-menu-open{
	z-index: 11;
}

.navigation--main .sub-men{
	right: auto;
	left: 100%;
}

.navigation ul{
	padding: 0;
}

.fixed-bar{
	position: fixed;
	background: white;
	z-index: 5;
}

.fixed-bar .info{
	font-size: 13px;
    display: inline;
    color: lightgray;
}

.tel-info{
	margin-left: 40px;
}

.email-info{
	margin-left: 20px;
}

.copyright-info{
    margin-right: 40px;
}

.right-bar{
	right: 0;
}

.left-bar{
	left: 0;
}

.vertical-bar{
	top:0;
	bottom:0;
	height:100%;
	width: 40px;
}

.horizontal-bar{
	z-index: 15;
    right: 0;
    left: 0;
    width: 100%;
    height: 40px;
    background: white;
}

.bottom-bar{
	bottom: 0;
}
.nav > li{
	display: inline-block;
	zoom: 1;
}

.nav>li>a:hover{
	background-color: rgba(238, 238, 238, .6);
}

.nav--main li{
	width: 100%;
}

.nav--main > li a{
	position: relative;
    display: block;
    width: 100%;
    padding: 12px 24px;
    color: white;
    font-size: 18px;
    font-weight: 700;
    letter-spacing: 0.1em;
    line-height: 28px;
}

a{
	text-decoration: none;
}

section{
	padding: 2.15%;
	padding-top: 0;
}

body{
	margin: 0;
	background: rgba(211, 211, 211, .2);
}

input[type=text], select, button, textarea{
	border: 1px solid #919191;
	border-radius: 4px;
	height: 24px;
	resize: none;
}

button{
	background: #E5E5E5;
	border-radius: 4px;
	border: none;
}
</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"></c:set>
	<jsp:include page="reservationModalForm.jsp"/>
	<jsp:include page="surroungdingsModal.jsp"/>
	<div class="fixed-bar horizontal-bar top-bar">
			<div align="center" class="title_image">
				<a href="">
					<img src="${ contextPath }/resources/images/title.png">
				</a>
			</div>
			<div class="site-navigation">
				<span class="nav-icon icon--lines">
					<img src="${ contextPath }/resources/images/menu.png">
				</span>
			</div>
	</div>
		
	<div class="navigation  navigation--main" id="js-navigation--main">
		<ul id="menu-main-menu" class="nav  nav--main  sub-menu"
			data-level="1">
			<li><a href="goMain.hmain">HOME</a></li>
			<li><a>RESERVATION</a></li>
			<li><a href="goRooms.hmain">ROOMS</a></li>
			<li><a>SURROUNDINGS</a></li>
			<li><a href="goQnA.hmain">1:1</a></li>
		</ul>
	</div>
	
	<div class="fixed-bar  vertical-bar  left-bar" style="transform: matrix(1, 0, 0, 1, 0, 0);">
	</div>
	
	<div class="fixed-bar  vertical-bar  right-bar" style="transform: matrix(1, 0, 0, 1, 0, 0);">
	</div>
	
	<section></section>
	
	<div class="fixed-bar  horizontal-bar  bottom-bar" style="transform: matrix(1, 0, 0, 1, 0, 0);">
		<footer class="site-footer">
			<div class="footer-container" style="margin-top: 10px;">
				<span class="info tel-info">
					TEL : 02-000-0000
				</span>
				<span class="info email-info">
					EMAIL : helloworld@kakao.co.kr
				</span>
				<span class="info copyright-info" style="float: right;">
					2019 © HOTEL BOUTIQUE. ALL RIGHTS RESERVED.
				</span>
				
			</div>
		</footer>
	</div>
	
	<script>
		$(".site-navigation").click(function(){
			$(".navigation").toggle('fast');
		});
		
		$(function(){
			$(".nav--main li:nth-child(2)").click(function(){
				$(".reservation-modal").fadeIn();
			});
			
			$(".nav--main li:nth-child(4)").click(function(){
				$(".sur-modal").fadeIn();
			});
		});
	</script>
</body>
</html>