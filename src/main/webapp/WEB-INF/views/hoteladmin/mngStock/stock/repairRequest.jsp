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
	height: 100px; 
	margin-top: -50px;
	}

	.searchCondition{

	margin-top: -50px;
	display: inline-block; 
	width: 100px;
	
	}

	#titlemsg{
		width: 220px;
		height: 50px;
		margin-top: 60px;
	
	}
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 700px;
	height: 460px;
	border-collapse: collapse;
	border: 1px solid black;
	margin-top: -22px;
	}
	td,th{
		border: 1px solid lightgray;
		align-content: center;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	}
	#hrDiv{
	border-bottom: 1px solid black;
	width: 700px;
	margin-top: 20px;
	}
	.btns{
	margin-top: 10px;

	}
	.tabClass{
	display: inline-block;
	width: 120px;
	height: 30px;
	border: 1px solid gray;
	border-radius: 10px 10px 0px 0px;
	border-bottom: none;
	font-weight: bold;
	
	}
	#tclass{
		margin-top: 20px; 
	}


	
	
</style>
</head>
<body>
	
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		 <jsp:include page="../modal/mRepairDetail.jsp"/> 
	</header>
	<section>
		
		<div class="tabClass" id="tclass" align="center">물품현황
		</div>
		<div class="tabClass" id="rclass" align="center">수리현황
		</div>
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><h1>수리현황</h1></div>
			<select style="width: 80px; height: 25px;">
				<option>상태</option>
			</select>
	</div><!-- top div end -->
		<div>
			<table id="stockTb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">수리번호</th>
					<th style="color: #005B9E">개요</th>
					<th style="color: #005B9E">상태</th>
				
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="20191231"/></td>
						<td style="color: #005B9E"><c:out value="익스트림울트라명품조립pc컴외 2건"/></td>
						<td><c:out value="완료"/></td>
					
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns"><button>Excel</button><button>선택삭제</button></div> 
	
	
	
	
	</section>
	
	<script>
	
		//테이블
		$(function(){
			$("#stockTb").find("td").mouseenter(function(){
				$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent("tr").css({"background":"white"});
			}).click(function(){
				var bid = $(this).parent().children("td").eq(1).text();
				$(".modal").fadeIn();
				console.log(bid);
			});
		});
		
		//물품현황탭
		$(function(){
			$("#tclass").mouseenter(function(){
				$(this).css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}).click(function(){
				location.href='goStockNow.st';
			});
		});
		
		
	</script>
	
</body>
</html>