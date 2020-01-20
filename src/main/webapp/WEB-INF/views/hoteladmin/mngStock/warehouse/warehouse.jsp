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
		font-size: 30px;
		font-weight: bold;
	
	}
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 700px;
	height: 460px;
	border-collapse: collapse;
	border: 1px solid black;
	margin-left: 17%;
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
	margin-left: 17%;
	margin-top: 20px;
	}
	.btns{
	margin-left: 17%;
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
	margin-left: 20px;
	}
		#hrDiv2{
	border-bottom: 1px solid black;
	width: 700px;
	

	}

	
	
</style>
</head>
<body>
	
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		 <jsp:include page="../modal/mWarehouseDetail.jsp"/> 
		  <jsp:include page="../modal/mWarehouseEnroll.jsp"/> 
	</header>
	<section>
	<div class="top-div">
			<div id="titlemsg">창고관리</div>
		<div id="hrDiv2"></div> 
	</div><!-- top div end -->
		<div>
			<table id="stockTb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">창고코드</th>
					<th style="color: #005B9E">창고명</th>
					<th style="color: #005B9E">사용</th>
				
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="20191231"/></td>
						<td style="color: #005B9E"><c:out value="이름모를창고"/></td>
						<td><c:out value="yes"/></td>
					
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns"><button id="new">신규</button>&nbsp;<button>사용중단/재사용</button></div> 
	
	
	
	
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
		//수리현황탭
		$(function(){
			$("#tclass").mouseenter(function(){
				$(this).css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}).click(function(){
			
			});
		});
		
		//수리현황탭
		$(function(){
			$("#rclass").mouseenter(function(){
				$(this).css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}).click(function(){
			
			});
		});
		
		$("#new").click(function(){
			$(".modalEnroll").fadeIn();
		});
		
	</script>
	
</body>
</html>