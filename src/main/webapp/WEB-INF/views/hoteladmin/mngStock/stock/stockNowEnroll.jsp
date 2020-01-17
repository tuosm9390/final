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
	 .top-div{
	width: 63.7%;
	margin-left: 17%; 
	height: 70px; 

	}

	.searchCondition{

	margin-top: -50px;

	display: inline-block; 
	width: 100px;
	
	}

	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 40px;

	}
	
	#stockTb{
	width: 1000px;
	height: 300px;
	border-collapse: collapse;
	border: 1px solid black;
	margin-left: 17%;
	}
	td,th{
		border: 1px solid lightgray;
		align-content: center;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	}
	.hrDiv{
	border-bottom: 1px solid black;
	width: 1000px;
	margin-left: 17%;
	margin-top: 20px;
	}
	.btns{
	margin-left: 17%;
	margin-top: 10px;

	}
	#zone{
	border-bottom: 1px solid black;
	margin-bottom: 10px;
	width: 128px;  
	}
	#hdiv{
	margin-bottom: 20px;
	}
	
</style>
</head>
<body>
	
		
	

	<header>	
		
		<div class="top-div">
			<div id="titlemsg"><h1>물품상세</h1></div>
			<div id="zone"></div>
			
		</div><!-- top div end -->
	</header>
	<div class="hrDiv" id="hdiv"></div> 
		<div>
			<table id="stockTb">  
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
		<div class="hrDiv"></div>
		</div>
			<div class="btns"><button>수정</button>&nbsp;<button>닫기</button></div> 
	
	 
	
	<section>
	
	</section>
	
	<script>
		$(function(){
	       $("tr").click(function(){
	         $('.ui.modal').modal('show');
	  	    });  
		   }); 
		$(function(){
			$("tr[0]").click(function(){
				  $('.ui.modal').modal('hide');
			})
		})
		
		$(function(){
			$("#stockTb").find("td").mouseenter(function(){
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