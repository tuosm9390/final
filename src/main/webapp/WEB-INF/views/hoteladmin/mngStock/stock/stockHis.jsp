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
	position: relative;
    bottom: 28px;
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
	color:#3498DB;
	background : white;
	border: 1px solid #3498DB;
	box-sizing: border-box;
	height: 25px;
	font-weight: bold;
	}
	.btns{
	margin-top: 5px;
	margin-left: 67.9%;
	}
	#purDivv{
	height: 397.3px;
	border: 1px solid lightgray;
	width: 1000px;
	margin-top: 2px;
	}
	#line{
		width: 145px;
		border-bottom: 1px solid black;
	}
</style>
</head>
<body>
	
<header>	
	<jsp:include page="../../common/menubar.jsp"/>
	<jsp:include page="../../common/productMenubar.jsp"/>
</header>
	<section id="sbody">

		<div class="top-div">
		<div id="titlemsg"><h1>재고변동이력</h1></div>
		<div id=line></div>
		<div id="searchZone" style="width: 1000px;"> 
		<div>
			<select class="searchCondition"  id="purSearch" style="margin-left:70% ; height: 26px;">
				<option value="default">검색조건</option>
			</select>
		<input type="text" name="serachCondition" class="searchCondition" style=";height: 20px;width: 150px;">
		<button class="searchCondition" id="searchBtn" style="width: 56px;">검색</button>
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select> 
		</div>
		
		</div>
		</div><!-- top div end -->
		
	<div id="purDivv">
	
	<table id="Table">
		<tr>
			<th><input type=checkbox></th>
			<th>No</th>
			<th>구분</th>
			<th>변동일자</th>
			<th>창고</th>
			<th>구역명</th>
			<th>품목</th>
			<th>수량</th>
			<th>담당자</th>
		
		</tr>
		
		
		 <c:forEach var="list" begin="1" end="10">
		<tr>
		<td><input type=checkbox></td>
		<td>${list }</td>
		<td><c:out value="구분구분"/></td>
		<td><c:out value="2020-01-12"/></td>
		<td><c:out value="aaaa창고"/></td>
		<td><c:out value="b-c8"/></td>
		<td><c:out value="코카콜라 사이다"/></td>
		<td><c:out value="30box"/></td>
		<td><c:out value="김상찬"/></td>
		</tr>
		</c:forEach>
	
	</table>
	</div><!-- purDivv end -->
	<div class="btns"><button id="excel">Excel</button>&nbsp;<button id="print">인쇄</button></div>

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
			$(".modal").fadeIn();
			console.log(bid);
		});
	});
	
	$("#mState").click(function(){
		$(".modalState").fadeIn();
	});
	</script>
</body>
</html>