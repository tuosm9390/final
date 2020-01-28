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
			<option value="money" hidden="hidden">검색조건</option>
 	 		<option value="allList">전체</option>
 	 		<option value="checkList">사용</option>
 	 		
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
		$("#filter").change(function(){
			if($(this).val()=='checkList'){
				
			}
		})
		
		
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
							var strgSite = data.searchList[i].strgSite;
							
							$("#myTb").append("<tr><td><input type='checkbox'></td><td style='color: #005B9E'>"+strgNo+"</td><td style='color: #005B9E'>"+strgName+"</td><td>"+strgStatus+"</td><td hidden='hidden'>"+strgSite+"</td></tr>");
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
		<script>
			function Enroll(){
				
			}
		</script>
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
						<td hidden="hidden"><c:out value="${i.strgSite }"/></td>
						
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
			var strgNo = $(this).parent().children("td").eq(1).text();
			var strgName = $(this).parent().children("td").eq(2).text();
			var strgStatus = $(this).parent().children("td").eq(3).text();
			var strgSite = $(this).parent().children("td").eq(4).text();
			//상세
			$.ajax({
				url:"detail.war",
				type:"post",
				data:{strgNo:strgNo},
				success:function(data){
					console.log(data)
				},
				error:function(status){
					console.log(status)
				}
			})
			
			//상세끝
			$("#detailCode").val(strgNo);
			$("#detailName").val(strgName);
			$("#detailStatus").val()
			if(strgStatus=='Y'){
				$("#yCheck").attr("checked","true");
			}else{
				$("#nCheck").attr("checked","true");
			}
			$("#detailArea").val(strgSite);
			
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
			var strgNo = $(this).parent().children("td").eq(1).text();
			var strgName = $(this).parent().children("td").eq(2).text();
			var strgStatus = $(this).parent().children("td").eq(3).text();
			var strgSite = $(this).parent().children("td").eq(4).text();
			
			$("#detailCode").val(strgNo);
			$("#detailName").val(strgName);
			$("#detailStatus").val()
			if(strgStatus=='Y'){
				$("#yCheck").attr("checked","true");
			}else{
				$("#nCheck").attr("checked","true");
			}
			$("#detailArea").val(strgSite);
			
			$(".modalDetail").fadeIn();
			
		});
	}
	
	$("#enrollBtn").click(function(){
	
		$("#updateWar").submit();
	})
	</script>
</body>
</html>