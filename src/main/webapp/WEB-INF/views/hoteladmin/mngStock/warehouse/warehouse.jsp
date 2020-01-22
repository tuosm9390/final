<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 .top-div{
	width: 78%;
	height: 100px; 
	} 
	#Table{
	width:100%;
	border-collapse: collapse;
	}
	
	#filter{
	}
	
	#Table td, #Table th{
	border: 1px solid lightgray;
		text-align: center;
		height: 33.1px; 
	}
	#Table th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	.searchCondition{
	margin-top: 32px;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsg{
		width: 220px;
		height: 36px;
		margin-top: 40px;
	}
	#filterDiv{
	margin-top: -20px;
	}
	#searchBtn{
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	#purSearch{
	border: 1px solid #919191;
	}
	#excel{
	background : white;
	color:green;
	border: 1px solid green;
	width: 68px;
	height: 25px;
	font-weight: bold;
	border-radius: 2px;
	}
	#print{
	color:#3498DB;
	background : white;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	}
	.btns{
	margin-top: 5px;
	margin-left: 43.1%;
	}
	#purDivv{
	height: 397.3px;
	border: 1px solid lightgray;
	width: 600px;
	margin-top: 2px;
	overflow-y:auto; 
	}
	#line{
		width: 96px;
		border-bottom: 1px solid black;
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
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>창고조회</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div>
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select> 
			<select class="searchCondition"  id="purSearch" style="margin-left:21.6% ; height: 26px;">
				<option value="default">기본옵션</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;">
		<button class="searchCondition" id="searchBtn">Search</button>
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	
	<table id="Table" style="">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">창고코드</th>
					<th style="color: #005B9E">창고명</th>
					<th style="color: #005B9E">사용</th>
				
				</tr>
				<c:forEach var="i" begin="1" end="15">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="20191231"/></td>
						<td style="color: #005B9E"><c:out value="이름모를창고"/></td>
						<td><c:out value="yes"/></td>
					
					</tr>
				</c:forEach>
			</table>
	</div><!-- purDivv end -->
	<div class="btns"><button id="print">신규</button></div>

	</section>
	
	
	<script>
	//테이블
	$(function(){
		$("#Table").find("td").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var bid = $(this).parent().children("td").eq(1).text();
			$(".modalDetail").fadeIn();
			console.log(bid);
		});
	});
	
	$("#print").click(function(){
		$(".modalEnroll").fadeIn();
	});
	</script>
</body>
</html>