<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<meta charset="UTF-8">
<title>구매상세</title>
<style> 
	.top-divv{
		width:735px; 
		margin-bottom: 20px;
	}
	.samee{
	display: inline-block;

	}
	
	#resultTap{
	background-color: lightgray;
	
	height: 30px;
	}
	#Table {
	width: 1200px;
	border-collapse: collapse;
	}
	
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	
	#day1{
	margin-left: 34px;
	}
	.person{
	display: inline-block;
	}
	#person1{
	margin-left: 19px;
	}
	#person2{
	margin-left: 19px;
	}  
	#etc{
	margin-left: 226px;
	}
	#etcText{
	margin-left: 27px;  
	}
	#titlemsg{
	font-size: 20px;
	}
	.hrhr{
	border-bottom: 1px solid black;
	width: 1200px;
	margin-bottom: 10px;
	margin-top: 10px;
	}
	#request{
	margin-left: 220px;
	}
	#wrapp{
	margin-left: 50px;
	
	margin-top: 10px;
	}
	#TableDiv{
	overflow-y: auto;
	max-height: 300px;
	width: 1200px;
	}
	
	#day2{
	display: none;
	}
	input[type=text] {
		border-radius:2px;
		border:1px solid lightgray;
		height:20px;
	}
</style>
</head>
<body>
	<header>
	
	</header>
	
	
	<div id="wrapp">
	    <div class="top-divv">
		<div id="day" class="samee">
			일자
			<input type="text" id="day1" name="day1" style="text-align:center;">
			<input type="text" id="day2" name="day2">
			
		</div>
		   <div id="etc" class="samee">거래처 <input type="text" id="etcText" style="text-align:center;">
		</div>
			<br> 
			<div class="person" >
			결제자
			<input type="text" id="person1" name="person1" style="text-align:center;">
			
			</div>
			<div class="person" id="request">
			수리번호
			<input type="text" id="person2" name="person1" style="text-align:center;">
			</div>
		</div><!-- top-div end -->
		
		<div id="TableDiv">
		<table id="Table" border="1px solid black;">
			<tr class="repairDetail">
				<th>번호</th>
				<th>소분류</th>
				<th>공급가액</th>
				<th>제품명</th>
				<th>부가세</th>
				<th>수리비용</th>
				
			</tr>
			<!-- 실사용은 list size -->
		</table>
		
	</div>
	</div>
	<footer>
	</footer>
	

</body>
</html>