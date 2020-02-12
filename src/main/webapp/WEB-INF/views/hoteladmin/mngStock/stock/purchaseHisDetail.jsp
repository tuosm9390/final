<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매상세</title>
<style>
	.top-divv{
		width:1100px;
		margin-bottom: 20px;
		margin-top: 38px;
	} 
	.same{
	display: inline-block;

	}
	#person{
	
	}
	#resultTap{
	background-color: #f7f7f7;
	
	height: 30px;
	}
	#Tablee {
	width: 1200px;
	border-collapse: collapse;
    margin-top: 35px;
	}
	#day1{
	margin-left: 35px;
	}
	
	#person1{
	margin-left: 19px;
	}
	#etc{
	margin-left: 50px;
	}
	#etcText{
	margin-left: 20px;
	}
	#Tablee th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	#Tablee td,#Tablee th{
		border: 1px solid lightgray;
		text-align: center;
		
	}
	#mainMsg{
	font-size: 20px;
	}
	#hrodiv2{
	margin-top: 10px;
	}
	#purWrap{
	margin-left: 50px;
	margin-top: 20px;
	
	}
	#mState{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	margin-left: 90%;
    margin-top: 15px;
	}
</style>
</head>
<body>
	<div id="purWrap">
		<div class="top-divv">
		<div id="day" class="same">
			구매 요청 일자
			<input type="text" id="day1" name="day1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;담당자
			<input type="text" id="person1" name="person1">
		</div>
			<br> 
			
			
		</div><!-- top-div end -->
	<div id="Tablee" style="width: 1100px; overflow-y:auto; max-height: 300px;border: 1px solid lightgray;height:300px " >
		<table style="width: 100%;" class="orderHisDetailTable" >
			<tr class="thArea">
				<th>ITEM NO</th>
				<th>대분류</th>
				<th>중분류</th>
				<th>소분류</th>
				<th>제품명</th>
				<th>단가</th>
				<th>공급가액</th>
				<th>부가세</th>
				<th>거래처</th>
			</tr>
		</table>
			</div><!-- tableeDiv end -->
	</div> <!-- purWrap end -->
		
	<footer>
	</footer>
	
</body>
</html>