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
	width: 70.8%;
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
	
	}
	#searchZone{
	float: right;
	}
	#stockTb{
	width: 1000px;
	height: 560px;
	border-collapse: collapse;
	border: 1px solid black;
	margin-left: 17%;
	}
	td,th{
		border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	#hrDiv{
	border-bottom: 1px solid black;
	width: 1000px;
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
	#rclass{
	background-color: lightgray; 
	}
	#sbtn{
	margin-right: 110px;
	}

	
	
</style>
</head>
<body>
	
	

	<header>	
		<jsp:include page="../../common/menubar.jsp"/>
		<jsp:include page="../../common/productMenubar.jsp"/>
		
		<jsp:include page="../modal/mStockNowDetail.jsp"/>
		<jsp:include page="../modal/mStockNowEnroll.jsp"/>
		
	</header>
	<section>
		
		<div class="tabClass" id="tclass" align="center">물품현황
		</div>
		<div class="tabClass" id="rclass" align="center">수리현황
		</div>
		<div id="hidden">
		</div>
	<div class="top-div">
			<div id="titlemsg"><h1>물품현황</h1></div>
		<div id="searchZone">
			<select style="width:60px;height:25px;" id="filter" class="searchCondition" >
				<option value="money">금액</option>
 	 			<option value="check">수령</option>
			</select>
			<input type="text" name="serachCondition" class="searchCondition" style="height: 20px;width: 150px;"> 
			<button class="searchCondition" style="width: 50px; height: 25px" id="sbtn">검색</button>
		</div>
	</div><!-- top div end -->
		<div>
			<table id="stockTb">  
				<tr>  
					<th><input type="checkbox"></th>
					<th >품목코드</th>
					<th>품목명</th>
					<th>소분류</th>
					<th>재고수량</th>
					<th>공급가액</th>
					<th>제조사</th>
					<th>매입처</th>
					<th>품목구분</th>
				</tr>
				<c:forEach var="i" begin="1" end="10">
					<tr>
						<td><input type="checkbox"></td>
						<td style="color: #005B9E"><c:out value="품목코드"/></td>
						<td style="color: #005B9E"><c:out value="익스트림 울트라 명품조립 pc"/></td>
						<td><c:out value="소분류"/></td>
						<td><c:out value="재고수량"/></td>
						<td><c:out value="공급가액"/></td>
						<td><c:out value="제조사"/></td>
						<td><c:out value="매입처"/></td>
						<td><c:out value="품목구분"/></td>
					</tr>
				</c:forEach>
			</table>
		<div id="hrDiv"></div>
		</div>
			<div class="btns"><button id="new">신규</button>&nbsp;<button>Excel</button><button>선택삭제</button></div> 
	
	
	
	
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
				console.log(bid);
				$(".modal").fadeIn();
			});
		});
		

		
		//수리현황탭
		$(function(){
			$("#rclass").mouseenter(function(){
				$(this).css({"background":"lightgray","cursor":"pointer"});
			}).mouseout(function(){
				$(this).css({"background":"white"});
			}).click(function(){
				location.href='goRepairRequest.st';
			});
		});
		
		//신규등록
		$("#new").click(function(){
			$(".modalEnroll").fadeIn();
		});
		
		
		
		
	</script>
	
</body>
</html>