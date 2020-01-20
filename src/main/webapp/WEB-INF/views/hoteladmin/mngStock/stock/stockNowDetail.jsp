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

	}



	#titlemsgg{
		width: 220px;
		height: 50px;
		margin-top: 40px;

	}
	
	#stockTbb{
	width: 1000px;
	height: 300px;
	border-collapse: collapse;
	border: 1px solid black;
	}
	
	.hrDivv{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-top: 20px;
	}
	.btnss{
	margin-top: 10px;

	}
	#zonee{
	border-bottom: 1px solid black;
	margin-bottom: 10px;
	width: 128px;  
	}
	#hdivv{
	margin-bottom: 20px;
	}
	section{
	padding-left: none !important;
	}
</style>
</head>
<body>
	
		
	

	<header>	
		
	
	</header>
	<div class="hrDivv" id="hdivv"></div> 
		<div>
			<table id="stockTbb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">대분류</th>
					<th style="color: #005B9E">중분류</th>
					<th style="color: #005B9E">소부륜</th>
					<th style="color: #005B9E">제품번호</th>
					<th style="color: #005B9E">공급가액</th>
					<th style="color: #005B9E">부가세</th>
					<th style="color: #005B9E">단가</th>
					<th style="color: #005B9E">제조사</th>
					<th style="color: #005B9E">매입처</th>
					<th style="color: #005B9E">창고명</th>
					<th style="color: #005B9E">위치</th>
				</tr>
				<c:forEach var="i" begin="1" end="6">
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
			</table>
		<div class="hrDivv"></div>
		</div>
			<div class="btnss"><button>수정</button>&nbsp;<button>닫기</button></div> 
	
	 
	
	
	
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