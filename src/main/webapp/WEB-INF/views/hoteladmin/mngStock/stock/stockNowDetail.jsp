<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style> 
	 .top-divv{
	width: 63.7%;

	height: 70px; 
/* 	margin-left: 20px; */
	}



	#titlemsgg{
		width: 220px;
		height: 50px;
		margin-top: 40px;

	}
	
	#stockTbb{
	width: 100%;
	border-collapse: collapse;

	}
	td{
	height: 30px;
	}
	
	.hrDivv{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-top: 20px;
	}
	.btnss{
	margin-top: 10px;
	margin-right: 59px;
	float: right;
	
	
	}
	#zonee{
	border-bottom: 1px solid black;
	margin-bottom: 10px;
	width: 128px;  
	}
	#hdivv{
/* 	margin-bottom: 20px; */
	margin-left: 20px;
	}
	section{
	padding-left: none !important;
	}
	
	#marginDiv{
	margin-left: 55px;
	overflow-y: auto;
	max-height: 400px;
	margin-top: 21px;
	width: 1000px;
	height: 400px;
	border: 1px solid lightgray;
	} 
	#detail-modify-btn{
	color:white;
	background : royalblue;
	border: 1px solid royalblue;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
</style>
</head>
<body>
	
		
	

	<header>	
		
	
	</header>
		<div id="marginDiv">
			<table id="stockTbb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th>물품코드</th>
					<th>물품명</th>
					<th>공급가액</th>
					<th>부가세</th>
					<th>단가</th>
					<th>제조사</th>
					<th>매입처</th>
					<th>창고명</th>
					<th>위치</th>
				</tr>
				<tbody id="detailBody">
				<c:forEach var="i" begin="1" end="19">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="전자제품"/></td>
						<td style="color: #005B9E"><c:out value="TV"/></td>
						<td><c:out value="36인치 TV"/></td>
						<td><c:out value="1231251253"/></td>
						<td><c:out value="500,000"/></td>
						<td><c:out value="5000"/></td>
						<td><c:out value="500,000"/></td>
						<td><c:out value="삼성전자"/></td>
						<td><c:out value="상찬마트"/></td>
						<td><c:out value="창고A"/></td>
						<td><c:out value="A진열대"/></td>
						
					</tr>
				</c:forEach>
				</tbody>
				<tbody id="detailBody2">
				
				</tbody>
			</table>
				
		</div>
			<div class="btnss">
			<button id="detail-modify-btn">수정</button>&nbsp;
			</div> 
	
	 
	
	
	
	<script>
	
		
		$(function(){
			$("#stockTbb").find("td").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				var bid = $(this).parent().children("td").eq(1).text();
			
				console.log(bid);
			});
		});
		
		
	</script>
	
</body>
</html>