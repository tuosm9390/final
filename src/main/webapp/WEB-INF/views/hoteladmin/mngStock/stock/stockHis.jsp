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
	width: 76.8%;
	height: 100px; 
	} 
	#Table{
	width: 1000px;
	border-collapse: collapse;
	}
	#sbody{
	margin-left: 17%;
	}
	#filter{
	margin-top:13px;
	width: 50px;
	height: 30px;
	}
	
	td,th{
	height: 40px;
	border: 1px solid lightgray;
		text-align: center;
	}
	th{
	background-color: #f7f7f7;
	color: #005B9E;
	}
	.searchCondition{
	float: right;
	margin-top: -50px;
	}
	.term{
	float:right;
	}
	#termId{
	margin-left: 10px;
	}
	#titlemsgg{
		width: 220px;
		height: 50px;
		margin-top: 40px;
	}
	#filterDiv{
	margin-top: -20px;
	}
	#filter{
	margin-top: 35px; 
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
		<div id="titlemsgg"><h1>재고변동이력</h1></div>
		<input type="text" name="serachCondition" class="searchCondition">
		<button class="searchCondition">Search</button>
		<div id="filterDiv">
		<p class="term">기간&nbsp;&nbsp;<input type="text" class="term" id="termId"><input type="text" class="term"></p>
		</div><!-- filterDiv -->
		<select style="width:80px;height:27px;" id="filter">
			<option value="money">금액</option>
 	 		<option value="check">수령</option>
		</select> 
		</div><!-- top div end -->
		
	
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
	<div class="btns"><button>인쇄</button>&nbsp;<button>Excel</button></div>

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
			console.log(bid);
		});
	});
	</script>
	
</body>
</html>