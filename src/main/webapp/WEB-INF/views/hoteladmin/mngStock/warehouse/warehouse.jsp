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
		  margin-top: 17px;
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
	color:white;
	background : #3498DB;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	font-weight: bold;
	width: 60px;
	}
	.btns{
	margin-top: 5px;
	margin-left: 41.6%;
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
			<select class="searchCondition"  id="purSearch" style="margin-left:21.8% ; height: 26px;">
				<option value="default" hidden="hidden">검색조건</option>
				<option value="code">창고코드</option>
				<option value="name">창고이름</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;border: 1px solid gray;" id="searchValue">
		<button class="searchCondition" id="searchBtn" style="width: 56px;" onclick="searchStrg()">검색</button>
		</div>
		
		</div>
		</div><!-- top div end -->
		<!-- 검색시작 -->
		<script>
			function searchStrg() {
				var searchCondition = $("#purSearch").val();
				var searchValue = $("#searchValue").val();
				
				console.log("실행");
					$.ajax({
						url:"search.war",
						type:"get",
						data:{searchCondition:searchCondition,
							searchValue:searchValue
							},
						success: function(data){
							console.log(data)
							$("#myTb").empty();
							
							for(var i=0;i<data.searchList.length;i++){
							console.log(data.searchList[i].strgNo)
							
							var strgNo =data.searchList[i].strgNo;
							var strgName =data.searchList[i].strgName;
							var strgStatus =data.searchList[i].strgStatus;
							
							$("#myTb").append("<tr><td><input type='checkbox'></td><td style='color: #005B9E'>"+strgNo+"</td><td style='color: #005B9E'>"+strgName+"</td><td>"+strgStatus+"</td></tr>");
							}
					
							click();
							
						},
						error:function(status){
							console.log(status);
						}
					});
					return false;
			}
		</script>
		<!-- 검색 종료 -->
	<div id="purDivv">
	
	<table id="Table" style="">  
				<tr>  
					<th><input type="checkbox"></th>
					<th style="color: #005B9E">창고코드</th>
					<th style="color: #005B9E">창고명</th>
					<th style="color: #005B9E">사용</th>
				
				</tr>
				<tbody id="myTb">
				<c:forEach var="i" items="${strgList }">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="${i.strgNo }"/></td>
						<td style="color: #005B9E"><c:out value="${i.strgName}"/></td>
						<td><c:out value="${i.strgStatus}"/></td>
					
					</tr>
				</c:forEach>
				</tbody>
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
	
	function click() {
		$("#Table").find("td").mouseenter(function(){
			$(this).parent("tr").css({"background":"lightgray","cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent("tr").css({"background":"white"});
		}).click(function(){
			var bid = $(this).parent().children("td").eq(1).text();
			$(".modalDetail").fadeIn();
			console.log(bid);
		});
	}
	</script>
</body>
</html>