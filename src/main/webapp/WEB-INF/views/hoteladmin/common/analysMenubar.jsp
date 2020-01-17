<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<style>
.analysMenubarArea {
	width: 250px;
	height: 800px;
	float: left;
	border-right-width: 1px;
	border-right-style: solid;
	border-right-color: lightgray;
}

.analysMenubar {
	list-style: none;
	position: relative;
	padding-left: 15px;
}

.analysMenubar ul {
	list-style: none;
	font-weight: bold;
	font-size: 18px;
	color: white;
	margin-left: 15px;
}

.analysMenubar-item div {
	background: black;
	margin-top: 10px;
	width: 80%;
	text-align: center;
	border-radius: 10px;
	border: 3px solid black;
	cursor: pointer;
}

.analysMenubar-item div:hover{
	background: white;
	color: black;
}

/* 리스트 css */
.analysMenubar-item {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

.analysMenubar-item {
	position: relative;
	margin-left: 10px;
}

.analysMenubar-item:before {
	content: "";
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 0;
	border-left: 2px solid black;
}

.analysMenubar-item li {
	position: relative;
	padding: 3px 12px;
}

.analysMenubar-item li:before {
	content: "";
	display: block;
	position: absolute;
	top: 25px;
	left: 0;
	width: 12px;
	height: 0;
	border-top: 2px solid black;
}

.analysMenubar-item li:last-child:before {
	top: 27px;
	bottom: 0;
	height: auto;
	background: white;
}
</style>
<body>
	<div class="analysMenubarArea">
		<div class="analysMenubar">
			<h2 style="margin-bottom: 10px; margin-top: 0;">매출 및 지불 상세</h2>
			<div style="border: 2px solid black; width: 82%; margin-top: 0;"></div>
			<ul class="analysMenubar-item">
				<li><div id="sales" class="analys-item sales ${ Condition eq 'sales' ? 'active' : '' }">매출 상세</div></li>
				<li><div id="spend" class="analys-item spend ${ Condition eq 'spend' ? 'active' : '' }">지불 상세</div></li>
			</ul>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".active").css({"background":"white", "color":"black"});
		});
		
		$(".analys-item").click(function(){
			var Condition = $(this).attr('id');
			location.href='viewTrendList.hadmin?Condition=' + Condition;
		});
	</script>
</body>
</html>