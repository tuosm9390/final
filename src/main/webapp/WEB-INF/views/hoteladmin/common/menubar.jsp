<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${ contextPath }/resources/css/Nwagon.css" type="text/css">
<script src="${ contextPath }/resources/js/Nwagon.js"></script>
<!-- 데이트피커 -->
<link href="${ contextPath }/resources/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="${ contextPath }/resources/js/datepicker.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- Korean language -->
<script src="${ contextPath }/resources/js/datepicker.kr.js"></script>
<meta charset="UTF-8">
<title>HotelsCompile</title>
<style type="text/css">
	body {
	   font-family: 'Noto Sans KR', sans-serif;
	}
	
	.menubar{
		/* width:100%; */
		width:98.5%;
		height:100px;
		background:#060E33;
		margin-left:-8px;
		margin-top:-8px;
		position: fixed;
	}
	.menu{
		display:inline-block;
		text-align:center;
		font-weight: bold;
		color:white;
		list-style:none;
	}
	.logoimg{
		width:200px;
		height:50px;
		padding-bottom:18px;
/* 		padding-left:5px; */
	}
	.tabimg{
		margin-top:10px;
		width:56px;
		height:56px;
	}
	.tab{
		margin-left:30px;
		height:100px;
	}
	.bellimg{
		width:40px;
		height:40px;
	}
	.userArea{
		display:table;
		width:400px;
		text-algin:center;
		heigth:100px;
		float: right;
		margin-top:13px;
	}
	.leftArea{
		width:70px;
	}
	.midArea{
		width:115px;
		padding-top: 5px;
	}
	.rightArea{
		width:115px;
		background:#EAC064;
		margin-top:25px;
		margin-right:30px;
		color:black;
	}
	.logoutBtn{
		display:table-cell; text-align:center; vertical-align:middle;
	}
	.rightArea:hover{
		background:#886007;
		color:white;
		cursor:pointer;
	}
	.tab:hover{
		z-index:3;
		width:64px;
		cursor:pointer;
		background:lightgray;
		opacity: 1;
	}
	.subnav{
		width:100px;
		height:100px;
		background-image:url('resources/images/menuSub.png');
		background-repeat:no-repeat;
		background-size:100px;
		list-style: none;
		text-align: center;
		display:none;
		position: absolute;
		top: 100%;
		left:-30%;
		color:black;
		font-weight:bold;
		padding:0;
		opacity: 1;
		padding-top:18px;
	}
	.subnav2{
		padding-top:18px;
		width:100px;
		height:100px;
		background-image:url('resources/images/menuSub.png');
		background-repeat:no-repeat;
		background-size:100px;
		list-style: none;
		text-align: center;
		display:none;
		position: absolute;
		top: 100%;
		left:-30%;
		color:black;
		font-weight:bold;
		opacity: 1;
	}
	.reservation{
		position: relative;
	}
	.contract{
		position: relative;
	}
	/* 판매분석 */
	.analys{
		position: relative;
	}
	.subnav-analys{
		width: 150px;
		height:50px;
		background-image:url('resources/images/menuSub.png');
		background-repeat:no-repeat;
		background-size:150px;
		list-style: none;
		text-align: center;
		display:none;
		position: absolute;
		top: 100%;
		left:-65%;
		color:black;
		font-weight:bold;
		padding-top:18px;
		opacity: 1;
	}
	section{
		padding-top: 92px;
	}
</style>
</head>
<body>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }"  scope="application" />
	<ul class="menubar">
		<li class="menu logo">
				<img alt="" src="${ contextPath }/resources/images/logo.png"  class="logoimg">
		</li>
		<li class="menu tab t1" onclick="location.href='view.ro'">
				<img alt="" src="${ contextPath }/resources/images/iconRoom.png"  class="tabimg"><br>
				<label>객실관리</label>
		</li>
		<li class="menu tab t2 reservation">
				<img alt="" src="${ contextPath }/resources/images/iconReservation.png"  class="tabimg"><br>
				<label>예약관리</label><br>
				<div class="subnav">
					<!-- ▲<br> -->
					<a href="viewNow.re">예약현황</a><br>
					<a href="viewHis.re">예약내역</a>
				</div>
		</li>
		<li class="menu tab t3 materiel">
				<img alt="" src="${ contextPath }/resources/images/iconWMS.png"  class="tabimg"><br>
				<label>재고관리</label>
		</li>
		<li class="menu tab t4" onclick="location.href='viewList.cl'">
				<img alt="" src="${ contextPath }/resources/images/iconCS.png"  class="tabimg"><br>
				<label>고객관리</label>
		</li>
		<li class="menu tab t5 analys">
				<img alt="" src="${ contextPath }/resources/images/iconFinance.png"  class="tabimg"><br>
				<label>판매분석</label>
				<div class="subnav-analys">
					<a href="viewTrendList.hadmin">영업트렌드</a><br>
					<a href="viewDetailList.hadmin?Condition=sales">매출 및 지불 상세</a>
				</div>
		</li>
		<li class="menu tab t6 contract">
				<img alt="" src="${ contextPath }/resources/images/iconContract.png"  class="tabimg"><br>
				<label>전자결재</label>
				<div class="subnav2">
					<a href="documentApproval.ap">결재함</a><br>
					<a href="joinDocumentApproval.ap">참여결재함</a>
				</div>
		</li>
		<li class="menu tab t7" onclick="location.href='goSetting.st'">
				<img alt="" src="${ contextPath }/resources/images/iconSettings.png"  class="tabimg"><br>
				<label>관리</label>
		</li>
		<li class="menu userArea">
			<div class="menu userArea rightArea" onclick="location.href='logout.me'">로그아웃</div>
			<div class="menu userArea midArea">
				<label class="userName">전세환<br>(총지배인)</label>
			</div>
			<div class="menu userArea leftArea">
				<img alt="" src="${ contextPath }/resources/images/iconBell.png" class="bellimg">
			</div>
		</li>
	</ul>

	<script type="text/javascript">
	$(function(){
		$(".reservation").click(function(){
			$(this).parents().children().find(".subnav").slideDown('normal').show();
			$(this).hover(function(){
				
			},function(){
				$(this).parent().find(".subnav").slideUp('fast');
			})
		});
		$(".contract").click(function(){
			$(this).parents().children().find(".subnav2").slideDown('normal').show();
			$(this).hover(function(){
				
			},function(){
				$(this).parent().find(".subnav2").slideUp('fast');
			})
		});
		$(".analys").click(function(){
			$(this).parents().children().find(".subnav-analys").slideDown('normal').show();
			$(this).hover(function(){
				
			},function(){
				$(this).parent().find(".subnav-analys").slideUp('fast');
			})
		});
		$(".t1").hover(function(){
			$(".hover1").show();
		});
	});
	console.log($(".t1").offset().top);
	console.log($(".t1").offset().left);
	</script>
	
	<script>
		$(function(){
			$(".materiel").click(function(){
				location.href='goMateriel.hadmin';
			})
		});
		
	</script>
</body>
</html>